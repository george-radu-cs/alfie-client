import 'package:alfie/models/deck.dart';
import 'package:alfie/repositories/database.dart';

class DeckRepository {
  DeckRepository._privateConstructor();
  static final DeckRepository instance = DeckRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _decksTableName = 'decks';

  Future<List<Deck>> getDecks() async {
    var db = await _databaseHelper.database;
    return await db.query(_decksTableName).then((value) => value.map((e) => Deck.fromMap(e)).toList(growable: false));
  }

  Future<Deck> getDeckById(int id) async {
    var db = await _databaseHelper.database;
    return await db.query(_decksTableName, where: 'id = ?', whereArgs: [id]).then((value) => Deck.fromMap(value.first));
  }

  Future<void> createDeck(Deck deck) async {
    var db = await _databaseHelper.database;
    await db.insert(_decksTableName, deck.toMap());
  }

  Future<void> updateDeck(Deck deck) async {
    var db = await _databaseHelper.database;
    await db.update(_decksTableName, deck.toMap(), where: 'id = ?', whereArgs: [deck.id]);
  }

  Future<void> deleteDeck(int id) async {
    var db = await _databaseHelper.database;
    await db.delete(_decksTableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> moveDeckToGroup(int deckId, int groupId) async {
    var db = await _databaseHelper.database;
    await db.update(_decksTableName, {'groupId': groupId}, where: 'id = ?', whereArgs: [deckId]);
  }
}
