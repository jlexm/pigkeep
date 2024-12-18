import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pig_keep/Components/FeedInventory.dart';
import 'package:pig_keep/Components/Layout.dart';
import 'package:pig_keep/Components/MedicalRecords.dart';
import 'package:pig_keep/Components/PigList.dart';
import 'package:pig_keep/Components/PigPen.dart';
import 'package:pig_keep/Components/PigPen_PenNumber.dart';
import 'package:pig_keep/Components/PigView.dart';
import 'package:pig_keep/Constants/color.constants.dart';
import 'package:pig_keep/Providers/global_provider.dart';
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
import 'package:pig_keep/Services/data-sync-service.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/Services/feed-service.dart';
import 'package:pig_keep/Services/ledger.service.dart';
import 'package:pig_keep/Services/local-notification-service.dart';
import 'package:pig_keep/Services/medicine-service.dart';
import 'package:pig_keep/Services/navigation-service.dart';
import 'package:pig_keep/Services/pig-event-service.dart';
import 'package:pig_keep/Services/pig-pen-service.dart';
import 'package:pig_keep/Services/pig-service.dart';
import 'package:pig_keep/Store/auth_storage.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart';

// This is our global ServiceLocator
GetIt globalLocator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // init tz
  initializeTimeZones();
  // init notif
  await LocalNotificationService.setup();

  // register global services
  globalLocator.registerSingleton(DatabaseService());

  // init database
  await globalLocator.get<DatabaseService>().init();

  globalLocator.registerSingleton(DataSyncService());
  globalLocator.registerSingleton(PigPenService());
  globalLocator.registerSingleton(PigService());
  globalLocator.registerSingleton(LedgerService());
  globalLocator.registerSingleton(MedicineService());
  globalLocator.registerSingleton(FeedService());
  globalLocator.registerSingleton(PigEventService());

  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => GlobalProvider())],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String?> init(BuildContext context) async {
    String? token = await AuthStorage.getToken();
    if (token != null) {
      //await globalProvider.fetchFarms();
      await context.read<GlobalProvider>().fetchFarms();
    }
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: init(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final bool isAuth = snapshot.data != null && snapshot.data!.isNotEmpty;

        final GoRouter router = GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              redirect: (context, state) => isAuth ? '/home' : '/login',
            ),
            GoRoute(
              path: '/records',
              redirect: (context, state) => '/records/pens',
            ),
            ShellRoute(
              builder: (context, state, child) {
                return Layout(child: child, currentRoute: state.uri.toString());
              },
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const Home(),
                ),
                ShellRoute(
                    builder: (context, state, child) {
                      return Records(currentView: child);
                    },
                    routes: [
                      GoRoute(
                        path: '/records/pens',
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: const PigPen()),
                      ),
                      GoRoute(
                        path: '/records/pens/:uuid', // Use a named parameter
                        pageBuilder: (context, state) {
                          // Get the UUID from the route parameters
                          final String uuid =
                              state.pathParameters['uuid'] ?? '';
                          return NoTransitionPage(
                            child: PigPenPenNumber(
                                penUUID: uuid), // Pass the UUID to the widget
                          );
                        },
                      ),
                      GoRoute(
                        path: '/records/pigs',
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: const PigList()),
                      ),
                      GoRoute(
                        path: '/records/pigs/:uuid', // Use a named parameter
                        pageBuilder: (context, state) {
                          // Get the UUID from the route parameters
                          final String uuid =
                              state.pathParameters['uuid'] ?? '';
                          return NoTransitionPage(
                            child: PigView(
                                pigUUID: uuid), // Pass the UUID to the widget
                          );
                        },
                      ),
                      GoRoute(
                        path: '/records/feeds',
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: const FeedInventory()),
                      ),
                      GoRoute(
                        path: '/records/medicines',
                        pageBuilder: (context, state) =>
                            NoTransitionPage(child: Medicalrecords()),
                      ),
                    ]),
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

        navigationService.setRouter(router);

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
