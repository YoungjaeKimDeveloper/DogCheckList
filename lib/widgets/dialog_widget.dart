import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogWidget extends StatelessWidget {
  DialogWidget({
    super.key,
    required this.textTracker,
    required this.closeDialog,
    required this.addTask,
  });
  void Function() closeDialog;
  void Function() addTask;
  TextEditingController textTracker;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pink[200],
        ),
        width: 200,
        height: 200,

        child: Column(
          children: [
            SizedBox(width: 20.0),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: textTracker,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20.0),
                  border: OutlineInputBorder(),
                  hintText: "Do something for your pet",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(onTap: addTask, child: Icon(Icons.pets)),
                SizedBox(width: 40.0),
                GestureDetector(onTap: closeDialog, child: Icon(Icons.close)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
