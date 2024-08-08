import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notbook_todo/config/routes/routes.dart';

final routesProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
        routes: appRoutes,
        initialLocation: RouteLocation.home,
        navigatorKey: navigationKey);
  },
);
