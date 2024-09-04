import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/Layout.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Screens/Caretakers.dart';
import 'package:pig_keep/Screens/ChangePassword.dart';
import 'package:pig_keep/Screens/CreateFarm.dart';
import 'package:pig_keep/Screens/Events.dart';
import 'package:pig_keep/Screens/Home.dart';
import 'package:pig_keep/Screens/Ledger.dart';
import 'package:pig_keep/Screens/Login.dart';
import 'package:pig_keep/Screens/ProfileDetails.dart';
import 'package:pig_keep/Screens/Records.dart';
import 'package:pig_keep/Screens/ScanQR.dart';
import 'package:pig_keep/Screens/Signup.dart';
import 'package:pig_keep/Store/auth_storage.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: AuthStorage.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // or some loading screen
        }

        final bool isAuth = snapshot.data != null && snapshot.data!.isNotEmpty;

        final GoRouter router = GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              redirect: (context, state) => isAuth ? '/home' : '/login',
            ),
            ShellRoute(
              builder: (context, state, child) {
                return Layout(child: child);
              },
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const Home(),
                ),
                GoRoute(
                  path: '/records',
                  builder: (context, state) => const Records(),
                ),
                GoRoute(
                  path: '/scan-qr',
                  builder: (context, state) => const ScanQR(),
                ),
                GoRoute(
                  path: '/events',
                  builder: (context, state) => const Events(),
                ),
                GoRoute(
                  path: '/ledger',
                  builder: (context, state) => const Ledger(),
                ),
                GoRoute(
                  path: '/profiledetails',
                  builder: (context, state) => const ProfileDetails(),
                ),
                GoRoute(
                  path: '/caretakers',
                  builder: (context, state) => const Caretakers(),
                ),
                GoRoute(
                  path: '/changepassword',
                  builder: (context, state) => const ChangePassword(),
                ),
                GoRoute(
                  path: '/create-farm',
                  builder: (context, state) => const Createfarm(),
                ),
              ],
            ),
            GoRoute(
              path: '/login',
              builder: (context, state) => const Login(),
            ),
            GoRoute(
              path: '/sign-up',
              builder: (context, state) => const Signup(),
            ),
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
                colorScheme:
                    ThemeData().colorScheme.copyWith(primary: appPrimary),
              ),
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
            );
          },
        );
      },
    );
  }
}
