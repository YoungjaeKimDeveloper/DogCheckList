import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raise_dog/widgets/dialog_widget.dart';
import 'package:raise_dog/widgets/todo_tile.dart';

class HoemPage extends StatefulWidget {
  const HoemPage({super.key});

  @override
  State<HoemPage> createState() => _HoemPageState();
}

class _HoemPageState extends State<HoemPage> {
  List todoList = [
    ["멍멍이 밥주기", false],
    ["고양이 밥주기", false],
    ["고양이 밥주기", false],
  ];

  // Stateful자체에는 상태가없으므로 setState를 통해서만 접근해야한다.
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // Create new Task and show dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(closeDialog: closeDialog);
      },
    );
  }

  // Close the AlertDialog
  void closeDialog() {
    Navigator.of(context).pop();
  }

  // Check the Check box
  void onCheckBox(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.abc_outlined, color: Colors.pink[200]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        leading: Icon(Icons.pets, color: Colors.brown[400]),
        title: Text(
          "Dog Day",
          style: GoogleFonts.acme().copyWith(
            color: Colors.pink[200],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            textTitle: todoList[index][0],
            isCompleted: todoList[index][1],
            deleteTask: () => deleteTask(index),
            onCheckBox: (value) => onCheckBox(value, index),
          );
        },
      ),
    );
  }
}
