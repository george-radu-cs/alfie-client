import 'package:alfie/models/group.dart';
import 'package:alfie/models/theme_color.dart';
import 'package:alfie/services/group_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/widgets/core/color_picker.dart';
import 'package:flutter/material.dart';

class CreateEditGroup extends StatefulWidget {
  final Group? group;
  final Function? closeWidgetCallback;
  const CreateEditGroup({Key? key, this.group, this.closeWidgetCallback}) : super(key: key);

  @override
  State<CreateEditGroup> createState() => _CreateEditGroupState();
}

class _CreateEditGroupState extends State<CreateEditGroup> {
  bool isEditing = false;
  Group group = Group(name: "", color: ThemeColor.white);
  bool validForm = true;

  final nameTextController = TextEditingController();

  @override
  void initState() {
    isEditing = widget.group != null;
    if (widget.group != null) {
      group = widget.group!.copyWith();
      onNameChanged(group.name, firstCopy: true);
    }
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    super.dispose();
  }

  closeWidget() {
    Navigator.pop(context);
  }

  validateGroup() {
    bool validationResult = true;
    if (group.name.isEmpty) {
      validationResult = false;
    }

    setState(() => validForm = validationResult);
  }

  saveGroup() async {
    validateGroup();
    if (!validForm) {
      return;
    }

    if (isEditing) {
      await GroupService.instance.updateGroup(group);
    } else {
      await GroupService.instance.createGroup(group);
    }
    closeWidget();
    if (widget.closeWidgetCallback != null) {
      widget.closeWidgetCallback!();
    }
  }

  onNameChanged(String newName, {bool firstCopy = false}) {
    group = group.copyWith(name: newName);
    if (firstCopy) {
      // update the controller value and place the cursor at the end of the string
      nameTextController.value = TextEditingValue(
        text: newName,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newName.length),
        ),
      );
    }
  }

  onColorChanged(Color color) {
    group = group.copyWith(color: color.toThemeColor);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                isEditing
                    ? LanguageService.translation(context).editGroupTitle
                    : LanguageService.translation(context).createGroupTitle,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            TextField(
              controller: nameTextController,
              onChanged: onNameChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: LanguageService.translation(context).groupNamePlaceholder,
                errorText: !validForm ? LanguageService.translation(context).groupNameError : null,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LanguageService.translation(context).groupColorLabel, style: const TextStyle(fontSize: 16)),
                ColorPicker(
                    includeWhiteColor: true, selectedColor: group.color.toColor, onColorChanged: onColorChanged),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(100, 50))),
                  onPressed: closeWidget,
                  child: Text(LanguageService.translation(context).close, style: const TextStyle(fontSize: 16)),
                ),
                ElevatedButton(
                  style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size(100, 50))),
                  onPressed: saveGroup,
                  child: Text(LanguageService.translation(context).save, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
