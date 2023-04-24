import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String contentText;
  final String cancelText;
  final Function? cancelFunctionCallback;
  final String confirmText;
  final Function confirmFunctionCallback;
  final bool hasDoNotShowMessageAgainButton;
  final String doNotShowMessageAgainText;
  final Function? doNotShowMessageAgainFunction;

  const CustomDialog({
    Key? key,
    this.title = "",
    required this.contentText,
    this.cancelText = "",
    this.cancelFunctionCallback,
    this.confirmText = "",
    required this.confirmFunctionCallback,
    this.hasDoNotShowMessageAgainButton = false,
    this.doNotShowMessageAgainText = "",
    this.doNotShowMessageAgainFunction,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool dontShowOCRDialogAgain = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title.isNotEmpty ? widget.title : LanguageService.translation(context).confirmationRequiredTitle,
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(widget.contentText),
        ),
        Visibility(
          visible: widget.hasDoNotShowMessageAgainButton,
          child: CheckboxListTile(
            title: Text(widget.doNotShowMessageAgainText, style: Theme.of(context).textTheme.bodyMedium),
            value: dontShowOCRDialogAgain,
            onChanged: (newValue) async {
              if (newValue == null) {
                return;
              }

              setState(() {
                dontShowOCRDialogAgain = newValue;
              });
            },
          ),
        ),
      ]),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop("dialog");
            if (widget.cancelFunctionCallback != null) {
              await widget.cancelFunctionCallback!();
            }
          },
          child: Text(widget.cancelText.isNotEmpty ? widget.cancelText : LanguageService.translation(context).cancel),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop("dialog");
            if (widget.doNotShowMessageAgainFunction != null) {
              await widget.doNotShowMessageAgainFunction!(dontShowOCRDialogAgain);
            }
            await widget.confirmFunctionCallback();
          },
          child:
              Text(widget.confirmText.isNotEmpty ? widget.confirmText : LanguageService.translation(context).confirm),
        ),
      ],
    );
  }
}
