import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogWidget extends StatelessWidget {
  DialogWidget({super.key, required this.closeDialog});
  void Function() closeDialog;
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
                Icon(Icons.pets),
                SizedBox(width: 40.0),
                GestureDetector(child: Icon(Icons.close), onTap: closeDialog),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
