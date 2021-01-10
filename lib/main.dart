import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './task_item.dart';
import 'task_list_wrap.dart';
import './enums/task_item_type.dart';

main() => runApp(TaskList());

enum TaskListDisplayType {
  OPENED,
  CLOSED
}

class _TaskListState extends State<TaskList> {
  TaskListDisplayType _showList = TaskListDisplayType.OPENED;
  List<Widget> _widgetTasksList;
  final List<String> _openTaskList = [
    '1 - Ir ao mercado.',
    '2 - Pagar contas.',
    '3 - Estudar Ingles.',
    '4 - Fazer vídeo chamada.'
  ];
  final List<String> _closeTaskList = [
    '1 - Dar banho no cachorro.',
    '2 - Lavar o carro.',
    '3 - Pegar o bolo.'
  ];

  _handleCloseTask (index) {
    setState(() {
      _closeTaskList.add(_openTaskList.removeAt(index));
    });
  }

  _handleOpenTask (index) {
    setState(() {
      _openTaskList.add(_closeTaskList.removeAt(index));
    });
  }

  _handleChangeVisibilityDisplay (TaskListDisplayType val) {
    _showList = val;
    setState(() {
      int index = 0;
      if (_showList == TaskListDisplayType.OPENED) {
        _widgetTasksList = _openTaskList.map((t) => TaskItem(t, index, TaskItemType.OPENED, _handleCloseTask)).toList();
      } else {
        _widgetTasksList = _closeTaskList.map((t) => TaskItem(t, index, TaskItemType.CLOSED, _handleOpenTask)).toList();
      }
    });
  }

  get _showOpenedTaskList {
    return _showList == TaskListDisplayType.OPENED;
  }

  Widget build (BuildContext context) {
    _handleChangeVisibilityDisplay(_showList);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text('Tarefas abertas'),
                  onPressed: _showOpenedTaskList ? null : () => _handleChangeVisibilityDisplay(TaskListDisplayType.OPENED)
                ),
                RaisedButton(
                  child: Text('Tarefas fechadas'),
                  onPressed: _showOpenedTaskList ? () => _handleChangeVisibilityDisplay(TaskListDisplayType.CLOSED) : null
                ),
              ],
            ),
            _showOpenedTaskList ? 
              TaskListWrap(_widgetTasksList)
              : TaskListWrap(_widgetTasksList),
          ],
        ),
      )
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() {
    return _TaskListState();
  }
}