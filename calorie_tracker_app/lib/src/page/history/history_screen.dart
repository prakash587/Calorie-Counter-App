import 'package:flutter/material.dart';
import 'package:calorie_tracker_app/src/model/food_track_task.dart';
import 'package:calorie_tracker_app/src/utils/charts/datetime_series_chart.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final bool _isBack = true;
  @override
  void initState() {
    super.initState();
  }

  void onClickBackButton() {
    print("Back Button");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "History Screen",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: DateTimeChart(),
        ));
  }
}