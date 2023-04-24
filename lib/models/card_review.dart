import 'card_review_rating.dart';

class CardReview {
  final int? id;
  final int cardId;
  final CardReviewRating rating;
  final Duration timeToAnswer;
  final DateTime reviewTimestamp;

  CardReview({
    this.id,
    required this.cardId,
    required this.rating,
    required this.timeToAnswer,
    DateTime? reviewTimestamp,
  }) : reviewTimestamp = reviewTimestamp ?? DateTime.now();

  factory CardReview.fromMap(Map<String, dynamic> json) => CardReview(
        id: json['id'],
        cardId: json['cardId'],
        rating: json['rating'].toString().toCardReviewRating,
        timeToAnswer: Duration(milliseconds: json['timeToAnswer']),
        reviewTimestamp: DateTime.fromMillisecondsSinceEpoch(json['reviewTimestamp']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cardId': cardId,
        'rating': rating.name,
        'timeToAnswer': timeToAnswer.inMilliseconds,
        'reviewTimestamp': reviewTimestamp.millisecondsSinceEpoch,
      };

  CardReview copyWith({
    int? id,
    int? cardId,
    CardReviewRating? rating,
    Duration? timeToAnswer,
    DateTime? reviewTimestamp,
  }) {
    return CardReview(
      id: id ?? this.id,
      cardId: cardId ?? this.cardId,
      rating: rating ?? this.rating,
      timeToAnswer: timeToAnswer ?? this.timeToAnswer,
      reviewTimestamp: reviewTimestamp ?? this.reviewTimestamp,
    );
  }

  @override
  String toString() {
    return 'CardReview(id: $id, cardId: $cardId, rating: $rating, timeToAnswer: $timeToAnswer, reviewTimestamp: $reviewTimestamp)';
  }
}
