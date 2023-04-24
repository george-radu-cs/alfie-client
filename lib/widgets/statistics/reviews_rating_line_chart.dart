import 'package:alfie/models/card_review.dart';
import 'package:alfie/models/card_review_rating.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/services/theme_service.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewsRatingTimeLineChart extends StatefulWidget {
  final List<CardReview> reviews;
  final String timelineFilter;

  const ReviewsRatingTimeLineChart({super.key, required this.reviews, required this.timelineFilter});

  @override
  State<ReviewsRatingTimeLineChart> createState() => _ReviewsRatingTimeLineChartState();
}

class _ReviewsRatingTimeLineChartState extends State<ReviewsRatingTimeLineChart> {
  LineChartData getChartData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.black87,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                String rating;
                switch (barSpot.barIndex) {
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
                String rodValueAsInt = barSpot.y.toInt().toString();
                String tooltipText = "$rating $rodValueAsInt";
                final textColor = barSpot.bar.gradient?.colors.first ?? barSpot.bar.color;

                return LineTooltipItem(
                  tooltipText,
                  TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.center,
                );
              }).toList();
            }),
      ),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 32,
            getTitlesWidget: getBottomTitlesTimespan,
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
      lineBarsData: [
        getBarDataForEasyRatedReviews(),
        getBarDataForGoodRatedReviews(),
        getBarDataForHardRatedReviews(),
      ],
    );
  }

  LineChartBarData getBarDataForEasyRatedReviews() {
    return LineChartBarData(
      isCurved: true,
      color: ThemeService.easyCardRatingColor,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: getRatingsSpotsBasedOnTimelineAndRating(CardReviewRating.easy),
    );
  }

  LineChartBarData getBarDataForGoodRatedReviews() {
    return LineChartBarData(
      isCurved: true,
      color: ThemeService.goodCardRatingColor,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: getRatingsSpotsBasedOnTimelineAndRating(CardReviewRating.good),
    );
  }

  LineChartBarData getBarDataForHardRatedReviews() {
    return LineChartBarData(
      isCurved: true,
      color: ThemeService.hardCardRatingColor,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: getRatingsSpotsBasedOnTimelineAndRating(CardReviewRating.hard),
    );
  }

  List<FlSpot> getRatingsSpotsBasedOnTimelineAndRating(CardReviewRating rating) {
    switch (widget.timelineFilter) {
      case "last week":
        return getRatingSpotsForLastWeek(rating);
      case "last month":
        return getRatingSpotsForLastMonth(rating);
      case "last half of the year":
        return getRatingSpotsForLastHalfYear(rating);
      default:
        return getRatingSpots(rating);
    }
  }

  List<FlSpot> getRatingSpotsForLastWeek(CardReviewRating rating) {
    List<int> spotNumbers = List.generate(7, (index) => 0);

    final sevenDaysBack = DateTime.now().subtract(const Duration(days: 7));
    final sixDaysBack = DateTime.now().subtract(const Duration(days: 6));
    final fiveDaysBack = DateTime.now().subtract(const Duration(days: 5));
    final fourDaysBack = DateTime.now().subtract(const Duration(days: 4));
    final threeDaysBack = DateTime.now().subtract(const Duration(days: 3));
    final twoDaysBack = DateTime.now().subtract(const Duration(days: 2));
    final oneDayBack = DateTime.now().subtract(const Duration(days: 1));
    final today = DateTime.now();

    for (var review in widget.reviews) {
      if (review.rating != rating) {
        continue;
      }

      // filter by time from today for all days in the current week
      if (review.reviewTimestamp.isAfter(sevenDaysBack) && review.reviewTimestamp.isBefore(sixDaysBack)) {
        spotNumbers[0]++;
      } else if (review.reviewTimestamp.isAfter(sixDaysBack) && review.reviewTimestamp.isBefore(fiveDaysBack)) {
        spotNumbers[1]++;
      } else if (review.reviewTimestamp.isAfter(fiveDaysBack) && review.reviewTimestamp.isBefore(fourDaysBack)) {
        spotNumbers[2]++;
      } else if (review.reviewTimestamp.isAfter(fourDaysBack) && review.reviewTimestamp.isBefore(threeDaysBack)) {
        spotNumbers[3]++;
      } else if (review.reviewTimestamp.isAfter(threeDaysBack) && review.reviewTimestamp.isBefore(twoDaysBack)) {
        spotNumbers[4]++;
      } else if (review.reviewTimestamp.isAfter(twoDaysBack) && review.reviewTimestamp.isBefore(oneDayBack)) {
        spotNumbers[5]++;
      } else if (review.reviewTimestamp.isAfter(oneDayBack) && review.reviewTimestamp.isBefore(today)) {
        spotNumbers[6]++;
      }
    }

    return spotNumbers.mapIndexed((index, element) => FlSpot(index.toDouble(), element.toDouble())).toList();
  }

  List<FlSpot> getRatingSpotsForLastMonth(CardReviewRating rating) {
    List<int> spotNumbers = List.generate(4, (index) => 0);

    final fourWeeksBack = DateTime.now().subtract(const Duration(days: 28));
    final threeWeeksBack = DateTime.now().subtract(const Duration(days: 21));
    final twoWeeksBack = DateTime.now().subtract(const Duration(days: 14));
    final oneWeekBack = DateTime.now().subtract(const Duration(days: 7));
    final today = DateTime.now();

    for (var review in widget.reviews) {
      if (review.rating != rating) {
        continue;
      }

      // filter by time from today for all weeks in the current month
      if (review.reviewTimestamp.isAfter(fourWeeksBack) && review.reviewTimestamp.isBefore(threeWeeksBack)) {
        spotNumbers[0]++;
      } else if (review.reviewTimestamp.isAfter(threeWeeksBack) && review.reviewTimestamp.isBefore(twoWeeksBack)) {
        spotNumbers[1]++;
      } else if (review.reviewTimestamp.isAfter(twoWeeksBack) && review.reviewTimestamp.isBefore(oneWeekBack)) {
        spotNumbers[2]++;
      } else if (review.reviewTimestamp.isAfter(oneWeekBack) && review.reviewTimestamp.isBefore(today)) {
        spotNumbers[3]++;
      }
    }

    return spotNumbers.mapIndexed((index, element) => FlSpot(index.toDouble(), element.toDouble())).toList();
  }

  List<FlSpot> getRatingSpotsForLastHalfYear(CardReviewRating rating) {
    List<int> spotNumber = List.generate(6, (index) => 0);

    final sixMonthsBack = DateTime.now().subtract(const Duration(days: 180));
    final fiveMonthsBack = DateTime.now().subtract(const Duration(days: 150));
    final fourMonthsBack = DateTime.now().subtract(const Duration(days: 120));
    final threeMonthsBack = DateTime.now().subtract(const Duration(days: 90));
    final twoMonthsBack = DateTime.now().subtract(const Duration(days: 60));
    final oneMonthBack = DateTime.now().subtract(const Duration(days: 30));
    final today = DateTime.now();

    for (var review in widget.reviews) {
      if (review.rating != rating) {
        continue;
      }

      // filter by time from today for all months in the current half year
      if (review.reviewTimestamp.isAfter(sixMonthsBack) && review.reviewTimestamp.isBefore(fiveMonthsBack)) {
        spotNumber[0]++;
      } else if (review.reviewTimestamp.isAfter(fiveMonthsBack) && review.reviewTimestamp.isBefore(fourMonthsBack)) {
        spotNumber[1]++;
      } else if (review.reviewTimestamp.isAfter(fourMonthsBack) && review.reviewTimestamp.isBefore(threeMonthsBack)) {
        spotNumber[2]++;
      } else if (review.reviewTimestamp.isAfter(threeMonthsBack) && review.reviewTimestamp.isBefore(twoMonthsBack)) {
        spotNumber[3]++;
      } else if (review.reviewTimestamp.isAfter(twoMonthsBack) && review.reviewTimestamp.isBefore(oneMonthBack)) {
        spotNumber[4]++;
      } else if (review.reviewTimestamp.isAfter(oneMonthBack) && review.reviewTimestamp.isBefore(today)) {
        spotNumber[5]++;
      }
    }

    return spotNumber.mapIndexed((index, element) => FlSpot(index.toDouble(), element.toDouble())).toList();
  }

  List<FlSpot> getRatingSpots(CardReviewRating rating) {
    List<int> spotNumbers = List.generate(4, (index) => 0);

    final twelveMonthsBack = DateTime.now().subtract(const Duration(days: 365));
    final nineMonthsBack = DateTime.now().subtract(const Duration(days: 270));
    final sixMonthsBack = DateTime.now().subtract(const Duration(days: 180));
    final threeMonthsBack = DateTime.now().subtract(const Duration(days: 90));
    final today = DateTime.now();

    for (var review in widget.reviews) {
      if (review.rating != rating) {
        continue;
      }

      // filter by time from today for the last 4 quarters of the current year
      if (review.reviewTimestamp.isAfter(twelveMonthsBack) && review.reviewTimestamp.isBefore(nineMonthsBack)) {
        spotNumbers[0]++;
      } else if (review.reviewTimestamp.isAfter(nineMonthsBack) && review.reviewTimestamp.isBefore(sixMonthsBack)) {
        spotNumbers[1]++;
      } else if (review.reviewTimestamp.isAfter(sixMonthsBack) && review.reviewTimestamp.isBefore(threeMonthsBack)) {
        spotNumbers[2]++;
      } else if (review.reviewTimestamp.isAfter(threeMonthsBack) && review.reviewTimestamp.isBefore(today)) {
        spotNumbers[3]++;
      }
    }

    return spotNumbers.mapIndexed((index, element) => FlSpot(index.toDouble(), element.toDouble())).toList();
  }

  Widget getBottomTitlesTimespan(double value, TitleMeta meta) {
    String label;
    if (widget.timelineFilter == "last week") {
      final indexDay = DateTime.now().subtract(Duration(days: 6 - value.toInt()));
      label = DateFormat(DateFormat.ABBR_WEEKDAY).format(indexDay);
    } else if (widget.timelineFilter == "last month") {
      label = (value.toInt() + 1).toString();
    } else if (widget.timelineFilter == "last half of the year") {
      final indexDay = DateTime.now().subtract(Duration(days: 180 - (value.toInt()) * 30));
      label = DateFormat(DateFormat.ABBR_MONTH).format(indexDay);
    } else {
      final indexDay = DateTime.now().subtract(Duration(days: 365 - (value.toInt() + 1) * 3 * 30));
      label = DateFormat(DateFormat.YEAR_ABBR_QUARTER).format(indexDay);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 1,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
            child: Text(
              widget.timelineFilter == "last week"
                  ? LanguageService.translation(context).numberOfRatingsForLastWeek
                  : widget.timelineFilter == "last month"
                      ? LanguageService.translation(context).numberOfRatingsForLastMonth
                      : widget.timelineFilter == "last half of the year"
                          ? LanguageService.translation(context).numberOfRatingsForLastHalfYear
                          : LanguageService.translation(context).numberOfRatingsForAllReviews,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: LineChart(getChartData())),
        ]),
      ),
    );
  }
}
