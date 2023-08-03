import 'package:go_router/go_router.dart';
import 'package:todo/pages/home/index.dart';
import 'package:todo/pages/upsert/upsert_todo.dart';

GoRouter router = GoRouter(
  initialLocation: home,
  routes: _routes,
);

final _routes = <RouteBase>[
  GoRoute(
    path: home,
    name: home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: upsert,
    name: upsert,
    builder: (context, state) => UpsertTodoScreen(),
  ),
];

const home = '/home';
const upsert = '/upsert';
