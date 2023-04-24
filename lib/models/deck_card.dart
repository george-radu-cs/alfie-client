import 'package:alfie/models/attachment_type.dart';
import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/models/card_type.dart';
import 'package:alfie/models/text_type.dart';

class DeckCard {
  final int? id;
  final int deckId;
  final CardType type;
  final String question;
  final TextType questionTextType;
  final AttachmentType questionAttachmentType;
  final String? questionAttachmentLocalURI;
  final String? questionAttachmentCloudURI;
  final String answer;
  final TextType answerTextType;
  final int? answerNumberOfOptions;
  final int? answerCorrectOptionIndex;
  final AttachmentType answerAttachmentType;
  final String? answerAttachmentLocalURI;
  final String? answerAttachmentCloudURI;
  final Duration timeToAnswer;
  final CardReviewRating? lastReviewRating;
  final DateTime? lastReviewTimestamp;
  final DateTime updatedAtTimestamp;

  List<CardReview> reviews = [];
  int score = 0;

  DeckCard({
    this.id,
    required this.deckId,
    required this.type,
    required this.question,
    required this.questionTextType,
    required this.questionAttachmentType,
    this.questionAttachmentLocalURI,
    this.questionAttachmentCloudURI,
    required this.answer,
    required this.answerTextType,
    this.answerNumberOfOptions,
    this.answerCorrectOptionIndex,
    required this.answerAttachmentType,
    this.answerAttachmentLocalURI,
    this.answerAttachmentCloudURI,
    required this.timeToAnswer,
    this.lastReviewRating,
    this.lastReviewTimestamp,
    DateTime? updatedAtTimestamp,
  }) : updatedAtTimestamp = updatedAtTimestamp ?? DateTime.now();

  factory DeckCard.fromMap(Map<String, dynamic> json) => DeckCard(
        id: json['id'],
        deckId: json['deckId'],
        type: json['type'].toString().toCardType,
        question: json['question'],
        questionTextType: json['questionTextType'].toString().toTextType,
        questionAttachmentType: json['questionAttachmentType'].toString().toAttachmentType,
        questionAttachmentLocalURI: json['questionAttachmentLocalURI'],
        questionAttachmentCloudURI: json['questionAttachmentCloudURI'],
        answer: json['answer'],
        answerTextType: json['answerTextType'].toString().toTextType,
        answerNumberOfOptions: json['answerNumberOfOptions'],
        answerCorrectOptionIndex: json['answerCorrectOptionIndex'],
        answerAttachmentType: json['answerAttachmentType'].toString().toAttachmentType,
        answerAttachmentLocalURI: json['answerAttachmentLocalURI'],
        answerAttachmentCloudURI: json['answerAttachmentCloudURI'],
        timeToAnswer: Duration(milliseconds: json['timeToAnswer']),
        lastReviewRating: json['lastReviewRating']?.toString().toCardReviewRating,
        lastReviewTimestamp: json['lastReviewTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['lastReviewTimestamp'])
            : null,
        updatedAtTimestamp: DateTime.fromMillisecondsSinceEpoch(json['updatedAtTimestamp'] as int),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'deckId': deckId,
        'type': type.name,
        'question': question,
        'questionTextType': questionTextType.name,
        'questionAttachmentType': questionAttachmentType.name,
        'questionAttachmentLocalURI': questionAttachmentLocalURI,
        'questionAttachmentCloudURI': questionAttachmentCloudURI,
        'answer': answer,
        'answerTextType': answerTextType.name,
        'answerNumberOfOptions': answerNumberOfOptions,
        'answerCorrectOptionIndex': answerCorrectOptionIndex,
        'answerAttachmentType': answerAttachmentType.name,
        'answerAttachmentLocalURI': answerAttachmentLocalURI,
        'answerAttachmentCloudURI': answerAttachmentCloudURI,
        'timeToAnswer': timeToAnswer.inMilliseconds,
        'lastReviewRating': lastReviewRating?.name,
        'lastReviewTimestamp': lastReviewTimestamp?.millisecondsSinceEpoch,
        'updatedAtTimestamp': updatedAtTimestamp.millisecondsSinceEpoch,
      };

  // generate metthod copy with for this class
  DeckCard copyWith({
    int? id,
    int? deckId,
    CardType? type,
    String? question,
    TextType? questionTextType,
    AttachmentType? questionAttachmentType,
    String? questionAttachmentLocalURI,
    String? questionAttachmentCloudURI,
    String? answer,
    TextType? answerTextType,
    int? answerNumberOfOptions,
    int? answerCorrectOptionIndex,
    AttachmentType? answerAttachmentType,
    String? answerAttachmentLocalURI,
    String? answerAttachmentCloudURI,
    Duration? timeToAnswer,
    CardReviewRating? lastReviewRating,
    DateTime? lastReviewTimestamp,
    DateTime? updatedAtTimestamp,
  }) {
    return DeckCard(
      id: id ?? this.id,
      deckId: deckId ?? this.deckId,
      type: type ?? this.type,
      question: question ?? this.question,
      questionTextType: questionTextType ?? this.questionTextType,
      questionAttachmentType: questionAttachmentType ?? this.questionAttachmentType,
      questionAttachmentLocalURI: questionAttachmentLocalURI ?? this.questionAttachmentLocalURI,
      questionAttachmentCloudURI: questionAttachmentCloudURI ?? this.questionAttachmentCloudURI,
      answer: answer ?? this.answer,
      answerTextType: answerTextType ?? this.answerTextType,
      answerNumberOfOptions: answerNumberOfOptions ?? this.answerNumberOfOptions,
      answerCorrectOptionIndex: answerCorrectOptionIndex ?? this.answerCorrectOptionIndex,
      answerAttachmentType: answerAttachmentType ?? this.answerAttachmentType,
      answerAttachmentLocalURI: answerAttachmentLocalURI ?? this.answerAttachmentLocalURI,
      answerAttachmentCloudURI: answerAttachmentCloudURI ?? this.answerAttachmentCloudURI,
      timeToAnswer: timeToAnswer ?? this.timeToAnswer,
      lastReviewRating: lastReviewRating ?? this.lastReviewRating,
      lastReviewTimestamp: lastReviewTimestamp ?? this.lastReviewTimestamp,
      updatedAtTimestamp: updatedAtTimestamp ?? this.updatedAtTimestamp,
    );
  }

  @override
  String toString() {
    return 'Card(id: $id, deckId: $deckId, type: $type, question: $question, questionTextType: $questionTextType, questionAttachmentType: $questionAttachmentType, questionAttachmentLocalURI: $questionAttachmentLocalURI, questionAttachmentCloudURI: $questionAttachmentCloudURI, answer: $answer, answerTextType: $answerTextType, answerNumberOfOptions: $answerNumberOfOptions, answerCorrectOptionIndex: $answerCorrectOptionIndex, answerAttachmentType: $answerAttachmentType, answerAttachmentLocalURI: $answerAttachmentLocalURI, answerAttachmentCloudURI: $answerAttachmentCloudURI, timeToAnswer: $timeToAnswer, lastReviewRating: $lastReviewRating, lastReviewTimestamp: $lastReviewTimestamp, updatedAtTimestamp: $updatedAtTimestamp, score: $score, reviews $reviews)';
  }
}
