import 'package:alfie/models/deck_card.dart';

class CreateEditDeckCardPageArguments {
  final int deckId;
  final DeckCard? deckCard;
  final Function closeWidgetCallback;

  const CreateEditDeckCardPageArguments({required this.deckId, this.deckCard, required this.closeWidgetCallback});
}
