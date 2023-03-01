import 'package:json_annotation/json_annotation.dart';
import 'package:calorie_tracker_app/src/utils/uuid.dart';
import 'package:firebase_database/firebase_database.dart';

@JsonSerializable()
class FoodTrackTask {
  String id;
  String food_name;
  num calories;
  num carbs;
  num protein;
  num fat;
  String mealTime;
  DateTime createdOn;
  num grams;

  FoodTrackTask({
    required this.food_name,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.mealTime,
    required this.createdOn,
    required this.grams,
    String? id,
  }) : this.id = id ?? Uuid().generateV4();

  factory FoodTrackTask.fromSnapshot(DataSnapshot snap) => FoodTrackTask(
      food_name: snap.child('food_name').value as String,
      calories: snap.child('calories') as int,
      carbs: snap.child('carbs').value as int,
      protein: snap.child('protein').value as int,
      fat: snap.child('fat').value as int,
      mealTime: snap.child('mealTime').value as String,
      createdOn: snap.child('createdOn').value as DateTime,
      grams: snap.child('grams').value as int);


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'food_name': food_name,
      'calories': calories,
      'carbs': carbs,
      'protein': protein,
      'fat': fat,
      'mealTime': mealTime,
      'createdOn': createdOn,
      'grams': grams,

    };
  }

  FoodTrackTask.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        food_name = json['food_name'],
        calories = json['calories'],
        carbs = json['carbs'],
        protein = json['protein'],
        fat = json['fat'],
        mealTime = json['mealTime'],
        createdOn = DateTime.parse(json['createdOn']),
        grams = json['grams'];

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'id': id,
    'food_name': food_name,
    'calories': calories,
    'carbs': carbs,
    'protein': protein,
    'fat': fat,
    'mealTime': mealTime,
    'createdOn': createdOn.toString(),
    'grams': grams,
  };
}