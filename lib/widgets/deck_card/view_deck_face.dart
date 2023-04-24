import 'dart:io';
import 'dart:typed_data';

import 'package:alfie/models/deck_card.dart';
import 'package:alfie/models/text_type.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/permissions_service.dart';
import 'package:alfie/widgets/deck_card/view_html.dart';
import 'package:alfie/widgets/deck_card/view_markdown.dart';
import 'package:alfie/widgets/deck_card/view_simple_text.dart';
import 'package:alfie/widgets/deck_card/view_tex.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class ViewDeckFace extends StatefulWidget {
  final DeckCard deckCard;
  final Uint8List questionImageDataBytes;
  final bool showImageFromMemory;

  const ViewDeckFace(
      {Key? key, required this.deckCard, required this.questionImageDataBytes, required this.showImageFromMemory})
      : super(key: key);

  @override
  State<ViewDeckFace> createState() => _ViewDeckFaceState();
}

class _ViewDeckFaceState extends State<ViewDeckFace> {
  late Future<Widget> _getImageWidget;

  @override
  void initState() {
    _getImageWidget = renderImage();
    super.initState();
  }

  Future<Widget> renderImage() async {
    if (widget.showImageFromMemory) {
      return Visibility(
        visible: widget.questionImageDataBytes.isNotEmpty,
        child: Image.memory(widget.questionImageDataBytes),
      );
    }
    // card without image
    if (widget.deckCard.questionAttachmentLocalURI == null) {
      return Container();
    }

    bool hasPermision = await PermissionsService.instance.checkStoragePermission();
    if (!hasPermision) {
      return Container();
    }

    Directory? externalStoragePath = await getExternalStorageDirectory();
    String questionImagePath = join(externalStoragePath!.path, "Pictures", widget.deckCard.questionAttachmentLocalURI!);
    File questionImageFile = File(questionImagePath);
    if (questionImageFile.existsSync()) {
      return Image.file(questionImageFile);
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
            child: Container(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 0,
                maxHeight: MediaQuery.of(context).size.height * .4,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      widget.deckCard.questionTextType == TextType.tex
                          ? ViewTex(texId: "questionId", text: widget.deckCard.question)
                          : widget.deckCard.questionTextType == TextType.markdown
                              ? ViewMarkdown(text: widget.deckCard.question)
                              : widget.deckCard.questionTextType == TextType.html
                                  ? ViewHtml(text: widget.deckCard.question)
                                  : ViewSimpleText(text: widget.deckCard.question),
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
