import 'package:alfie/classes/deck_card_media.dart';
import 'package:alfie/models/deck_card.dart';
import 'database.dart';

class DeckCardRepository {
  DeckCardRepository._privateConstructor();
  static final DeckCardRepository instance = DeckCardRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _cardsTableName = 'cards';

  Future<List<DeckCard>> getCards() async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardsTableName)
        .then((value) => value.map((e) => DeckCard.fromMap(e)).toList(growable: false));
  }

  Future<List<DeckCardMedia>> getCardsMedia() async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardsTableName, where: 'questionAttachmentType != "none" OR answerAttachmentType != "none"')
        .then((value) => value.map((e) => DeckCardMedia.fromMap(e)).toList(growable: false));
  }

  Future<List<DeckCard>> getCardsByDeckId(int deckId) async {
    var db = await _databaseHelper.database;
    return await db.query(_cardsTableName,
        where: 'deckId = ?',
        whereArgs: [deckId]).then((value) => value.map((e) => DeckCard.fromMap(e)).toList(growable: false));
  }

  Future<int> getDeckCardsCount(int deckId) async {
    var db = await _databaseHelper.database;
    return await db.query(_cardsTableName, where: 'deckId = ?', whereArgs: [deckId]).then((value) => value.length);
  }

  Future<DeckCard> getCardById(int id) async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardsTableName, where: 'id = ?', whereArgs: [id]).then((value) => DeckCard.fromMap(value.first));
  }

  Future<void> createCard(DeckCard card) async {
    var db = await _databaseHelper.database;
    await db.insert(_cardsTableName, card.toMap());
  }

  Future<void> updateCard(DeckCard card) async {
    var db = await _databaseHelper.database;
    await db.update(_cardsTableName, card.toMap(), where: 'id = ?', whereArgs: [card.id]);
  }

  Future<void> updateCardMedia(DeckCardMedia card) async {
    var db = await _databaseHelper.database;
    await db.update(_cardsTableName, card.toMap(), where: 'id = ?', whereArgs: [card.id]);
  }

  Future<void> deleteCard(int id) async {
    var db = await _databaseHelper.database;
    await db.delete(_cardsTableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<String>> getMediaPathsFromAllDecks() async {
    var db = await _databaseHelper.database;
    return await db.query(_cardsTableName, columns: ['questionAttachmentLocalURI', 'answerAttachmentLocalURI']).then(
      (value) => value
          .map((e) {
            var list = <String>[];
            if (e['questionAttachmentLocalURI'] != null) {
              list.add(e['questionAttachmentLocalURI'] as String);
            }
            if (e['answerAttachmentLocalURI'] != null) {
              list.add(e['answerAttachmentLocalURI'] as String);
            }
            return list;
          })
          .expand((element) => element)
          .toList(growable: false),
    );
  }
}
