import 'package:alfie/api/grpc/grpc_client.dart';
import 'package:alfie/models/attachment_type.dart';
import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_type.dart';
import 'package:alfie/models/deck.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/models/group.dart';
import 'package:alfie/models/text_type.dart';
import 'package:alfie/models/theme_color.dart';
import 'package:alfie/api/grpc/protobuf/alfie_api.pbgrpc.dart';
import 'package:alfie/repositories/database.dart';
import 'package:alfie/services/card_review_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/settings_provider.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/card_review_rating.dart';
import '../repositories/card_review_repository.dart';
import '../repositories/deck_card_repository.dart';
import '../repositories/deck_repository.dart';
import '../repositories/group_repository.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        ElevatedButton(
            onPressed: () async {
              try {
                var reply = await GrpcClient.instance.client
                    .login(LoginRequest(email: "radu.george.mihai.21@gmail.com", password: "test"));
                print("----------------------------------- $reply");
              } catch (err) {
                if (err.runtimeType == GrpcError) {
                  print("?????????");
                  (err as GrpcError).message;
                }
                print("---------------------------------${err.runtimeType}-- err received: $err"); // err.message
              }
            },
            child: Text("test grpc")),
        Consumer<UserProvider>(
            builder: (context, userProvider, child) => Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await userProvider.updateUser(
                            userProvider.user.copyWith(email: "", verified: false, loginCanCheck2FA: false));
                      },
                      child: Text("set email to empty"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await userProvider
                            .updateUser(userProvider.user.copyWith(verified: false, loginCanCheck2FA: false));
                      },
                      child: Text("set verified to false"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await userProvider.updateUser(userProvider.user.copyWith(loginCanCheck2FA: false));
                      },
                      child: Text("set 2fa login check to false"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await userProvider.updateUser(userProvider.user.copyWith(token: null));
                      },
                      child: Text("set token null"),
                    ),
                    Text(userProvider.user.toString()),
                  ],
                )),
        const Text('Market'),
        ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, firstDecksRoute);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const DeckView()))
            },
            child: const Text("go to deck")),
        Text(AppLocalizations.of(context)!.homePage),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => DropdownButton(
            value: settingsProvider.settings.languageCode,
            items: LanguageService.languagesList
                .map((e) => DropdownMenuItem(value: e.languageCode, child: Text("${e.flag} ${e.name}")))
                .toList(),
            onChanged: (newLanguageCode) async {
              if (newLanguageCode != null) {
                await settingsProvider.updateLanguageCode(newLanguageCode);
              }
            },
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              //               final int? id;
              // final int cardId;
              // final CardReviewRating rating;
              // final Duration timeToAnswer;
              // final DateTime reviewTimestamp;
              CardReview cardReview = new CardReview(
                  cardId: 3,
                  rating: CardReviewRating.easy,
                  timeToAnswer: Duration(seconds: 100),
                  reviewTimestamp: DateTime.now());
              await CardReviewService.instance.createCardReview(cardReview);
            },
            child: const Text("add review")),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateLanguageCode("ro");
              },
              child: const Text("change to ro")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateLanguageCode("en");
              },
              child: const Text("change to en")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateThemeColor(ThemeColor.purple);
              },
              child: const Text("change to theem purple")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateThemeColor(ThemeColor.blue);
              },
              child: const Text("change to theem blue")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateThemeMode(ThemeMode.system);
              },
              child: const Text("change to theme system")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateThemeMode(ThemeMode.light);
              },
              child: const Text("change to theme light")),
        ),
        Consumer<SettingsProvider>(
          builder: (context, settingsProvider, child) => ElevatedButton(
              onPressed: () async {
                await settingsProvider.updateThemeMode(ThemeMode.dark);
              },
              child: const Text("change to theme dark")),
        ),
        Consumer<SettingsProvider>(
            builder: (context, settingsProvider, child) => ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.createLocalDatabaseBackup();
                },
                child: const Text("backup db"))),
        Consumer<SettingsProvider>(
            builder: (context, settingsProvider, child) => ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.restoreDatabaseFromLocalBackup();
                  await settingsProvider.refreshSettings();
                },
                child: const Text("restore db"))),
        ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance.deleteDatabase();
            },
            child: const Text("delete db")),
        ElevatedButton(
            onPressed: () async {
              Group group = Group(name: "group 1", color: ThemeColor.purple);
              await GroupRepository.instance.createGroup(group);
            },
            child: const Text("add group")),
        ElevatedButton(
            onPressed: () async {
              Deck deck = Deck(name: "deck", description: "desc", groupId: 1);
              await DeckRepository.instance.createDeck(deck);
            },
            child: const Text("add deck")),
        ElevatedButton(
            onPressed: () async {
              DeckCard card = DeckCard(
                  type: CardType.basic,
                  deckId: 1,
                  question: "q",
                  answer: "a",
                  questionTextType: TextType.simple,
                  answerTextType: TextType.simple,
                  questionAttachmentType: AttachmentType.none,
                  answerAttachmentType: AttachmentType.none,
                  timeToAnswer: Duration(minutes: 1));
              await DeckCardRepository.instance.createCard(card);
            },
            child: const Text("add card")),
        ElevatedButton(
            onPressed: () async {
              CardReview cardReview =
                  CardReview(cardId: 1, rating: CardReviewRating.good, timeToAnswer: Duration(minutes: 1));
              CardReviewRepository.instance.createCardReview(cardReview);
            },
            child: const Text("add card review log")),
        ElevatedButton(
            onPressed: () async {
              // List<Group> groups =
              //     await GroupService.instance.getGroupsWithDecks();
              // List<CardReview> cardReviews = await CardReviewRepository
              //     .instance
              //     .getCardReviewsByListOFcardIds([5, 6, 7]);
              // cardReviews.forEach((element) {
              //   print(element.toString());
              // });

              // await CardReviewService.instance
              //     .deleteCardReviewsOlderThanOneWeek();
              // print("groups");
              // groups.forEach((element) {
              //   print(element.toString());
              // });
            },
            child: const Text("see groups with decks"))
      ]))),
    );
  }
}

class DeckView extends StatelessWidget {
  const DeckView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck View'),
      ),
      body: Center(
          child: Column(children: [
        ElevatedButton(onPressed: () => {Navigator.pop(context)}, child: const Text("go back")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "test");
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const DeckView2()))
            },
            child: const Text("go to deck 2"))
      ])),
    );
  }
}

class DeckView2 extends StatelessWidget {
  const DeckView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deck View 2'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => {Navigator.pop(context)}, child: const Text("go back")),
      ),
    );
  }
}
