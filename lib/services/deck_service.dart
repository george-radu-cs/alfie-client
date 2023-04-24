import 'package:alfie/models/deck.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/repositories/deck_repository.dart';
import 'package:alfie/repositories/decK_card_repository.dart';

class DeckService {
  DeckService._privateConstructor();
  static final DeckService instance = DeckService._privateConstructor();

  static final DeckRepository _deckRepository = DeckRepository.instance;
  static final DeckCardRepository _cardRepository = DeckCardRepository.instance;

  Future<List<Deck>> getDecks() async {
    return await _deckRepository.getDecks();
  }

  Future<Deck> getDeckById(int id) async {
    return await _deckRepository.getDeckById(id);
  }

  Future<Deck> getDeckByIdWithCards(int id) async {
    Deck deck = await _deckRepository.getDeckById(id);
    List<DeckCard> cards = await _cardRepository.getCardsByDeckId(id);

    deck.cards = cards;
    return deck;
  }

  Future<bool> createDeck(Deck deck) async {
    try {
      await _deckRepository.createDeck(deck);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> updateDeck(Deck deck) async {
    try {
      await _deckRepository.updateDeck(deck);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deleteDeck(int id) async {
    try {
      await _deckRepository.deleteDeck(id);
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> moveDeckToGroup(int deckId, int groupId) async {
    try {
      await _deckRepository.moveDeckToGroup(deckId, groupId);
      return true;
    } catch (err) {
      return false;
    }
  }
}
