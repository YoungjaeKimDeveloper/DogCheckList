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
    ["Feeding the dog", false],
    ["Taking the dog for a walk", false],
    ["Giving the dog a kiss", false],
  ];

  // Stateful자체에는 상태가없으므로 setState를 통해서만 접근해야한다.
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  TextEditingController textTracker = TextEditingController();
  // Create new Task and show dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogWidget(
          closeDialog: closeDialog,
          addTask: addTask,
          textTracker: textTracker,
        );
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

  void addTask() {
    setState(() {
      todoList.add([textTracker.text, false]);
      Navigator.of(context).pop();
      textTracker.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAllTaskCompleted = todoList.every((element) => element[1] == true);
    if (isAllTaskCompleted) {
      // 프레임이 끝난 후에 showDialog를 호출
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pet is  happy now❤️",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Icon(Icons.pets, color: Colors.amberAccent),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      });
    }

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
      body: Container(
        decoration: BoxDecoration(color: Colors.pink[100]),
        child: ListView.builder(
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
      ),
    );
  }
}
