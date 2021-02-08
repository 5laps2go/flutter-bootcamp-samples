import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  var result = task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future task2() {
  Duration duration = Duration(seconds: 3);
  var res = Future.delayed(duration, () {
    String result = 'task 2 data';
    print('Task 2 complete');
    return result;
  });

  return res;
}

void task3(Future task2Data) async {
  String result = 'task 3 data';
  var val = await task2Data;
  // task2Data.then((value) => print('$value'));
  print('Task 3 complete with');
  print(' $val');
}
