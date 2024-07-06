import 'package:go_router/go_router.dart';
import 'package:macchiato_pos/views/home_page.dart';
import 'package:macchiato_pos/views/login_page.dart';
import 'package:macchiato_pos/views/register_page.dart';
import 'package:macchiato_pos/services/auth_service.dart';

class AppRouter {
  final AuthService _authService = AuthService();

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
    ],
    redirect: (context, state) async {
      final isAuthenticated = await _authService.getToken() != null;
      final loggingIn = state.uri.toString() == '/';

      if (!isAuthenticated) {
        return loggingIn ? null : '/';
      }

      if (loggingIn) {
        return '/home';
      }

      return null;
    },
  );
}
