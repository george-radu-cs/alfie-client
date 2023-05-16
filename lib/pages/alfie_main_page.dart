import 'package:alfie/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:alfie/classes/page_route_data.dart';
import 'package:alfie/pages/account_settings_page.dart';
import 'package:alfie/pages/market_page.dart';
import 'package:alfie/pages/user_decks_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AlfieMainPage extends StatefulWidget {
  const AlfieMainPage({super.key});

  @override
  State<AlfieMainPage> createState() => _AlfieMainPageState();
}

class _AlfieMainPageState extends State<AlfieMainPage> {
  int _pageIndex = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List pages = [
      PageRouteData(LanguageService.translation(context).homePage, Icons.library_books_outlined, const UserDecksPage()),
      // PageRouteData(LanguageService.translation(context).deckMarket, Icons.shop_outlined, const MarketPage()),
      PageRouteData(LanguageService.translation(context).accountAndSettings, Icons.perm_identity_outlined,
          const AccountSettingsPage()),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(pages[_pageIndex].title),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _pageIndex,
          height: 55.0,
          items:
              pages.map((page) => Icon(page.iconData, size: 30, color: Theme.of(context).colorScheme.surface)).toList(),
          color: Theme.of(context).colorScheme.primary,
          buttonBackgroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.surface,
          animationCurve: Curves.easeOutCubic,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 0),
          child: pages[_pageIndex].pageWidget,
        ));
  }
}
