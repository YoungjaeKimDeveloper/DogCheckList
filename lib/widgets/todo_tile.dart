import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTile extends StatelessWidget {
  // Type Definition
  final String textTitle;
  final bool isCompleted;
  final void Function() deleteTask;
  final void Function(bool?) onCheckBox;
  // final void Function(bool?)? onChange;

  // Constructor Parameters
  const TodoTile(
  // ignore: non_constant_identifier_names, use_function_type_syntax_for_parameters, avoid_types_as_parameter_names
  {
    super.key,
    required this.textTitle,
    required this.deleteTask,
    required this.isCompleted,
    required this.onCheckBox,
    // this.onChange,
  });

  // 받을 수 있는 인자 타입 미리 정해놓기
  // void Function(bool?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isCompleted ? true : false,
                  onChanged: onCheckBox,
                ),
                Text(
                  textTitle,
                  style: GoogleFonts.acme().copyWith(
                    color: Colors.yellow[200],
                    fontWeight: FontWeight.bold,
                    decoration:
                        isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: deleteTask,
              child: Icon(Icons.delete, color: Colors.pink[600]),
            ),
          ),
        ],
      ),
    );
  }
}
