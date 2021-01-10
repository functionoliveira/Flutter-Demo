import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './enums/task_item_type.dart';

class TaskItem extends StatelessWidget {
  final String text;
  final int index;
  final TaskItemType type;
  final Function handleButtonOnClick;
  
  TaskItem(this.text, this.index, this.type, this.handleButtonOnClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan[900]),
          ),
          RaisedButton(
            child: Text('Feito'),
            onPressed: () => handleButtonOnClick(index),
          )
        ],
      )
    );
  }
}