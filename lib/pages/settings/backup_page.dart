import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pbgrpc.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pbjson.dart';
import 'package:alfie/classes/deck_card_media.dart';
import 'package:alfie/repositories/database.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/card_review_service.dart';
import 'package:alfie/services/deck_card_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/media_service.dart';
import 'package:alfie/services/settings_provider.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as widgets_async;
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});

  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<String> _getBackupPath;
  bool _loading = false;

  @override
  void initState() {
    _getBackupPath = MediaService.instance.getBackupPath();
    super.initState();
  }

  createLocalBackup() async {
    setState(() => _loading = true);
    await DatabaseHelper.instance.createLocalDatabaseBackup();
    setState(() => _loading = false);
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).successInCreatingLocalBackupFile));
  }

  loadLocalBackup(UserProvider userProvider, SettingsProvider settingsProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).loadLocalBackupConfirmationMessage,
        confirmFunctionCallback: () async {
          setState(() => _loading = true);
          bool successfulResult = await DatabaseHelper.instance.restoreDatabaseFromLocalBackup();
          if (!successfulResult) {
            setState(() => _loading = false);
            WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
                _scaffoldKey, LanguageService.translation(context).errorInRestoringDatabaseFromLocalBackup));
            return;
          }

          await userProvider.refreshUser();
          await settingsProvider.refreshSettings();
          setState(() => _loading = false);
          WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
              _scaffoldKey, LanguageService.translation(context).successInRestoringDatabaseFromLocalBackup));
        },
      ),
    );
  }

  removeUnusedMedia() async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).removeUnusedLocalMediaFilesConfirmation,
        confirmFunctionCallback: () async {
          setState(() => _loading = true);
          bool successfulResult = await MediaService.instance.removeUnusedMedia();
          if (!successfulResult) {
            setState(() => _loading = false);
            WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
                _scaffoldKey, LanguageService.translation(context).errorInRemovingUnusedLocalMediaFiles));
            return;
          }

          setState(() => _loading = false);
          WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
              _scaffoldKey, LanguageService.translation(context).successInRemovingUnusedLocalMediaFiles));
        },
      ),
    );
  }

  callFunctionWithWarningIfNotUsingWiFi(Function callbackFunction) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi) {
      await callbackFunction();
      return;
    }

    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext _) => CustomDialog(
            contentText: LanguageService.translation(context).usingMobileDataConfirmationMessage,
            confirmFunctionCallback: () async => await callbackFunction()),
      );
    }
  }

  _createCloudBackupAction(UserProvider userProvider) async {
    var reply = await GrpcClient.instance.client.createUploadURLForCardsDatabaseBackup(
      CreateUploadURLForCardsDatabaseBackupRequest(),
      options: getCallOptionsWithAuthorization(userProvider),
    );

    bool successfulResult = await DatabaseHelper.instance.createCloudDatabaseBackup(
      reply.databaseUploadURL,
      "PUT",
      reply.databaseFileName,
    );
    if (!successfulResult) {
      throw Exception("Error in creating cloud database backup");
    }
  }

  createCloudBackup(UserProvider userProvider) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    try {
      setState(() => _loading = true);

      await _createCloudBackupAction(userProvider);

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).uploadDatabaseToCloudSuccessfully));
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).uploadDatabaseToCloudError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            "${LanguageService.translation(context).uploadDatabaseToCloudError} ${(err as GrpcError).message}"));
      }
    }
  }

  loadCloudBackup(UserProvider userProvider, SettingsProvider settingsProvider) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext _) => CustomDialog(
        contentText: LanguageService.translation(context).loadCloudBackupConfirmationMessage,
        confirmFunctionCallback: () async {
          try {
            setState(() => _loading = true);

            var reply = await GrpcClient.instance.client.createDownloadURLForCardsDatabaseBackup(
              CreateDownloadURLForCardDatabaseBackupRequest(),
              options: getCallOptionsWithAuthorization(userProvider),
            );

            bool successfulResult =
                await DatabaseHelper.instance.restoreDatabaseFromCloudBackup(reply.databaseDownloadURL);
            if (!successfulResult) {
              throw Exception("Error in restoring database from cloud backup");
            }

            await userProvider.refreshUser();
            await settingsProvider.refreshSettings();

            setState(() => _loading = false);
            if (context.mounted) {
              WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
                  _scaffoldKey, LanguageService.translation(context).loadDatabaseFromCloudSuccessfully));
            }
          } catch (err) {
            setState(() => _loading = false);
            if (context.mounted) {
              if (err.runtimeType != GrpcError) {
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).loadDatabaseFromCloudError));
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
                    "${LanguageService.translation(context).loadDatabaseFromCloudError} ${(err as GrpcError).message}"));
              }
            }
          }
        },
      ),
    );
  }

  uploadCloudMedia(UserProvider userProvider) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    try {
      setState(() => _loading = true);

      List<DeckCardMedia> cardsWithMedia = await DeckCardService.instance.getCardsMedia();
      List<String> mediaFilesToBackup = MediaService.instance.getMediaFilesNamesToBackup(cardsWithMedia);

      if (mediaFilesToBackup.isEmpty) {
        setState(() => _loading = false);
        WidgetsBinding.instance.addPostFrameCallback((_) =>
            showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).mediaFilesAlreadySyncedWithCloud));
        return;
      }

      var reply = await GrpcClient.instance.client.createMediaFilesUploadURLs(
        CreateMediaFilesUploadURLsRequest(fileNames: mediaFilesToBackup),
        options: getCallOptionsWithAuthorization(userProvider),
      );

      await MediaService.instance.backupMediaToCloud(reply.mediaFilesUploadURLs, mediaFilesToBackup);
      await DeckCardService.instance.markMediaFromCardsAsBackedUpInCloud(cardsWithMedia);
      await _createCloudBackupAction(userProvider);

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).uploadMediaToCloudSuccessfully));
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).uploadMediaToCloudError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            "${LanguageService.translation(context).uploadMediaToCloudError} ${(err as GrpcError).message}"));
      }
    }
  }

  downloadCloudMedia(UserProvider userProvider) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    try {
      setState(() => _loading = true);

      List<DeckCardMedia> cardsWithMedia = await DeckCardService.instance.getCardsMedia();
      List<String> mediaFilesToDownload = await MediaService.instance.getMediaFileNamesToDownload(cardsWithMedia);

      if (mediaFilesToDownload.isEmpty) {
        setState(() => _loading = false);
        WidgetsBinding.instance.addPostFrameCallback((_) =>
            showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).mediaFilesAlreadySyncedWithCloud));
        return;
      }

      var reply = await GrpcClient.instance.client.createMediaFilesDownloadURLs(
        CreateMediaFilesDownloadURLsRequest(fileNames: mediaFilesToDownload),
        options: getCallOptionsWithAuthorization(userProvider),
      );

      await MediaService.instance.downloadMediaFromCloud(reply.mediaFilesDownloadURLs, reply.mediaFilesNames);

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).downloadMediaFromCloudSuccessfully));
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).downloadMediaFromCloudError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            "${LanguageService.translation(context).downloadMediaFromCloudError} ${(err as GrpcError).message}"));
      }
    }
  }

  removeUnusedCloudMedia(UserProvider userProvider) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    try {
      setState(() => _loading = true);

      List<DeckCardMedia> cardsWithMedia = await DeckCardService.instance.getCardsMedia();
      List<String> activeMediaFileNames = MediaService.instance.getActiveMediaFilesNames(cardsWithMedia);

      var reply = await GrpcClient.instance.client.deleteUnusedMediaFiles(
        DeleteUnusedMediaFilesRequest(activeFileNames: activeMediaFileNames),
        options: getCallOptionsWithAuthorization(userProvider),
      );

      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
          _scaffoldKey, LanguageService.translation(context).removeUnusedMediaFromCloudSuccessfully));
    } catch (err) {
      setState(() => _loading = false);
      if (err.runtimeType != GrpcError) {
        WidgetsBinding.instance.addPostFrameCallback((_) =>
            showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).removeUnusedMediaFromCloudError));
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            "${LanguageService.translation(context).removeUnusedMediaFromCloudError} ${(err as GrpcError).message}"));
      }
    }
  }

  removeReviewsOlderThan(Duration duration) {
    Function removeReviewsOlderThanFunction;
    String confirmationMessage;
    if (duration.compareTo(const Duration(days: 7)) == 0) {
      removeReviewsOlderThanFunction = CardReviewService.instance.deleteCardReviewsOlderThanOneWeek;
      confirmationMessage = LanguageService.translation(context).removeReviewsOlderThanOneWeekConfirmationMessage;
    } else if (duration.compareTo(const Duration(days: 30)) == 0) {
      removeReviewsOlderThanFunction = CardReviewService.instance.deleteCardReviewsOlderThanOneMonth;
      confirmationMessage = LanguageService.translation(context).removeReviewsOlderThanOneMonthConfirmationMessage;
    } else if (duration.compareTo(const Duration(days: 180)) == 0) {
      removeReviewsOlderThanFunction = CardReviewService.instance.deleteCardReviewsOlderThanHalfAYear;
      confirmationMessage = LanguageService.translation(context).removeReviewsOlderThanHalfAYearConfirmationMessage;
    } else {
      removeReviewsOlderThanFunction = CardReviewService.instance.deleteCardReviewsOlderThanOneYear;
      confirmationMessage = LanguageService.translation(context).removeReviewsOlderThanOneYearConfirmationMessage;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: confirmationMessage,
        confirmFunctionCallback: () async {
          setState(() => _loading = true);
          bool successResult = await removeReviewsOlderThanFunction();
          if (!successResult) {
            setState(() => _loading = false);
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).errorInRemovingReviews));
            return;
          }
          setState(() => _loading = false);
          WidgetsBinding.instance.addPostFrameCallback((_) =>
              showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).successfullyRemovedReviews));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getBackupPath,
      builder: (context, snapshot) {
        if (snapshot.connectionState == widgets_async.ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).backupAndStorage)),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          Navigator.pushNamed(context, notFound);
          return const SizedBox.shrink();
        } else {
          String backupPath = snapshot.data!;

          if (_loading) {
            return Scaffold(
              appBar: AppBar(title: Text(LanguageService.translation(context).backupAndStorage)),
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(LanguageService.translation(context).backupAndStorage),
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text("${LanguageService.translation(context).backupInfo} $backupPath"),
                        )
                      ],
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: createLocalBackup,
                      child: Row(
                        children: [
                          Icon(
                            Icons.save_alt_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).createLocalBackup)
                        ],
                      ),
                    ),
                    const Divider(),
                    Consumer2<UserProvider, SettingsProvider>(
                      builder: (context, userProvider, settingsProvider, child) => TextButton(
                        onPressed: () => loadLocalBackup(userProvider, settingsProvider),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings_backup_restore_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).loadLocalBackup)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: removeUnusedMedia,
                      child: Row(
                        children: [
                          Icon(
                            Icons.cleaning_services_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).removeUnusedMedia)
                        ],
                      ),
                    ),
                    const Divider(),
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) => TextButton(
                        onPressed: () async =>
                            callFunctionWithWarningIfNotUsingWiFi(() async => createCloudBackup(userProvider)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.backup_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).createCloudBackup)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Consumer2<UserProvider, SettingsProvider>(
                      builder: (context, userProvider, settingsProvider, child) => TextButton(
                        onPressed: () async => callFunctionWithWarningIfNotUsingWiFi(
                            () async => loadCloudBackup(userProvider, settingsProvider)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cloud_download_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).loadCloudBackup)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) => TextButton(
                        onPressed: () async =>
                            callFunctionWithWarningIfNotUsingWiFi(() async => uploadCloudMedia(userProvider)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).uploadCloudMedia)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) => TextButton(
                        onPressed: () async =>
                            callFunctionWithWarningIfNotUsingWiFi(() async => downloadCloudMedia(userProvider)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cloud_download_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).downloadCloudMedia)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) => TextButton(
                        onPressed: () async =>
                            callFunctionWithWarningIfNotUsingWiFi(() async => removeUnusedCloudMedia(userProvider)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cleaning_services_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(LanguageService.translation(context).removeUnusedCloudMedia)
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: () => removeReviewsOlderThan(const Duration(days: 7)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_delete_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).removeReviewsOlderThanOneWeek)
                        ],
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: () => removeReviewsOlderThan(const Duration(days: 30)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_delete_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).removeReviewsOlderThanOneMonth)
                        ],
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: () => removeReviewsOlderThan(const Duration(days: 180)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_delete_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).removeReviewsOlderThanHalfAYear)
                        ],
                      ),
                    ),
                    const Divider(),
                    TextButton(
                      onPressed: () => removeReviewsOlderThan(const Duration(days: 365)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_delete_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(LanguageService.translation(context).removeReviewsOlderThanOneYear)
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
