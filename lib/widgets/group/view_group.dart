import 'package:alfie/classes/create_edit_deck_page_arguments.dart';
import 'package:alfie/classes/view_deck_page_arguments.dart';
import 'package:alfie/models/deck.dart';
import 'package:alfie/models/group.dart';
import 'package:alfie/models/theme_color.dart';
import 'package:alfie/router/router_constants.dart';
import 'package:alfie/services/group_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:alfie/widgets/group/create_edit_group.dart';
import 'package:flutter/material.dart';

class ViewGroup extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentKey;
  final GroupWithDecks group;
  final Function refreshData;
  const ViewGroup({Key? key, required this.parentKey, required this.group, required this.refreshData})
      : super(key: key);

  @override
  State<ViewGroup> createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
  _showAlertDialogForDeleteGroup() {
    // can delete the group only if it doesn't contain any decks to prevent accidental deleting of important decks
    // to delete the group, the user must first delete all the decks in the group
    if (widget.group.decks.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(widget.parentKey, LanguageService.translation(context).cantDeleteGroup));
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: "${LanguageService.translation(context).deleteGroupConfirmation} ${widget.group.name}?",
        confirmFunctionCallback: () async {
          bool successfulResult = await GroupService.instance.deleteGroup(widget.group.id!);
          if (successfulResult) {
            widget.refreshData();
          } else {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => showSnackBarMessage(widget.parentKey, LanguageService.translation(context).errorDeletingGroup));
          }
        },
      ),
    );
  }

  _openAddDeckToGroup() {
    Navigator.pushNamed(context, createDeckRoute,
        arguments: CreateEditDeckPageArguments(groupId: widget.group.id!, closeWidgetCallback: widget.refreshData));
  }

  _openEditGroupDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => CreateEditGroup(
        group: widget.group,
        closeWidgetCallback: widget.refreshData,
      ),
    );
  }

  _openViewDeck(Deck deck) {
    Navigator.pushNamed(
      context,
      viewDeckRoute,
      arguments: ViewDeckPageArguments(
        deckId: deck.id!,
        closeWidgetCallback: widget.refreshData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          shape: widget.group.showDecks
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))
              : const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          tileColor: widget.group.color.toColor,
          leading:
              widget.group.showDecks ? const Icon(Icons.keyboard_arrow_down) : const Icon(Icons.keyboard_arrow_right),
          title: Text(widget.group.name),
          subtitle: Text("${widget.group.decks.length} ${LanguageService.translation(context).decks}"),
          onTap: () {
            setState(() {
              widget.group.showDecks = !widget.group.showDecks;
            });
          },
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: _openAddDeckToGroup,
              ),
              IconButton(
                icon: const Icon(Icons.edit_note_outlined),
                onPressed: _openEditGroupDialog,
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: _showAlertDialogForDeleteGroup,
              ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        Visibility(
          visible: widget.group.showDecks,
          child: Container(
            decoration: BoxDecoration(
              // color: widget.group.color.toColor.withAlpha(100),
              border: Border.all(color: widget.group.color.toColor, width: 5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Visibility(
                  visible: widget.group.decks.isEmpty,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        LanguageService.translation(context).noDecks,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  widget.group.decks.length,
                  (deckIndex) => Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          padding: const EdgeInsets.only(left: 20),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        ),
                        onPressed: () => _openViewDeck(widget.group.decks[deckIndex]),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.group.decks[deckIndex].name,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: deckIndex != widget.group.decks.length - 1,
                        child: const Divider(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
