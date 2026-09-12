import 'package:go_router/go_router.dart';
import '../main.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => HomePage(config: ,))],
);
