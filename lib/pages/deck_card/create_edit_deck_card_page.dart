import 'dart:typed_data';

import 'package:alfie/api/math_ocr/math_ocr.dart';
import 'package:alfie/models/attachment_type.dart';
import 'package:alfie/models/card_type.dart';
import 'package:alfie/models/deck_card.dart';
import 'package:alfie/models/text_type.dart';
import 'package:alfie/services/deck_card_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/logger_service.dart';
import 'package:alfie/services/media_service.dart';
import 'package:alfie/services/permissions_service.dart';
import 'package:alfie/services/settings_provider.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:alfie/utils/duration.dart';
import 'package:alfie/utils/quiz_card_conversions.dart';
import 'package:alfie/utils/string.dart';
import 'package:alfie/widgets/core/custom_dialog.dart';
import 'package:alfie/widgets/core/snackbar.dart';
import 'package:alfie/widgets/deck_card/view_deck_back.dart';
import 'package:alfie/widgets/deck_card/view_deck_face.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:provider/provider.dart';

class CreateEditDeckCardPage extends StatefulWidget {
  final int deckId;
  final DeckCard? deckCard;
  final Function closeWidgetCallback;
  const CreateEditDeckCardPage({Key? key, required this.deckId, this.deckCard, required this.closeWidgetCallback})
      : super(key: key);

  @override
  State<CreateEditDeckCardPage> createState() => _CreateEditDeckCardPageState();
}

class _CreateEditDeckCardPageState extends State<CreateEditDeckCardPage> {
  bool _isEditing = false;
  DeckCard _deckCard = DeckCard(
    deckId: 0,
    type: CardType.basic,
    question: "",
    questionTextType: TextType.simple,
    questionAttachmentType: AttachmentType.none,
    answer: "",
    answerTextType: TextType.simple,
    answerAttachmentType: AttachmentType.none,
    answerNumberOfOptions: 3,
    answerCorrectOptionIndex: 1,
    timeToAnswer: const Duration(seconds: 0),
    updatedAtTimestamp: DateTime.now(),
  );
  bool _showFace = true; // either show face or back card
  bool _showFacePreview = false;
  Uint8List _questionImageDataBytes = Uint8List(0);
  Uint8List _answerImageDataBytes = Uint8List(0);
  List<String> _answerOptions = List.generate(3, (index) => "");
  bool dontShowOCRDialogAgain = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _questionTextController = TextEditingController();
  final _answerTextController = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    _deckCard = _deckCard.copyWith(deckId: widget.deckId);
    _isEditing = widget.deckCard != null;
    if (widget.deckCard != null) {
      _deckCard = widget.deckCard!.copyWith();
      _questionTextController.value = TextEditingValue(text: _deckCard.question);
      _answerTextController.value = TextEditingValue(text: _deckCard.answer);
      if (_deckCard.type == CardType.quiz) {
        _answerOptions = getQuizCardDecodedAnswer(_deckCard.answer);
      }
    }
    super.initState();
  }

  closeWidget() {
    Navigator.pop(context);
    widget.closeWidgetCallback();
  }

  String? validateDeckAndReturnErrorMessage() {
    if (_isEditing && _deckCard.id == null) {
      return LanguageService.translation(context).invalidDeckCardError;
    }
    if (_deckCard.question.isEmpty) {
      return LanguageService.translation(context).cardQuestionIsEmptyError;
    }
    if (_deckCard.questionAttachmentType != AttachmentType.none &&
        (_deckCard.questionAttachmentLocalURI == null || _deckCard.questionAttachmentLocalURI!.isEmpty)) {
      return LanguageService.translation(context).questionAttachmentMissingError;
    }
    if (_deckCard.answer.isEmpty) {
      return LanguageService.translation(context).cardAnswerIsEmptyError;
    }
    if (_deckCard.type == CardType.quiz &&
        (_deckCard.answerNumberOfOptions == null || _deckCard.answerCorrectOptionIndex == null)) {
      return LanguageService.translation(context).cardQuizMissingOptionsError;
    }
    if (_deckCard.answerAttachmentType != AttachmentType.none &&
        (_deckCard.answerAttachmentLocalURI == null || _deckCard.answerAttachmentLocalURI!.isEmpty)) {
      return LanguageService.translation(context).answerAttachmentMissingError;
    }

    return null;
  }

  saveDeckCard() async {
    try {
      // validation here
      String? validationError = validateDeckAndReturnErrorMessage();
      if (validationError != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey, validationError));
        return;
      }

      // need to copy the image data bytes to disk
      bool imageSaved = await MediaService.instance.saveCardImages(_deckCard.questionAttachmentLocalURI,
          _questionImageDataBytes, _deckCard.answerAttachmentLocalURI, _answerImageDataBytes);
      if (!imageSaved) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).imagesNotSavedErrorMessage));
        return;
      }

      if (_isEditing) {
        await DeckCardService.instance.updateCard(_deckCard);
      } else {
        await DeckCardService.instance.createCard(_deckCard);
      }

      closeWidget();
    } catch (err) {
      kLogger.e(err);
    }
  }

  openChangeDeckCardTypeDialog() {
    var typesOptions = CardType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name.toTitleCase))).toList();
    var selectedType = _deckCard.type;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => SimpleDialog(
          title: Text(LanguageService.translation(context).changeDeckCardType),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedType,
                    items: typesOptions,
                    onChanged: (newSelectedType) => setStateDialog(() => selectedType = newSelectedType as CardType),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(selectedType == CardType.basic
                      ? LanguageService.translation(context).basicDeckCardDescription
                      : selectedType == CardType.typeIn
                          ? LanguageService.translation(context).typeInDeckCardDescription
                          : selectedType == CardType.quiz
                              ? LanguageService.translation(context).quizDeckCardDescription
                              : ""),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop("dialog"),
                      child: Text(LanguageService.translation(context).cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // change the type of the card and reset the card's data
                          _deckCard = _deckCard.copyWith(
                            type: selectedType,
                            question: "",
                            questionTextType: TextType.simple,
                            questionAttachmentType: AttachmentType.none,
                            answer: "",
                            answerTextType: TextType.simple,
                            answerNumberOfOptions: 3,
                            answerCorrectOptionIndex: 1,
                            answerAttachmentType: AttachmentType.none,
                            timeToAnswer: const Duration(seconds: 0),
                          );
                          _answerOptions = List.generate(_deckCard.answerNumberOfOptions!, (index) => "");
                          // reset the text controllers
                          _questionTextController.value = TextEditingValue.empty;
                          _answerTextController.value = TextEditingValue.empty;
                        });
                        Navigator.of(context).pop("dialog");
                      },
                      child: Text(LanguageService.translation(context).confirm),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  openImageEditor(String forFace) async {
    // image editor needs access for both camera and media storage
    bool hasPermision = await PermissionsService.instance.checkImagePickerPermissions();
    if (!hasPermision) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).imagePermissionRequiredMessage));
      return;
    }

    // ignore: use_build_context_synchronously
    final editedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageEditor(
          image: forFace == "question" ? _questionImageDataBytes : _answerImageDataBytes,
          allowCamera: true,
          allowGallery: true,
          allowMultiple: false,
        ),
      ),
    );

    if (editedImage == null) {
      return;
    }

    if (forFace == "question") {
      setState(() {
        _questionImageDataBytes = editedImage;
        String questionImageFilename = MediaService.instance.getNewNameForQuestionImage();
        _deckCard = _deckCard.copyWith(
          questionAttachmentType: AttachmentType.image,
          questionAttachmentLocalURI: questionImageFilename,
          questionAttachmentCloudURI: "",
        );
      });
    } else {
      setState(() {
        _answerImageDataBytes = editedImage;
        String answerImageFileName = MediaService.instance.getNewNameForAnswerImage();
        _deckCard = _deckCard.copyWith(
          answerAttachmentType: AttachmentType.image,
          answerAttachmentLocalURI: answerImageFileName,
          answerAttachmentCloudURI: "",
        );
      });
    }
  }

  removeAttachment(String forFace) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).removeAttachmentConfirmation,
        confirmFunctionCallback: () {
          if (forFace == "question") {
            setState(() {
              _questionImageDataBytes = Uint8List.fromList([]);
              _deckCard = _deckCard.copyWith(
                questionAttachmentType: AttachmentType.none,
                questionAttachmentLocalURI: "",
              );
            });
          } else {
            setState(() {
              _answerImageDataBytes = Uint8List.fromList([]);
              _deckCard = _deckCard.copyWith(
                answerAttachmentType: AttachmentType.none,
                answerAttachmentLocalURI: "",
              );
            });
          }
        },
      ),
    );
  }

  openConvertImageToFormattedTextDialog(
    UserProvider userProvider,
    SettingsProvider settingsProvider,
    String forFace,
  ) async {
    if (!userProvider.isUserAuthenticated()) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).userNotLoggedInToUserFeatureError));
      return;
    }

    if (!settingsProvider.settings.showOCRDialog) {
      await convertImageToText(userProvider, forFace);
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        contentText: LanguageService.translation(context).convertImageToTextConfirmation,
        confirmFunctionCallback: () async {
          await convertImageToText(userProvider, forFace);
        },
        hasDoNotShowMessageAgainButton: true,
        doNotShowMessageAgainText: LanguageService.translation(context).doNotShowThisMessageAgain,
        doNotShowMessageAgainFunction: (doNotShowThisAgain) async {
          await settingsProvider.updateShowOCRDialog(!doNotShowThisAgain);
        },
      ),
    );
  }

  convertImageToText(UserProvider userProvider, String forFace) async {
    // image editor needs access for both camera and media storage
    bool hasPermision = await PermissionsService.instance.checkImagePickerPermissions();
    if (!hasPermision) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).imagePermissionRequiredMessage));
      return;
    }

    // ignore: use_build_context_synchronously
    final editedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ImageEditor(
          allowCamera: true,
          allowGallery: true,
          allowMultiple: false,
        ),
      ),
    );

    if (editedImage == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).imageToConvertNotProvidedMessage));
      return;
    }

    try {
      setState(() => _loading = true);

      String authToken = userProvider.user.token!;
      MathOcrResponse response = await MathOcrClient.instance.convertImageToTex(editedImage, authToken);

      if (!response.success) {
        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(_scaffoldKey,
            "${LanguageService.translation(context).couldNotProcessImageMessage} Error: ${response.message}"));
        setState(() => _loading = false);
        return;
      }

      if (forFace == "question") {
        setState(() {
          _deckCard = _deckCard.copyWith(question: response.message);
          _questionTextController.value = TextEditingValue(text: response.message);
        });
      } else {
        setState(() {
          _deckCard = _deckCard.copyWith(answer: response.message);
          _answerTextController.value = TextEditingValue(text: response.message);
        });
      }

      setState(() => _loading = false);
    } catch (err) {
      setState(() => _loading = false);
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => showSnackBarMessage(_scaffoldKey, LanguageService.translation(context).couldNotProcessImageMessage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.closeWidgetCallback();
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_isEditing
              ? LanguageService.translation(context).editDeckCard
              : LanguageService.translation(context).createDeckCard),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: saveDeckCard,
            ),
            IconButton(
              icon: const Icon(Icons.type_specimen),
              onPressed: openChangeDeckCardTypeDialog,
            )
          ],
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton.icon(
                              onPressed:
                                  _showFace ? null : () => setState(() => {_showFace = true, _showFacePreview = false}),
                              icon: const Icon(Icons.flip_to_front),
                              label: Text(LanguageService.translation(context).showCardFaceButton),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton.icon(
                              onPressed: !_showFace
                                  ? null
                                  : () => setState(() => {_showFace = false, _showFacePreview = false}),
                              icon: const Icon(Icons.flip_to_back),
                              label: Text(LanguageService.translation(context).showCardBackButton),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton.icon(
                          onPressed: () => setState(() => _showFacePreview = !_showFacePreview),
                          icon: _showFacePreview ? const Icon(Icons.edit_square) : const Icon(Icons.preview),
                          label: Text(_showFacePreview
                              ? LanguageService.translation(context).showEditCardFaceMenuButton
                              : LanguageService.translation(context).showPreviewCardFaceMenuButton),
                          style: ElevatedButton.styleFrom(
                            // set minimum size to infinity
                            minimumSize: const Size.fromHeight(36),
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          ),
                        ),
                      ),
                    ),
                    _showFace
                        ? (_showFacePreview
                            ? ViewDeckFace(
                                deckCard: _deckCard,
                                questionImageDataBytes: _questionImageDataBytes,
                                showImageFromMemory: _questionImageDataBytes.isNotEmpty ||
                                    (_deckCard.questionAttachmentLocalURI ?? "").isEmpty,
                              )
                            : Expanded(
                                flex: 7,
                                child: Column(children: [
                                  // manage time to answer
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Flex(direction: Axis.horizontal, children: [
                                      const Padding(
                                          padding: EdgeInsets.only(right: 10), child: Icon(Icons.timer_outlined)),
                                      Text(LanguageService.translation(context).timeToAnswer +
                                          convertSecondsToMinutesAndSecondsString(_deckCard.timeToAnswer.inSeconds)),
                                    ]),
                                    TextButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(const Size(10, 10)),
                                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                                      ),
                                      onPressed: () {
                                        WidgetsBinding.instance.addPostFrameCallback((_) => showSnackBarMessage(
                                            _scaffoldKey, LanguageService.translation(context).timeToAnswerHelper));
                                      },
                                      child: const Icon(Icons.question_mark, size: 15),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        Duration? selectedDuration = await showDurationPicker(
                                            context: context,
                                            initialTime: Duration(seconds: _deckCard.timeToAnswer.inSeconds),
                                            baseUnit: BaseUnit.second,
                                            snapToMins: 5.0);
                                        selectedDuration ??= const Duration(seconds: 0);
                                        setState(() {
                                          _deckCard = _deckCard.copyWith(timeToAnswer: selectedDuration);
                                        });
                                      },
                                      child: const Icon(Icons.edit),
                                    )
                                  ]),
                                  // manage question text format
                                  Row(children: [
                                    Expanded(
                                      child: Text(
                                        LanguageService.translation(context).textFormat,
                                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: _deckCard.questionTextType,
                                        items: TextType.values
                                            .map((e) => DropdownMenuItem(value: e, child: Text(e.name.toTitleCase)))
                                            .toList(),
                                        onChanged: (newSelectedTextType) => setState(() => _deckCard =
                                            _deckCard.copyWith(questionTextType: newSelectedTextType as TextType)),
                                      ),
                                    ),
                                  ]),
                                  // attachment select & edit
                                  Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Container(width: double.infinity),
                                      ElevatedButton.icon(
                                        onPressed: () async => await openImageEditor("question"),
                                        icon: const Icon(Icons.camera),
                                        label: Text(_questionImageDataBytes.isEmpty
                                            ? LanguageService.translation(context).addAnImage
                                            : LanguageService.translation(context).editImage),
                                      ),
                                      Visibility(
                                        visible: _questionImageDataBytes.isNotEmpty,
                                        child: ElevatedButton.icon(
                                          onPressed: () => removeAttachment("question"),
                                          icon: const Icon(Icons.remove_circle_outline),
                                          label: Text(LanguageService.translation(context).removeImage),
                                        ),
                                      ),
                                      _deckCard.questionTextType == TextType.tex
                                          ? Consumer2<UserProvider, SettingsProvider>(
                                              builder: (context, userProvider, settingsProvider, child) =>
                                                  ElevatedButton(
                                                onPressed: () => openConvertImageToFormattedTextDialog(
                                                    userProvider, settingsProvider, "question"),
                                                child: Text(LanguageService.translation(context).convertImageToTex),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  // question text input
                                  Flexible(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: TextFormField(
                                        minLines: 3,
                                        maxLines: 6,
                                        controller: _questionTextController,
                                        onChanged: (value) =>
                                            setState(() => _deckCard = _deckCard.copyWith(question: value)),
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          hintText: LanguageService.translation(context).writeCardQuestionHint,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ))
                        : (_showFacePreview
                            ? ViewDeckBack(
                                deckCard: _deckCard,
                                answerImageDataBytes: _answerImageDataBytes,
                                showImageFromMemory: _answerImageDataBytes.isNotEmpty ||
                                    (_deckCard.answerAttachmentLocalURI ?? "").isEmpty,
                                answerOptions: _answerOptions,
                                correctAnswerOption: _deckCard.answerCorrectOptionIndex!,
                                selectAnswerCallback: () => {},
                              )
                            : Expanded(
                                flex: 7,
                                child: Column(children: [
                                  // manage answer text format
                                  Visibility(
                                    visible: _deckCard.type != CardType.quiz,
                                    child: Row(children: [
                                      Expanded(
                                        child: Text(
                                          LanguageService.translation(context).textFormat,
                                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                        ),
                                      ),
                                      Expanded(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          value: _deckCard.answerTextType,
                                          items: TextType.values
                                              .map((e) => DropdownMenuItem(value: e, child: Text(e.name.toTitleCase)))
                                              .toList(),
                                          onChanged: (newSelectedTextType) => setState(() => _deckCard =
                                              _deckCard.copyWith(answerTextType: newSelectedTextType as TextType)),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  // attachment select & edit
                                  Visibility(
                                    visible: _deckCard.type != CardType.quiz,
                                    child: Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      children: [
                                        Container(width: double.infinity),
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            await openImageEditor("answer");
                                          },
                                          icon: const Icon(Icons.camera),
                                          label: Text(_answerImageDataBytes.isEmpty
                                              ? LanguageService.translation(context).addAnImage
                                              : LanguageService.translation(context).editImage),
                                        ),
                                        Visibility(
                                          visible: _answerImageDataBytes.isNotEmpty,
                                          child: ElevatedButton.icon(
                                            onPressed: () => removeAttachment("answer"),
                                            icon: const Icon(Icons.remove_circle_outline),
                                            label: Text(LanguageService.translation(context).removeImage),
                                          ),
                                        ),
                                        _deckCard.answerTextType == TextType.tex
                                            ? Consumer2<UserProvider, SettingsProvider>(
                                                builder: (context, userProvider, settingsProvider, child) =>
                                                    ElevatedButton(
                                                  onPressed: () => openConvertImageToFormattedTextDialog(
                                                      userProvider, settingsProvider, "answer"),
                                                  child: Text(LanguageService.translation(context).convertImageToTex),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  // question text input
                                  _deckCard.type != CardType.quiz
                                      ? Expanded(
                                          flex: 7,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 15),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: TextFormField(
                                                    minLines: 3,
                                                    maxLines: 6,
                                                    controller: _answerTextController,
                                                    onChanged: (value) =>
                                                        setState(() => _deckCard = _deckCard.copyWith(answer: value)),
                                                    decoration: InputDecoration(
                                                      border: const OutlineInputBorder(),
                                                      hintText:
                                                          LanguageService.translation(context).writeCardQuestionHint,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Expanded(
                                          child: Column(children: [
                                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                              Row(children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 10),
                                                  child: Text(
                                                    LanguageService.translation(context).numberOfOptions,
                                                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                                  ),
                                                ),
                                                DropdownButton(
                                                  value: _deckCard.answerNumberOfOptions,
                                                  items: [2, 3, 4, 5]
                                                      .map((e) => DropdownMenuItem(value: e, child: Text(e.toString())))
                                                      .toList(),
                                                  onChanged: (newSelectedNumberOfOptions) => setState(() {
                                                    _answerOptions =
                                                        List.generate(newSelectedNumberOfOptions!, (index) => "");
                                                    _deckCard = _deckCard.copyWith(
                                                        answerNumberOfOptions: newSelectedNumberOfOptions,
                                                        answerCorrectOptionIndex: 1);
                                                  }),
                                                ),
                                              ]),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text(
                                                      LanguageService.translation(context).correctAnswerIndex,
                                                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                                                    ),
                                                  ),
                                                  DropdownButton(
                                                    value: _deckCard.answerCorrectOptionIndex,
                                                    items: List<int>.generate(
                                                            _deckCard.answerNumberOfOptions!, (index) => index + 1)
                                                        .map((e) =>
                                                            DropdownMenuItem(value: e, child: Text(e.toString())))
                                                        .toList(),
                                                    onChanged: (newSelectedCorrectOptionIndex) => setState(() =>
                                                        _deckCard = _deckCard.copyWith(
                                                            answerCorrectOptionIndex: newSelectedCorrectOptionIndex)),
                                                  ),
                                                ],
                                              )
                                            ]),
                                            Expanded(
                                                child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 20),
                                                child: Column(
                                                  children: List.generate(
                                                    _answerOptions.length,
                                                    (index) => Container(
                                                        padding: const EdgeInsets.only(bottom: 10),
                                                        child: TextFormField(
                                                          minLines: 2,
                                                          maxLines: 2,
                                                          initialValue: _answerOptions[index],
                                                          onChanged: (value) => setState(() {
                                                            _answerOptions[index] = value;
                                                            _deckCard = _deckCard.copyWith(
                                                              answer: getQuizCardEncodedAnswer(_answerOptions),
                                                            );
                                                          }),
                                                          decoration: InputDecoration(
                                                            border: const OutlineInputBorder(),
                                                            hintText: LanguageService.translation(context)
                                                                .writeCardQuestionHint,
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ))
                                          ]),
                                        )
                                ]),
                              ))
                  ],
                ),
              ),
      ),
    );
  }
}
