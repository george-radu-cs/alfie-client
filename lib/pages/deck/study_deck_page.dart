import 'dart:async';
import 'dart:typed_data';

import 'package:alfie/classes/create_edit_card_page_arguments.dart';
import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/models/card_type.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/card_review_service.dart';
import 'package:alfie/services/deck_card_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/logger_service.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:alfie/utils/card_score.dart';
import 'package:alfie/utils/duration.dart';
import 'package:alfie/utils/quiz_card_conversions.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:alfie/widgets/deck_card/view_deck_back.dart';
import 'package:alfie/widgets/deck_card/view_deck_face.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class StudyDeckPage extends StatefulWidget {
  final int deckId;
  final Function closeWidgetCallback;
  const StudyDeckPage({Key? key, required this.deckId, required this.closeWidgetCallback}) : super(key: key);

  @override
  State<StudyDeckPage> createState() => _StudyDeckPageState();
}

class _StudyDeckPageState extends State<StudyDeckPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HeapPriorityQueue<DeckCard> _cardsToReview = HeapPriorityQueue<DeckCard>((a, b) => b.score.compareTo(a.score));
  late Future<DeckCard> _getCardToReview;
  bool _loading = false;
  Timer? _timerToAnswer;
  int _timeRemainingToAnswer = 0;
  DateTime _showedCardAt = DateTime.now();
  bool showAnswer = false;

  @override
  void initState() {
    _getCardToReview = getNextCardToReview();
    super.initState();
  }

  @override
  void dispose() {
    _timerToAnswer?.cancel();
    super.dispose();
  }

  Future<DeckCard> getNextCardToReview({DeckCard? reviewedCard}) async {
    setState(() => _loading = true);
    if (reviewedCard == null) {
      await getCardsWithReviews();
    } else {
      readdDeckCard(reviewedCard);
    }

    setState(() => _loading = false);
    DeckCard cardToReview = _cardsToReview.removeFirst();
    _timerToAnswer?.cancel();
    if (cardToReview.timeToAnswer.inMilliseconds > 0) {
      startRevealAnswerTimer(cardToReview.timeToAnswer);
    }
    setState(() => _showedCardAt = DateTime.now());
    return cardToReview;
  }

  getCardsWithReviews() async {
    List<DeckCard> cards = await DeckCardService.instance.getCardsWithReviewsByDeckId(widget.deckId);
    for (var card in cards) {
      card.score = computeCardScore(card);
    }
    _cardsToReview.addAll(cards);
  }

  readdDeckCard(DeckCard card) async {
    DeckCard reviewedCard = await DeckCardService.instance.getCardWithReviewsById(card.id!);
    reviewedCard.score = computeCardScore(reviewedCard);
    _cardsToReview.add(reviewedCard);
  }

  refreshData({DeckCard? reviewedCard}) {
    setState(() {
      showAnswer = false;
      _getCardToReview = getNextCardToReview(reviewedCard: reviewedCard);
    });
  }

  revealAnswer() {
    setState(() {
      showAnswer = true;
    });
  }

  startRevealAnswerTimer(Duration timeToAnswer) {
    _timeRemainingToAnswer = timeToAnswer.inSeconds;
    _timerToAnswer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_timeRemainingToAnswer == 0) {
        setState(() {
          revealAnswer();
          _timerToAnswer?.cancel();
        });
      } else {
        setState(() {
          _timeRemainingToAnswer--;
        });
      }
    });
  }

  openEditDeckCardScreen(DeckCard deckCard) {
    Navigator.pushNamed(context, editDeckCardRoute,
        arguments: CreateEditDeckCardPageArguments(
          deckId: deckCard.deckId,
          deckCard: deckCard,
          closeWidgetCallback: () => {},
        ));
  }

  openDeleteDeckCardDialog(DeckCard deckCard) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).deleteDeckCardConfirmation,
        confirmFunctionCallback: () async {
          bool successfulResult = await DeckCardService.instance.deleteCard(deckCard.id!);
          if (successfulResult) {
            refreshData();
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).errorDeletingDeckCard));
          }
        },
      ),
    );
  }

  addCardReviewAndGetNextCard(DeckCard reviewedDeckCard, CardReviewRating reviewRating) async {
    try {
      Duration timeToAnswer = DateTime.now().difference(_showedCardAt);
      CardReview newCardReview = CardReview(
        cardId: reviewedDeckCard.id!,
        rating: reviewRating,
        timeToAnswer: timeToAnswer,
      );

      await CardReviewService.instance.createCardReview(newCardReview);
      DeckCard reviewedDeckCardToUpdate = await DeckCardService.instance.getCardById(reviewedDeckCard.id!);
      await DeckCardService.instance.updateCard(reviewedDeckCardToUpdate.copyWith(
        lastReviewRating: reviewRating,
        lastReviewTimestamp: DateTime.now(),
      ));

      refreshData(reviewedCard: reviewedDeckCard);
    } catch (err) {
      kLogger.e(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCardToReview,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).loadingStudyMode)),
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
          DeckCard cardToReview = snapshot.data!;

          if (_loading) {
            return Scaffold(
              appBar: AppBar(title: Text(LanguageService.translation(context).loadingStudyMode)),
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          return WillPopScope(
            onWillPop: () async {
              widget.closeWidgetCallback();
              return true;
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: Text(LanguageService.translation(context).studyMode),
                actions: [
                  Visibility(
                    visible: showAnswer,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => openEditDeckCardScreen(cardToReview),
                    ),
                  ),
                  Visibility(
                    visible: showAnswer,
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => openDeleteDeckCardDialog(cardToReview),
                    ),
                  ),
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Column(
                        children: [
                          Visibility(
                              visible: !showAnswer && cardToReview.timeToAnswer.inMilliseconds > 0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                child: Text(LanguageService.translation(context).timeToAnswer +
                                    convertSecondsToMinutesAndSecondsString(_timeRemainingToAnswer)),
                              )),
                          ViewDeckFace(
                            deckCard: cardToReview,
                            questionImageDataBytes: Uint8List(0),
                            showImageFromMemory: false,
                          ),
                          Visibility(
                              visible: cardToReview.type == CardType.typeIn,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    minLines: 3,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: LanguageService.translation(context).writeYourAnswerHere,
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: showAnswer || cardToReview.type == CardType.quiz,
                            child: ViewDeckBack(
                              deckCard: cardToReview,
                              answerImageDataBytes: Uint8List(0),
                              showImageFromMemory: false,
                              answerOptions: getQuizCardDecodedAnswer(cardToReview.answer),
                              correctAnswerOption: cardToReview.answerCorrectOptionIndex!,
                              selectAnswerCallback: revealAnswer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  !showAnswer
                      ? Visibility(
                          visible: cardToReview.type != CardType.quiz,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: revealAnswer,
                                    child: Text(LanguageService.translation(context).showAnswer)),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(ThemeService.easyCardRatingColor),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                ),
                                onPressed: () => addCardReviewAndGetNextCard(cardToReview, CardReviewRating.easy),
                                child: Text(LanguageService.translation(context).easy),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(ThemeService.goodCardRatingColor),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                ),
                                onPressed: () => addCardReviewAndGetNextCard(cardToReview, CardReviewRating.good),
                                child: Text(LanguageService.translation(context).good),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(ThemeService.hardCardRatingColor),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                ),
                                onPressed: () => addCardReviewAndGetNextCard(cardToReview, CardReviewRating.hard),
                                child: Text(LanguageService.translation(context).hard),
                              ),
                            ),
                          ]),
                        )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
