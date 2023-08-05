import 'package:hive_flutter/hive_flutter.dart';

class LvlUpDataBase {
  List mainTasksList = [];
  int score = 0;
  bool hideCompletedTasks = false;
  bool sortByDate = false;

  final myBox = Hive.box('mybox');

  void createInitialData(){
    mainTasksList = [];
    score = 0;
    hideCompletedTasks = false;
    sortByDate = false;
  }

  void loadData() {
    mainTasksList = myBox.get('MAINTASKSLIST');
    score = myBox.get('SCORE');
    hideCompletedTasks = myBox.get('HIDECOMPLETEDTASKS');
    sortByDate = myBox.get('SORTBYDATE');
  }

  void updateDataBase() {
    myBox.put('MAINTASKSLIST', mainTasksList);
    myBox.put('SCORE', score);
    myBox.put('HIDECOMPLETEDTASKS', hideCompletedTasks);
    myBox.put('SORTBYDATE', sortByDate);
  }
}