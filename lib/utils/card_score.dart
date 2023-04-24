import 'dart:math';

import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/models/deck_card.dart';

int computeCardScore(DeckCard deckCard) {
  int score = 0;

  Duration timeSinceLastReview;
  if (deckCard.lastReviewTimestamp == null) {
    // card was never reviewd, take consider the time from the last update
    timeSinceLastReview = DateTime.now().difference(deckCard.updatedAtTimestamp);
    score += 100;
  } else {
    // card was reviewd at least once
    timeSinceLastReview = DateTime.now().difference(deckCard.lastReviewTimestamp!);
    score += timeSinceLastReview.inDays;
  }

  // don't let the user see the same question too often
  if (timeSinceLastReview.inMinutes < 30) {
    score -= 200 * (30 - timeSinceLastReview.inMinutes);
  }

  // consider how the user thought about this card last time
  switch (deckCard.lastReviewRating) {
    case CardReviewRating.easy:
      if (timeSinceLastReview.inDays < 7) {
        score -= 300;
      } else {
        score += 10;
      }
      break;
    case CardReviewRating.good:
      if (timeSinceLastReview.inDays < 2) {
        score -= 50;
      } else {
        score += 30;
      }
      break;
    case CardReviewRating.hard:
      if (timeSinceLastReview.inHours < 2) {
        score -= 50;
      }
      score += 90;
      break;
    default:
      score += 40;
      break;
  }

  // consider the number of reviews this user gave to this card
  if (deckCard.reviews.isEmpty) {
    score += 50;
  } else {
    score -= deckCard.reviews.length * 2;
  }

  // also add a little randomness to diversify the cards with approximative scores
  score += Random().nextInt(41) - 20;

  return score;
}
