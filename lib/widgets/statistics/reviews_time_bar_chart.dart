import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReviewsTimeBarChart extends StatefulWidget {
  final List<CardReview> reviews;
  final String timelineFilter;

  const ReviewsTimeBarChart({super.key, required this.reviews, required this.timelineFilter});

  @override
  State<ReviewsTimeBarChart> createState() => _ReviewsTimeBarChartState();
}

class _ReviewsTimeBarChartState extends State<ReviewsTimeBarChart> {
  BarChartGroupData getBarGroupDataForTimeToAnswerBetween(
      List<CardReview> reviews, Duration minDuration, Duration maxDuration, int groupIndex) {
    return BarChartGroupData(
      barsSpace: 4,
      x: groupIndex,
      barRods: [
        BarChartRodData(
          toY: reviews
              .where((review) =>
                  review.rating == CardReviewRating.easy &&
                  review.timeToAnswer >= minDuration &&
                  review.timeToAnswer < maxDuration)
              .length
              .toDouble(),
          color: ThemeService.easyCardRatingColor,
          width: 3,
        ),
        BarChartRodData(
          toY: reviews
              .where((review) =>
                  review.rating == CardReviewRating.good &&
                  review.timeToAnswer >= minDuration &&
                  review.timeToAnswer < maxDuration)
              .length
              .toDouble(),
          color: ThemeService.goodCardRatingColor,
          width: 3,
        ),
        BarChartRodData(
          toY: reviews
              .where((review) =>
                  review.rating == CardReviewRating.hard &&
                  review.timeToAnswer >= minDuration &&
                  review.timeToAnswer < maxDuration)
              .length
              .toDouble(),
          color: ThemeService.hardCardRatingColor,
          width: 3,
        ),
      ],
    );
  }

  List<BarChartGroupData> getBarGroupsData() {
    List<CardReview> reviews = widget.reviews.where((review) {
      if (widget.timelineFilter == "last week") {
        return review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 7)));
      } else if (widget.timelineFilter == "last month") {
        return review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 30)));
      } else if (widget.timelineFilter == "last half of the year") {
        return review.reviewTimestamp.isAfter(DateTime.now().subtract(const Duration(days: 180)));
      } else {
        return true;
      }
    }).toList();

    const Duration zeroTimestamp = Duration(seconds: 0);
    const Duration thirtySeconds = Duration(seconds: 30);
    const Duration oneMinute = Duration(minutes: 1);
    const Duration threeMinutes = Duration(minutes: 3);
    const Duration fiveMinutes = Duration(minutes: 5);
    const Duration oneDay = Duration(days: 1); // big and unrealistic upper bound to catch all reviews

    return [
      getBarGroupDataForTimeToAnswerBetween(reviews, zeroTimestamp, thirtySeconds, 0),
      getBarGroupDataForTimeToAnswerBetween(reviews, thirtySeconds, oneMinute, 1),
      getBarGroupDataForTimeToAnswerBetween(reviews, oneMinute, threeMinutes, 2),
      getBarGroupDataForTimeToAnswerBetween(reviews, threeMinutes, fiveMinutes, 3),
      getBarGroupDataForTimeToAnswerBetween(reviews, fiveMinutes, oneDay, 4),
    ];
  }

  Widget getBottomTitlesWidget(double value, TitleMeta meta) {
    final labels = ["<30s", "<1min", "<3min", "<5min", "≥5min"];

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: Text(labels[value.toInt()]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Text(
          widget.timelineFilter == "last week"
              ? LanguageService.translation(context).timeToAnswerForRatingsForLastWeek
              : widget.timelineFilter == "last month"
                  ? LanguageService.translation(context).timeToAnswerForRatingsForLastMonth
                  : widget.timelineFilter == "last half of the year"
                      ? LanguageService.translation(context).timeToAnswerForRatingsForLastHalfYear
                      : LanguageService.translation(context).timeToAnswerForRatingsForAllReviews,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
      AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.black87,
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  String rating;
                  switch (rodIndex) {
                    case 0:
                      rating = "Easy";
                      break;
                    case 1:
                      rating = "Good";
                      break;
                    case 2:
                      rating = "Hard";
                      break;
                    default:
                      rating = "";
                      break;
                  }
                  String rodValueRounded = rod.toY.toInt().toString();
                  String tooltipText = "$rating\n$rodValueRounded";
                  final textColor = rod.gradient?.colors.first ?? rod.color;

                  return BarTooltipItem(
                    tooltipText,
                    TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
                  );
                },
                //  BarTooltipItem(a.toString()),
              ),
              touchCallback: (FlTouchEvent event, response) {},
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: getBottomTitlesWidget,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: const Border(
                top: BorderSide(color: Colors.transparent),
                left: BorderSide(color: Colors.grey, width: 1),
                bottom: BorderSide(color: Colors.grey, width: 1),
                right: BorderSide(color: Colors.transparent),
              ),
            ),
            gridData: FlGridData(show: false),
            barGroups: getBarGroupsData(),
          ),
        ),
      ),
    ]);
  }
}
