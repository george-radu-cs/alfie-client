import 'package:alfie/models/deck.dart';
import 'package:alfie/services/deck_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class CreateEditDeckPage extends StatefulWidget {
  final int groupId;
  final Deck? deck;
  final Function closeWidgetCallback;
  const CreateEditDeckPage({Key? key, required this.groupId, this.deck, required this.closeWidgetCallback})
      : super(key: key);

  @override
  State<CreateEditDeckPage> createState() => _CreateEditDeckPageState();
}

class _CreateEditDeckPageState extends State<CreateEditDeckPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();

  bool isEditing = false;
  Deck deck = Deck(name: "", description: "", groupId: -1);

  @override
  void initState() {
    deck = deck.copyWith(groupId: widget.groupId);
    isEditing = widget.deck != null;
    if (widget.deck != null) {
      deck = widget.deck!.copyWith();
      onNameChanged(deck.name, firstCopy: true);
      onDescriptionChanged(deck.description, firstCopy: true);
    }
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  closeWidget() {
    Navigator.pop(context);
    widget.closeWidgetCallback();
  }

  saveDeck() async {
    final form = formKey.currentState!;
    bool validForm = form.validate();
    if (!validForm) {
      return;
    }

    if (isEditing) {
      await DeckService.instance.updateDeck(deck);
    } else {
      await DeckService.instance.createDeck(deck);
    }

    closeWidget();
  }

  onNameChanged(String newName, {bool firstCopy = false}) {
    deck = deck.copyWith(name: newName);
    if (firstCopy) {
      // update the controller value and place the cursor at the end of the string for first copy
      nameTextController.value = TextEditingValue(
        text: newName,
        selection: TextSelection.fromPosition(TextPosition(offset: newName.length)),
      );
    }
  }

  onDescriptionChanged(String newDescription, {bool firstCopy = false}) {
    deck = deck.copyWith(description: newDescription);
    if (firstCopy) {
      // update the controller value and place the cursor at the end of the string for first copy
      descriptionTextController.value = TextEditingValue(
        text: newDescription,
        selection: TextSelection.fromPosition(TextPosition(offset: newDescription.length)),
      );
    }
  }

  String? validateDescription(String? value) {
    return (value == null || value.isEmpty) ? LanguageService.translation(context).deckDescriptionError : null;
  }

  String? validateName(String? value) {
    return (value == null || value.isEmpty) ? LanguageService.translation(context).deckNameError : null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.closeWidgetCallback();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEditing
              ? LanguageService.translation(context).editDeck
              : LanguageService.translation(context).createDeck),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Text(LanguageService.translation(context).createDeckExplanation),
              ),
              Expanded(
                flex: 4,
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: nameTextController,
                      onChanged: onNameChanged,
                      validator: validateName,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: LanguageService.translation(context).deckNamePlaceholder,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      minLines: 2,
                      maxLines: 6,
                      controller: descriptionTextController,
                      onChanged: onDescriptionChanged,
                      validator: validateDescription,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: LanguageService.translation(context).deckDescriptionPlaceholder,
                      ),
                    ),
                  ]),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(100, 50))),
                      onPressed: closeWidget,
                      child: Text(LanguageService.translation(context).close, style: const TextStyle(fontSize: 16)),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(100, 50))),
                      onPressed: saveDeck,
                      child: Text(LanguageService.translation(context).save, style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
