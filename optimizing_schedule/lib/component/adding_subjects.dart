import 'package:flutter/material.dart';

class AddingSubjects extends StatefulWidget {
  const AddingSubjects({super.key});

  @override
  State<AddingSubjects> createState() => _AddingSubjectsState();
}

class _AddingSubjectsState extends State<AddingSubjects> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                  label: Text('과목명'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
