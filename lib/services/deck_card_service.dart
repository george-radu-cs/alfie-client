import 'package:alfie/classes/deck_card_media.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/repositories/deck_card_repository.dart';
import 'package:alfie/services/card_review_service.dart';

class DeckCardService {
  DeckCardService._privateConstructor();
  static final DeckCardService instance = DeckCardService._privateConstructor();

  static final DeckCardRepository _deckCardRepository = DeckCardRepository.instance;

  Future<List<DeckCard>> getCards() async {
    return await _deckCardRepository.getCards();
  }

  Future<List<DeckCardMedia>> getCardsMedia() async {
    return await _deckCardRepository.getCardsMedia();
  }

  Future<List<DeckCard>> getCardsByDeckId(int deckId) async {
    return await _deckCardRepository.getCardsByDeckId(deckId);
  }

  Future<List<DeckCard>> getCardsWithReviewsByDeckId(int deckId) async {
    List<DeckCard> cards = await _deckCardRepository.getCardsByDeckId(deckId);
    for (var card in cards) {
      card.reviews = await CardReviewService.instance.getCardReviewsByCardId(card.id!);
    }

    return cards;
  }

  Future<int> getDeckCardsCount(int deckId) async {
    return await _deckCardRepository.getDeckCardsCount(deckId);
  }

  Future<DeckCard> getCardById(int id) async {
    return await _deckCardRepository.getCardById(id);
  }

  Future<DeckCard> getCardWithReviewsById(int id) async {
    DeckCard card = await _deckCardRepository.getCardById(id);
    card.reviews = await CardReviewService.instance.getCardReviewsByCardId(card.id!);
    return card;
  }

  Future<List<String>> getMediaPathsFromAllDecks() async {
    return await _deckCardRepository.getMediaPathsFromAllDecks();
  }

  Future<bool> createCard(DeckCard card) async {
    try {
      await _deckCardRepository.createCard(card);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> updateCard(DeckCard card) async {
    try {
      await _deckCardRepository.updateCard(card);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> markMediaFromCardsAsBackedUpInCloud(List<DeckCardMedia> cards) async {
    try {
      for (var card in cards) {
        if (card.questionAttachmentLocalURI != null && card.questionAttachmentLocalURI!.isNotEmpty) {
          card.questionAttachmentCloudURI = card.questionAttachmentLocalURI;
        }
        if (card.answerAttachmentLocalURI != null && card.answerAttachmentLocalURI!.isNotEmpty) {
          card.answerAttachmentCloudURI = card.answerAttachmentLocalURI;
        }
        await _deckCardRepository.updateCardMedia(card);
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteCard(int id) async {
    try {
      await _deckCardRepository.deleteCard(id);
      return true;
    } catch (err) {
      return false;
    }
  }
}
