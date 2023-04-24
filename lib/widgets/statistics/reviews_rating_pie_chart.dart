import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:alfie/widgets/core/legend_option.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReviewsRatingPieChart extends StatefulWidget {
  final List<CardReview> reviews;
  final String timelineFilter;

  const ReviewsRatingPieChart({super.key, required this.reviews, required this.timelineFilter});

  @override
  State<ReviewsRatingPieChart> createState() => _ReviewsRatingPieChartState();
}

class _ReviewsRatingPieChartState extends State<ReviewsRatingPieChart> {
  int touchedIndex = -1;

  List<PieChartSectionData> getChartSections() {
    List<CardReview> reviews;
    if (widget.timelineFilter == "last week") {
      reviews = widget.reviews
          .where((review) => review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 7))))
          .toList();
    } else if (widget.timelineFilter == "last month") {
      reviews = widget.reviews
          .where((review) => review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 30))))
          .toList();
    } else if (widget.timelineFilter == "last half of the year") {
      reviews = widget.reviews
          .where((review) => review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 180))))
          .toList();
    } else {
      reviews = widget.reviews;
    }
    int numberOfEasyReviews = 0;
    int numberOfMediumReviews = 0;
    int numberOfHardReviews = 0;
    for (CardReview review in reviews) {
      if (review.rating == CardReviewRating.easy) {
        numberOfEasyReviews++;
      } else if (review.rating == CardReviewRating.good) {
        numberOfMediumReviews++;
      } else if (review.rating == CardReviewRating.hard) {
        numberOfHardReviews++;
      }
    }

    return List.generate(CardReviewRating.values.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 22.0 : 14.0;
      final radius = isTouched ? 65.0 : 55.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: ThemeService.easyCardRatingColor,
            value: numberOfEasyReviews.toDouble(),
            title: "${(numberOfEasyReviews / widget.reviews.length * 100).toStringAsFixed(2)}%",
            radius: radius,
            titleStyle: TextStyle(color: Colors.black, fontSize: fontSize),
          );
        case 1:
          return PieChartSectionData(
            color: ThemeService.goodCardRatingColor,
            value: numberOfMediumReviews.toDouble(),
            title: "${(numberOfMediumReviews / widget.reviews.length * 100).toStringAsFixed(2)}%",
            radius: radius,
            titleStyle: TextStyle(color: Colors.black, fontSize: fontSize),
          );
        case 2:
          return PieChartSectionData(
            color: ThemeService.hardCardRatingColor,
            value: numberOfHardReviews.toDouble(),
            title: "${(numberOfHardReviews / widget.reviews.length * 100).toStringAsFixed(2)}%",
            radius: radius,
            titleStyle: TextStyle(color: Colors.black, fontSize: fontSize),
          );
        default:
          throw Error();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        widget.timelineFilter == "last week"
            ? LanguageService.translation(context).ratingsForLastWeek
            : widget.timelineFilter == "last month"
                ? LanguageService.translation(context).ratingsForLastMonth
                : widget.timelineFilter == "last half of the year"
                    ? LanguageService.translation(context).ratingsForLastHalfYear
                    : LanguageService.translation(context).ratingsForAllReviews,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      AspectRatio(
        aspectRatio: 2,
        child: Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 25,
                    sections: getChartSections(),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LegendOption(
                  color: ThemeService.easyCardRatingColor,
                  text: LanguageService.translation(context).easy,
                ),
                const SizedBox(height: 5),
                LegendOption(
                  color: ThemeService.goodCardRatingColor,
                  text: LanguageService.translation(context).good,
                ),
                const SizedBox(height: 5),
                LegendOption(
                  color: ThemeService.hardCardRatingColor,
                  text: LanguageService.translation(context).hard,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
