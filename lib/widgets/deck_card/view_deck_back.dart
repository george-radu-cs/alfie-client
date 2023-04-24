import 'dart:io';
import 'dart:typed_data';

import 'package:alfie/models/card_type.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/models/text_type.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/permissions_service.dart';
import 'package:alfie/widgets/deck_card/view_html.dart';
import 'package:alfie/widgets/deck_card/view_markdown.dart';
import 'package:alfie/widgets/deck_card/view_simple_text.dart';
import 'package:alfie/widgets/deck_card/view_tex.dart';
import 'package:alfie/widgets/deck_card/view_tex_quizz.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class ViewDeckBack extends StatefulWidget {
  final DeckCard deckCard;
  final Uint8List answerImageDataBytes;
  final bool showImageFromMemory;
  final List<String> answerOptions;
  final int correctAnswerOption;
  final Function selectAnswerCallback;

  const ViewDeckBack({
    Key? key,
    required this.deckCard,
    required this.answerImageDataBytes,
    required this.showImageFromMemory,
    required this.answerOptions,
    required this.correctAnswerOption,
    required this.selectAnswerCallback,
  }) : super(key: key);

  @override
  State<ViewDeckBack> createState() => _ViewDeckBackState();
}

class _ViewDeckBackState extends State<ViewDeckBack> {
  late Future<Widget> _getImageWidget;

  @override
  void initState() {
    _getImageWidget = renderImage();
    super.initState();
  }

  Future<Widget> renderImage() async {
    if (widget.showImageFromMemory) {
      return Visibility(
        visible: widget.answerImageDataBytes.isNotEmpty,
        child: Image.memory(widget.answerImageDataBytes),
      );
    }
    // card without image
    if (widget.deckCard.answerAttachmentLocalURI == null) {
      return Container();
    }

    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return Container();
    }

    Directory? externalStoragePath = await getExternalStorageDirectory();
    String answerImagePath = join(externalStoragePath!.path, "Pictures", widget.deckCard.answerAttachmentLocalURI);
    File answerImageFile = File(answerImagePath);
    if (answerImageFile.existsSync()) {
      return Image.file(answerImageFile);
    }

    return Text(LanguageService.translation(context).imageMissingError);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageWidget,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || snapshot.hasError || snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          Widget imageWidget = snapshot.data!;

          return Expanded(
            flex: -1,
            child: widget.deckCard.type == CardType.quiz
                ? ViewTexQuizz(
                    answerOptions: widget.answerOptions,
                    correctAnswerOption: widget.correctAnswerOption,
                    selectAnswerCallback: widget.selectAnswerCallback,
                  )
                : Container(
                    constraints: BoxConstraints(
                        minWidth: double.infinity, minHeight: 0, maxHeight: MediaQuery.of(context).size.height * .4),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            widget.deckCard.answerTextType == TextType.tex
                                ? ViewTex(texId: "answerId", text: widget.deckCard.answer)
                                : widget.deckCard.answerTextType == TextType.markdown
                                    ? ViewMarkdown(text: widget.deckCard.answer)
                                    : widget.deckCard.answerTextType == TextType.html
                                        ? ViewHtml(text: widget.deckCard.answer)
                                        : ViewSimpleText(text: widget.deckCard.answer),
                            const SizedBox(height: 10),
                            imageWidget, // preview the image attached
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        }
      },
    );
  }
}
