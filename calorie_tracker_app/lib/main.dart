
import 'package:flutter/material.dart';
import 'package:calorie_tracker_app/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:calorie_tracker_app/src/model/food_track_task.dart';
import 'package:calorie_tracker_app/src/page/day-view/day-view.dart';
import 'package:calorie_tracker_app/src/page/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'auth/hometest.dart';
import 'src/page/history/history_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker_app/src/providers/theme_notifier.dart';
import 'package:calorie_tracker_app/src/services/shared_preference_service.dart';
import 'package:calorie_tracker_app/helpers/theme.dart';
import 'package:calorie_tracker_app/routes/router.dart';
import 'package:firebase_database/firebase_database.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesService().init();
  runApp(CalorieTrackerApp());
}

class CalorieTrackerApp extends StatefulWidget {
  @override
  CalorieTrackerAppState createState() => CalorieTrackerAppState();
}

class CalorieTrackerAppState extends State<CalorieTrackerApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  late Widget homeWidget;
  late bool signedIn;

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  void checkFirstSeen() {
    final bool _firstLaunch = true;

    if (_firstLaunch) {
      homeWidget = LoginScreen();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder:
            (BuildContext context, DarkThemeProvider value, Widget? child) {
          return GestureDetector(
              onTap: () => hideKeyboard(context),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  builder: (_, Widget? child) => ScrollConfiguration(
                      behavior: MyBehavior(), child: child!),
                  theme: themeChangeProvider.darkTheme ? darkTheme : lightTheme,
                  home: LoginScreen(),
                  onGenerateRoute: RoutePage.generateRoute));
        },
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setSystemUIOverlayStyle(
//     //     SystemUiOverlayStyle(statusBarColor: Colors.amber));
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primaryColor: Colors.red,
//         primarySwatch: Colors.purple,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }


