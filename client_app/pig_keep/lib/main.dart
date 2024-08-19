import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/BottomNav.dart';
import 'package:pig_keep/Components/Layout.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Screens/Events.dart';
import 'package:pig_keep/Screens/Home.dart';
import 'package:pig_keep/Screens/Profile.dart';
import 'package:pig_keep/Screens/Records.dart';
import 'package:pig_keep/Screens/ScanQR.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/home',
      routes: [
        // redirect to default route, home.
        GoRoute(
          path: '/',
          redirect: (context, state) => '/home',
        ),

        // bottomnav bar routes
        ShellRoute(
          builder: (context, state, child) {
            return Layout(child: child);
          },
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => Home(),
            ),
            GoRoute(
              path: '/records',
              builder: (context, state) => Records(),
            ),
            GoRoute(
              path: '/scan-qr',
              builder: (context, state) => ScanQR(),
            ),
            GoRoute(
              path: '/events',
              builder: (context, state) => Events(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => Profile(),
            ),
          ],
        )

        // add custom routes here
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          title: 'PigKeep',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ).copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(primary: appPrimary),
          ),
          routerDelegate: _router.routerDelegate,
          routeInformationParser: _router.routeInformationParser,
          routeInformationProvider: _router.routeInformationProvider,
        );
      },
    );
  }
}
