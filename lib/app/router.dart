import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../initialize/widgets/loading_page.dart';
import '../pages/add_new_page.dart';
import '../pages/edit_profiles.dart';

Map<String, dynamic> getConfig(GoRouterState state) {
  final extra = state.extra;
  if (extra is Map<String, dynamic>) {
    return extra;
  }
  return <String, dynamic>{};
}

final appRouter = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      builder: ((context, state) {
        return LoadingPage();
      }),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final config = state.extra as Map<String, dynamic>;
        // final config = getConfig(state);
        // print(data);
        return HomePage(config: config, content: AddNewPage());
      },
      routes: [
        GoRoute(
          path: "edit-profiles",
          builder: ((context, state) {
            // final config = getConfig(state);
            final config = state.extra as Map<String, dynamic>;
            return HomePage(config: config, content: EditProfiles());
          }),
        ),
      ],
    ),
  ],
);
