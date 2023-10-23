import 'package:flutter/material.dart';
import 'package:fluttersnips/screens/intro_page.dart';
import 'package:fluttersnips/screens/showCase/presentation/showCase.dart';
import 'package:fluttersnips/shared/exports.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String recentlyAdded = 'recently-added';
  static const String cards = 'cards';
  static const String shapes = 'shapes';
  static const String navigation = 'navigation';
  static const String webview = 'webview';
  static const String columns = 'column';
  static const String buttons = 'buttons';
}

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Showcase(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: IntroPage());
          },
        ),
        GoRoute(
          path: '/${Routes.recentlyAdded}',
          name: Routes.recentlyAdded,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(0);
            Utils.updateSearchIndex(0);
            return const NoTransitionPage(child: RecentlyAdded());
          },
        ),
        GoRoute(
          path: '/${Routes.cards}',
          name: Routes.cards,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(1);
            Utils.updateSearchIndex(1);
            return const NoTransitionPage(child: Cards());
          },
        ),
        GoRoute(
          path: '/${Routes.shapes}',
          name: Routes.shapes,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(2);
            Utils.updateSearchIndex(2);
            return const NoTransitionPage(child: Shapes());
          },
        ),
        GoRoute(
          path: '/${Routes.navigation}',
          name: Routes.navigation,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(3);
            Utils.updateSearchIndex(3);
            return NoTransitionPage(child: Navigation());
          },
        ),
        GoRoute(
          path: '/${Routes.webview}',
          name: Routes.webview,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(4);
            Utils.updateSearchIndex(4);
            return const NoTransitionPage(child: WebView());
          },
        ),
        GoRoute(
          path: '/${Routes.columns}',
          name: Routes.columns,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(5);
            Utils.updateSearchIndex(5);
            return const NoTransitionPage(child: Column());
          },
        ),
        GoRoute(
          path: '/${Routes.buttons}',
          name: Routes.buttons,
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) {
            sideBarProvider.setCurrentTab(7);
            Utils.updateSearchIndex(7);
            return const NoTransitionPage(child: Buttons());
          },
        ),
      ],
    ),
  ],
);
