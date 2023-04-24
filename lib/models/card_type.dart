enum CardType {
  basic,
  typeIn,
  quiz,
  // clozure,
}

extension CardTypeString on String {
  CardType get toCardType {
    switch (this) {
      case "basic":
        return CardType.basic;
      case "typeIn":
        return CardType.typeIn;
      case "quiz":
        return CardType.quiz;
      // case "clozure":
      //   return CardType.clozure;
      default:
        return CardType.basic;
    }
  }
}
