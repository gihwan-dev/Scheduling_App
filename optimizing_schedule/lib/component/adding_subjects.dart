import 'package:flutter/material.dart';

const List<String> day = ['월', '화', '수', '목', '금'];
const List<String> time = ['9', '10', '11', '12', '13', '14', '15', '16', '17'];

class AddingSubjects extends StatefulWidget {
  const AddingSubjects({super.key});

  @override
  State<AddingSubjects> createState() => _AddingSubjectsState();
}

class _AddingSubjectsState extends State<AddingSubjects> {
  late TextEditingController textEditingController;
  String title = '';
  String dropdownDay = day.first;

  @override
  void initState() {
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              child: TextField(
                controller: TextEditingController(),
                onChanged: (value) => {title = value},
                onSubmitted: (value) => {
                  setState(() {
                    title = value;
                  })
                },
                decoration: InputDecoration(
                  label: Text('과목명'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  DropdownButton dayButton() {
    return DropdownButton(
        value: dropdownDay,
        items: day.map((String value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropdownDay = value;
          });
        });
  }
}
