import 'package:go_router/go_router.dart';

class NavigationService {
  late GoRouter _router;

  // Initialize the router
  void setRouter(GoRouter router) {
    _router = router;
  }

  // Navigate to a specific route
  void navigateTo(String path) {
    _router.go(path);
  }

  // Push a route onto the stack
  void pushTo(String path) {
    _router.push(path);
  }

  void replaceTo(String path) {
    _router.replace(path);
  }
}

// Create a singleton instance of the NavigationService
final NavigationService navigationService = NavigationService();
