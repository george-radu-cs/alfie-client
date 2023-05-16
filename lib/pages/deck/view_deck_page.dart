import 'package:alfie/classes/create_edit_card_page_arguments.dart';
import 'package:alfie/classes/create_edit_deck_page_arguments.dart';
import 'package:alfie/classes/preview_deck.dart';
import 'package:alfie/classes/study_deck_page_arguments.dart';
import 'package:alfie/models/deck.dart';
import 'package:alfie/models/group.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/card_review_service.dart';
import 'package:alfie/services/deck_card_service.dart';
import 'package:alfie/services/deck_service.dart';
import 'package:alfie/services/group_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:flutter/material.dart';

class ViewDeckPage extends StatefulWidget {
  final int deckId;
  final Function closeWidgetCallback;
  const ViewDeckPage({Key? key, required this.deckId, required this.closeWidgetCallback}) : super(key: key);

  @override
  State<ViewDeckPage> createState() => _ViewDeckPageState();
}

class _ViewDeckPageState extends State<ViewDeckPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ValueNotifier<bool> _loading = ValueNotifier(true);
  late Future<PreviewDeck> _getDeck;

  @override
  void initState() {
    _getDeck = getPreviewDeck();
    super.initState();
  }

  Future<PreviewDeck> getPreviewDeck() async {
    _loading.value = true;
    Deck deck = await DeckService.instance.getDeckById(widget.deckId);
    int numberOfCards = await DeckCardService.instance.getDeckCardsCount(widget.deckId);
    int numberOfReviews = await CardReviewService.instance.getNumberOfCardReviewsForDeckId(widget.deckId);
    // get deck card reviews;
    _loading.value = false;
    return PreviewDeck(deck: deck, numberOfCards: numberOfCards, numberOfReviews: numberOfReviews);
  }

  refreshData() {
    setState(() {
      _getDeck = getPreviewDeck();
    });
  }

  openEditDeckInformationScreen(Deck deck) {
    Navigator.pushNamed(context, editDeckRoute,
        arguments: CreateEditDeckPageArguments(
          groupId: deck.groupId,
          deck: deck,
          closeWidgetCallback: refreshData,
        ));
  }

  openAddCardToDeckScreen() {
    Navigator.pushNamed(context, addDeckCardRoute,
        arguments: CreateEditDeckCardPageArguments(
          deckId: widget.deckId,
          closeWidgetCallback: refreshData,
        ));
  }

  openStudyDeckSession(int deckId, int numberOfCards) {
    if (numberOfCards == 0) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).noCardsToStudy));
      return;
    }
    Navigator.pushNamed(context, studyDeckRoute,
        arguments: StudyDeckPageArguments(deckId: deckId, closeWidgetCallback: refreshData));
  }

  openMoveToOtherGroupDialog(Deck deck) async {
    List<Group> groups = await GroupService.instance.getGroups();
    var groupOptions = groups.map((e) => DropdownMenuItem(value: e.id, child: Text(e.name))).toList();
    var selectedGroupId = deck.groupId;

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => SimpleDialog(
          title: Text(LanguageService.translation(context).chooseANewGroup),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedGroupId,
                        items: groupOptions,
                        onChanged: (newGroupId) => setStateDialog(() => selectedGroupId = newGroupId!),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop("dialog"),
                        child: Text(LanguageService.translation(context).cancel),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bool successfulResult = await DeckService.instance.moveDeckToGroup(deck.id!, selectedGroupId);
                          if (successfulResult) {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                            refreshData();
                          } else {
                            WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
                                _scaffoldKey, LanguageService.translation(context).errorMovingDeckToGroup));
                          }
                        },
                        child: Text(LanguageService.translation(context).confirm),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  openAlertDialogForDeleteDeck() {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).deleteDeckConfirmation,
        confirmFunctionCallback: () async {
          bool successfulResult = await DeckService.instance.deleteDeck(widget.deckId);
          if (successfulResult) {
            if (context.mounted) {
              Navigator.of(context).pop();
              widget.closeWidgetCallback();
            }
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).errorDeletingDeck));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getDeck,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).loadingDeckTitle)),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).deckNotFoundTitle)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Center(child: Text(LanguageService.translation(context).deckNotFoundMessage)),
            ),
          );
        } else {
          Deck deck = snapshot.data!.deck;
          int numberOfCards = snapshot.data!.numberOfCards;
          int numberOfCardReviews = snapshot.data!.numberOfReviews;

          return WillPopScope(
            onWillPop: () async {
              widget.closeWidgetCallback();
              return true;
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(title: Text(deck.name)),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: LanguageService.translation(context).numberOfCards,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: "$numberOfCards\n"),
                                    TextSpan(
                                        text: LanguageService.translation(context).numberOfCardReviews,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: "$numberOfCardReviews\n"),
                                    TextSpan(
                                        text: LanguageService.translation(context).description,
                                        style: const TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: deck.description)
                                  ],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ElevatedButton(
                                    onPressed: () => openEditDeckInformationScreen(deck),
                                    child: Text(LanguageService.translation(context).editDeckInformationButton)),
                                ElevatedButton(
                                    onPressed: () => openAddCardToDeckScreen(),
                                    child: Text(LanguageService.translation(context).addCardButton)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ElevatedButton(
                                    onPressed: () => openMoveToOtherGroupDialog(deck),
                                    child: Text(LanguageService.translation(context).moveToOtherGroupButton)),
                                TextButton(
                                    onPressed: openAlertDialogForDeleteDeck,
                                    child: Text(LanguageService.translation(context).deleteDeckButton)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => openStudyDeckSession(deck.id!, numberOfCards),
                                child: Text(LanguageService.translation(context).studyDeckButton),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
