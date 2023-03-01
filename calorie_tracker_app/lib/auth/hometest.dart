import 'package:flutter/material.dart';

import '../src/page/day-view/day-view.dart';
import '../src/page/history/history_screen.dart';
import '../src/page/settings/settings_screen.dart';

class Homepager extends StatefulWidget {
  const Homepager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to homepage
          },
          child: const Text('Go Back!'),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _Homepager();
  }
}

class _Homepager extends State<Homepager> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void onClickHistoryScreenButton(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HistoryScreen()));
  }

  void onClickSettingsScreenButton(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  void onClickDayViewScreenButton(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DayViewScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text(
            " \n Calorie Tracker App",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
                leading: const Icon(Icons.food_bank),

                title: new Text(" Welcome To Calorie Tracker!"
                    "\n Track your calorie",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold))),
            new ElevatedButton(
                onPressed: () {
                  onClickDayViewScreenButton(context);
                },
                child: Text("Day View Screen")),
            new ElevatedButton(
                onPressed: () {
                  onClickHistoryScreenButton(context);
                },

                child: Text("History Screen")),
            new ElevatedButton(
                onPressed: () {
                  onClickSettingsScreenButton(context);
                },

                child: Text("Settings Screen")),

            Container(
                color: Colors.black
            ),
            Image.asset(
              'assets/design1.png.png',

            ),

          ],

        ));
}
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}