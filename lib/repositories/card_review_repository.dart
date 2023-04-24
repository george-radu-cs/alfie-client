import 'package:alfie/models/card_review.dart';
import 'package:alfie/repositories/database.dart';

class CardReviewRepository {
  CardReviewRepository._privateConstructor();
  static final CardReviewRepository instance = CardReviewRepository._privateConstructor();

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final String _cardReviewsTableName = 'cardReviews';

  Future<List<CardReview>> getCardReviews() async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardReviewsTableName)
        .then((value) => value.map((e) => CardReview.fromMap(e)).toList(growable: false));
  }

  Future<List<CardReview>> getCardReviewsByCardId(int cardId) async {
    var db = await _databaseHelper.database;
    return await db.query(_cardReviewsTableName,
        where: 'cardId = ?',
        whereArgs: [cardId]).then((value) => value.map((e) => CardReview.fromMap(e)).toList(growable: false));
  }

  Future<List<CardReview>> getCardReviewsByListOfCardIds(List<int> cardIds) async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardReviewsTableName,
            where: 'cardId IN (${List.filled(cardIds.length, '?').join(',')})', whereArgs: cardIds)
        .then((value) => value.map((e) => CardReview.fromMap(e)).toList(growable: false));
  }

  Future<int> getNumberOfCardReviewsByListOfCardIds(List<int> cardIds) async {
    var db = await _databaseHelper.database;
    return await db
        .query(_cardReviewsTableName,
            where: 'cardId IN (${List.filled(cardIds.length, '?').join(',')})', whereArgs: cardIds)
        .then((value) => value.length);
  }

  Future<void> createCardReview(CardReview cardReview) async {
    var db = await _databaseHelper.database;
    await db.insert(_cardReviewsTableName, cardReview.toMap());
  }

  Future<void> updateCardReview(CardReview cardReview) async {
    var db = await _databaseHelper.database;
    await db.update(_cardReviewsTableName, cardReview.toMap(), where: 'id = ?', whereArgs: [cardReview.id]);
  }

  Future<void> deleteCardReview(int id) async {
    var db = await _databaseHelper.database;
    await db.delete(_cardReviewsTableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteCardReviewsOlderThan(DateTime date) async {
    var db = await _databaseHelper.database;
    await db.delete(_cardReviewsTableName, where: 'reviewTimestamp < ?', whereArgs: [date.millisecondsSinceEpoch]);
  }
}
