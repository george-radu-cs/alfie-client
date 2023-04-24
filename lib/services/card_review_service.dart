import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/repositories/card_review_repository.dart';
import 'package:alfie/services/deck_card_service.dart';

class CardReviewService {
  CardReviewService._privateConstructor();
  static final CardReviewService instance = CardReviewService._privateConstructor();

  static final CardReviewRepository _cardReviewRepository = CardReviewRepository.instance;

  Future<List<CardReview>> getCardReviews() async {
    return await _cardReviewRepository.getCardReviews();
  }

  Future<List<CardReview>> getCardReviewsByCardId(int cardId) async {
    return await _cardReviewRepository.getCardReviewsByCardId(cardId);
  }

  Future<List<CardReview>> getCardReviewsByListOfCardIds(List<int> cardIds) async {
    return await _cardReviewRepository.getCardReviewsByListOfCardIds(cardIds);
  }

  Future<int> getNumberOfCardReviewsForDeckId(int deckId) async {
    List<DeckCard> deckCards = await DeckCardService.instance.getCardsByDeckId(deckId);
    return await _cardReviewRepository.getNumberOfCardReviewsByListOfCardIds(deckCards.map((e) => e.id!).toList());
  }

  Future<bool> createCardReview(CardReview cardReview) async {
    try {
      await _cardReviewRepository.createCardReview(cardReview);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> updateCardReview(CardReview cardReview) async {
    try {
      await _cardReviewRepository.updateCardReview(cardReview);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCardReview(int id) async {
    try {
      await _cardReviewRepository.deleteCardReview(id);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCardReviewsOlderThanOneWeek() async {
    try {
      var date = DateTime.now().subtract(const Duration(days: 7));
      await _cardReviewRepository.deleteCardReviewsOlderThan(date);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCardReviewsOlderThanOneMonth() async {
    try {
      var date = DateTime.now().subtract(const Duration(days: 30));
      await _cardReviewRepository.deleteCardReviewsOlderThan(date);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCardReviewsOlderThanHalfAYear() async {
    try {
      var date = DateTime.now().subtract(const Duration(days: 180));
      await _cardReviewRepository.deleteCardReviewsOlderThan(date);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCardReviewsOlderThanOneYear() async {
    try {
      var date = DateTime.now().subtract(const Duration(days: 365));
      await _cardReviewRepository.deleteCardReviewsOlderThan(date);
      return true;
    } catch (err) {
      return false;
    }
  }
}
