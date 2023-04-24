import 'package:alfie/models/card_review.dart';
import 'package:alfie/services/card_review_service.dart';
import 'package:alfie/services/language_service.dart';
import 'package:alfie/utils/string.dart';
import 'package:alfie/widgets/statistics/reviews_rating_pie_chart.dart';
import 'package:alfie/widgets/statistics/reviews_rating_line_chart.dart';
import 'package:alfie/widgets/statistics/reviews_time_bar_chart.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String timelineFilter = "all";
  late Future<List<CardReview>> _getReviews;

  @override
  void initState() {
    _getReviews = CardReviewService.instance.getCardReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getReviews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).statistics)),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Scaffold(
              appBar: AppBar(title: Text(LanguageService.translation(context).statistics)),
              body: Center(child: Text(LanguageService.translation(context).errorWhileFetchingCardReviews)));
        } else {
          List<CardReview> reviews = snapshot.data as List<CardReview>;

          return Scaffold(
            appBar: AppBar(title: Text(LanguageService.translation(context).statistics)),
            body: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(children: [
                            Icon(
                              Icons.av_timer_outlined,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                LanguageService.translation(context).selectTimelineFitlerForStatistics,
                              ),
                            ),
                          ]),
                        ),
                        DropdownButton(
                          isExpanded: false,
                          value: timelineFilter,
                          items: ["all", "last week", "last month", "last half of the year"]
                              .map((e) => DropdownMenuItem(value: e, child: Text(e.toTitleCase)))
                              .toList(),
                          onChanged: (newTimelineFilter) {
                            if (newTimelineFilter != null) {
                              setState(() => timelineFilter = newTimelineFilter);
                            }
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20,
                    ),
                    ReviewsRatingPieChart(reviews: reviews, timelineFilter: timelineFilter),
                    const Divider(),
                    ReviewsRatingTimeLineChart(reviews: reviews, timelineFilter: timelineFilter),
                    const Divider(),
                    ReviewsTimeBarChart(reviews: reviews, timelineFilter: timelineFilter)
                  ]),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
