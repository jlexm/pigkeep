import 'package:go_router/go_router.dart';

class NavigationService {
  late GoRouter _router;

  // initialize the router
  void setRouter(GoRouter router) {
    _router = router;
  }

  // navigate to a specific route
  void navigateTo(String path) {
    _router.go(path);
  }

  // push a route onto the stack
  void pushTo(String path) {
    _router.push(path);
  }

  void replaceTo(String path) {
    _router.replace(path);
  }
}

final NavigationService navigationService = NavigationService();
