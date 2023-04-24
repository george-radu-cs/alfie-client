enum CardReviewRating {
  easy,
  good,
  hard,
}

extension CardReviewRatingString on String {
  CardReviewRating get toCardReviewRating {
    switch (this) {
      case "easy":
        return CardReviewRating.easy;
      case "good":
        return CardReviewRating.good;
      case "hard":
        return CardReviewRating.hard;
      default:
        return CardReviewRating.easy;
    }
  }
}
