import 'package:alfie/services/language_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class ViewTexQuizz extends StatefulWidget {
  final List<String> answerOptions;
  final int correctAnswerOption;
  final Function selectAnswerCallback;

  const ViewTexQuizz(
      {Key? key, required this.answerOptions, required this.correctAnswerOption, required this.selectAnswerCallback})
      : super(key: key);

  @override
  State<ViewTexQuizz> createState() => _ViewTexQuizzState();
}

class _ViewTexQuizzState extends State<ViewTexQuizz> {
  bool showCorrectAnswer = false;

  @override
  Widget build(BuildContext context) {
    return TeXView(
      child: TeXViewColumn(
        children: [
          TeXViewGroup(
            normalItemStyle: TeXViewStyle(
              borderRadius: const TeXViewBorderRadius.all(10),
              border: TeXViewBorder.all(
                TeXViewBorderDecoration(
                  borderWidth: 1,
                  borderColor: Theme.of(context).textTheme.titleSmall!.color,
                ),
              ),
              margin: const TeXViewMargin.all(10),
            ),
            selectedItemStyle: TeXViewStyle(
              borderRadius: const TeXViewBorderRadius.all(10),
              border: TeXViewBorder.all(
                TeXViewBorderDecoration(
                  borderWidth: 2,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              margin: const TeXViewMargin.all(10),
            ),
            onTap: (id) {
              if (!showCorrectAnswer) {
                widget.selectAnswerCallback();
                setState(() {
                  showCorrectAnswer = true;
                });
              }
            },
            children: widget.answerOptions
                .mapIndexed(
                  (index, e) => TeXViewGroupItem(
                    id: index.toString(),
                    child: TeXViewDocument(
                      "${index + 1}) $e",
                      style: TeXViewStyle(
                        padding: const TeXViewPadding.all(10),
                        border: showCorrectAnswer && index + 1 == widget.correctAnswerOption
                            ? const TeXViewBorder.all(
                                TeXViewBorderDecoration(
                                  borderWidth: 5,
                                  borderColor: Colors.green,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
        style: TeXViewStyle(
          padding: const TeXViewPadding.all(5),
          borderRadius: const TeXViewBorderRadius.all(15),
          border: TeXViewBorder.all(
            TeXViewBorderDecoration(
              borderColor: Theme.of(context).colorScheme.primary,
              borderStyle: TeXViewBorderStyle.solid,
              borderWidth: 3,
            ),
          ),
          backgroundColor: Theme.of(context).textTheme.titleSmall!.backgroundColor,
          contentColor: Theme.of(context).textTheme.titleSmall!.color,
        ),
      ),
      loadingWidgetBuilder: (context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(LanguageService.translation(context).rendering),
            )
          ],
        ),
      ),
    );
  }
}
