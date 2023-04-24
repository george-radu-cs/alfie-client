import 'dart:io';
import 'dart:typed_data';

import 'package:alfie/classes/deck_card_media.dart';
import 'package:alfie/services/deck_card_service.dart';
import 'package:alfie/services/permissions_service.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import 'package:http/http.dart' as http;

class MediaService {
  MediaService._privateConstructor();
  final _uuid = const Uuid();
  final picturesDirectoryName = "Pictures";
  static final MediaService instance = MediaService._privateConstructor();

  String getNewNameForQuestionImage() {
    return "question-image-${_uuid.v4()}.jpeg";
  }

  String getNewNameForAnswerImage() {
    return "answer-image-${_uuid.v4()}.jpeg";
  }

  Future<String> getBackupPath() async {
    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null) {
      return "N/A";
    }

    return externalStorageDirectory.path;
  }

  Future<bool> saveCardImages(String? questionAttachmentLocalURI, Uint8List questionImageDataBytes,
      String? answerAttachmentLocalURI, Uint8List answerImageDataBytes) async {
    if (questionImageDataBytes.isEmpty && answerImageDataBytes.isEmpty) {
      return true;
    }

    // check storage permissions
    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return false;
    }

    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null || !externalStorageDirectory.existsSync()) {
      return false;
    }

    if (questionImageDataBytes.isNotEmpty) {
      String questionImagePath = join(externalStorageDirectory.path, picturesDirectoryName, questionAttachmentLocalURI);
      File questionImageFile = File(questionImagePath);
      if (!await questionImageFile.exists()) {
        await questionImageFile.create(recursive: true);
      }
      await questionImageFile.writeAsBytes(questionImageDataBytes);
    }
    if (answerImageDataBytes.isNotEmpty) {
      String answerImagePath = join(externalStorageDirectory.path, picturesDirectoryName, answerAttachmentLocalURI);
      File answerImageFile = File(answerImagePath);
      if (!await answerImageFile.exists()) {
        await answerImageFile.create(recursive: true);
      }
      await answerImageFile.writeAsBytes(answerImageDataBytes);
    }

    return true;
  }

  Future<List<String>> getExistingMediaFileNames() async {
    // check storage permissions
    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      throw Exception("Didn't grant permission for external storage");
    }

    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null || !externalStorageDirectory.existsSync()) {
      throw Exception("Couldn't get the external storage");
    }

    Directory mediaDirectory = Directory(join(externalStorageDirectory.path, picturesDirectoryName));

    return mediaDirectory
        .listSync(recursive: true)
        .map((e) => e.path.split("$picturesDirectoryName/")[1]) // get the file name from the path
        .toList(growable: false);
  }

  Future<bool> removeUnusedMedia() async {
    Directory? externalStoragePath = await getExternalStorageDirectory();
    if (externalStoragePath == null || !externalStoragePath.existsSync()) {
      return false;
    }

    List<String> activeMediaFiles = await DeckCardService.instance.getMediaPathsFromAllDecks();
    List<String> existingMediaFiles = await MediaService.instance.getExistingMediaFileNames();

    List<String> fileNamesToDelete = [];
    for (var element in existingMediaFiles) {
      if (!activeMediaFiles.contains(element)) {
        fileNamesToDelete.add(element);
      }
    }
    await Future.wait(
      fileNamesToDelete.map((e) => File(join(externalStoragePath.path, picturesDirectoryName, e)).delete()),
    );
    return true;
  }

  Future<bool> backupMediaToCloud(List<String> mediaFilesUploadURLs, List<String> mediaFileNames) async {
    if (mediaFilesUploadURLs.length != mediaFileNames.length) {
      throw Exception("The number of files to upload and their names don't match");
    }

    // check storage permissions
    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return false;
    }

    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null || !externalStorageDirectory.existsSync()) {
      return false;
    }

    for (var i = 0; i < mediaFilesUploadURLs.length; i++) {
      String mediaFilePath = join(externalStorageDirectory.path, picturesDirectoryName, mediaFileNames[i]);
      File mediaFile = File(mediaFilePath);
      if (!mediaFile.existsSync()) {
        continue;
      }

      final request = http.Request("PUT", Uri.parse(mediaFilesUploadURLs[i]));
      request.bodyBytes = mediaFile.readAsBytesSync();
      final response = await request.send();
    }

    return true;
  }

  Future<bool> downloadMediaFromCloud(List<String> mediaFilesDownloadURLs, List<String> mediaFileNames) async {
    if (mediaFilesDownloadURLs.length != mediaFileNames.length) {
      throw Exception("The number of files to download and their names don't match");
    }

    // check storage permissions
    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return false;
    }

    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null || !externalStorageDirectory.existsSync()) {
      return false;
    }

    for (var i = 0; i < mediaFilesDownloadURLs.length; i++) {
      final response = await http.get(Uri.parse(mediaFilesDownloadURLs[i]));
      if (response.statusCode != 200) {
        throw Exception("Couldn't download the file");
      }

      String mediaFilePath = join(externalStorageDirectory.path, picturesDirectoryName, mediaFileNames[i]);
      File(mediaFilePath).writeAsBytesSync(response.bodyBytes);
    }

    return true;
  }

  List<String> getMediaFilesNamesToBackup(List<DeckCardMedia> cardsWithMedia) {
    List<String> mediaFilesToBackup = [];
    for (var card in cardsWithMedia) {
      if (isNotMediaFileBackedUpInCloud(card.questionAttachmentLocalURI, card.questionAttachmentCloudURI)) {
        mediaFilesToBackup.add(card.questionAttachmentLocalURI!);
      }
      if (isNotMediaFileBackedUpInCloud(card.answerAttachmentLocalURI, card.answerAttachmentCloudURI)) {
        mediaFilesToBackup.add(card.answerAttachmentLocalURI!);
      }
    }
    return mediaFilesToBackup;
  }

  Future<List<String>> getMediaFileNamesToDownload(List<DeckCardMedia> cardsWithMedia) async {
    // check storage permissions
    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return [];
    }

    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    if (externalStorageDirectory == null || !externalStorageDirectory.existsSync()) {
      return [];
    }

    List<String> mediaFilesToDownload = [];
    for (var card in cardsWithMedia) {
      if (isMediaFileBackedUpInCloud(card.questionAttachmentLocalURI, card.questionAttachmentCloudURI)) {
        File mediaFile =
            File(join(externalStorageDirectory.path, picturesDirectoryName, card.questionAttachmentLocalURI!));
        if (!mediaFile.existsSync()) {
          mediaFilesToDownload.add(card.questionAttachmentLocalURI!);
        }
      }
      if (isMediaFileBackedUpInCloud(card.answerAttachmentLocalURI, card.answerAttachmentCloudURI)) {
        File mediaFile =
            File(join(externalStorageDirectory.path, picturesDirectoryName, card.answerAttachmentLocalURI!));
        if (!mediaFile.existsSync()) {
          mediaFilesToDownload.add(card.answerAttachmentLocalURI!);
        }
      }
    }
    return mediaFilesToDownload;
  }

  List<String> getActiveMediaFilesNames(List<DeckCardMedia> cardsWithMedia) {
    List<String> activeMediaFiles = [];
    for (var card in cardsWithMedia) {
      if (isMediaURIReferencingAFile(card.questionAttachmentLocalURI)) {
        activeMediaFiles.add(card.questionAttachmentLocalURI!);
      }
      if (isMediaURIReferencingAFile(card.answerAttachmentLocalURI)) {
        activeMediaFiles.add(card.answerAttachmentLocalURI!);
      }
    }
    return activeMediaFiles;
  }

  bool isNotMediaFileBackedUpInCloud(String? mediaLocalURI, String? mediaCloudURI) {
    return (mediaLocalURI != null && mediaLocalURI.isNotEmpty) && (mediaCloudURI == null || mediaCloudURI.isEmpty);
  }

  bool isMediaFileBackedUpInCloud(String? mediaLocalURI, String? mediaCloudURI) {
    return (mediaLocalURI != null && mediaLocalURI.isNotEmpty) && (mediaCloudURI != null && mediaCloudURI.isNotEmpty);
  }

  bool isMediaURIReferencingAFile(String? fileURI) {
    return fileURI != null && fileURI.isNotEmpty;
  }
}
