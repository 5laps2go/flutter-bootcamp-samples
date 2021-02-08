import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, chile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              onCheckboxChanged: (value) {
                taskData.updateTask(task, value);
              },
              onLongPress: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.count,
        ),
      );
    });
  }
}
