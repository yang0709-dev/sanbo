import 'package:go_router/go_router.dart';
import '../main.dart';
import '../initialize/get_config_data.dart';
import '../initialize/widgets/loading_page.dart';

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
      path: '/',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return HomePage(config: data);
      },
    ),
  ],
);
