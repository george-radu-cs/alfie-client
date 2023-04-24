import 'package:alfie/models/deck.dart';

class CreateEditDeckPageArguments {
  final int groupId;
  final Deck? deck;
  final Function closeWidgetCallback;

  const CreateEditDeckPageArguments({required this.groupId, this.deck, required this.closeWidgetCallback});
}
