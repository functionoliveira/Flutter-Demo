import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskListWrap extends StatelessWidget {
  final List<Widget> _list;
  
  TaskListWrap(this._list);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ..._list
        ],
      )
    );
  }
}