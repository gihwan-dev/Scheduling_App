import 'package:flutter/material.dart';

const List<String> day = ['월', '화', '수', '목', '금'];
const List<String> time = ['9', '10', '11', '12', '13', '14', '15', '16', '17'];

class Subject {
  String title = '';
  String score = '';
  List time = [];
}

class AddingSubjects extends StatefulWidget {
  const AddingSubjects({
    super.key,
  });

  @override
  State<AddingSubjects> createState() => _AddingSubjectsState();
}

class _AddingSubjectsState extends State<AddingSubjects> {
  late TextEditingController textEditingController;
  late TextEditingController scoreController;
  String title = '';
  String dropdownDay = day.first;
  String dropdowntime = time.first;
  String score = '';
  List curTime = [];
  List<Subject> subjectList = [];

  @override
  void initState() {
    textEditingController = new TextEditingController();
    scoreController = new TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    scoreController.dispose();
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dayButton(),
                timeButton(),
                TextButton(
                    onPressed: () {
                      setState(() {
                        curTime.add([dropdownDay, dropdowntime]);
                      });
                    },
                    child: Text('추가')),
              ],
            ),
            Container(
              width: 50,
              child: TextField(
                controller: scoreController,
                decoration: InputDecoration(
                  label: Text('학점'),
                ),
                onChanged: (value) => {score = value},
                onSubmitted: (value) => {
                  setState(() {
                    score = value;
                  })
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 150,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(curTime.length, (index) {
                    return ListTile(
                      title: Text('${curTime[index][0]}'),
                      subtitle: Text('${curTime[index][1]}'),
                      onLongPress: () => {
                        setState(() {
                          curTime.removeAt(index);
                        }),
                      },
                    );
                  })),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Subject temp = new Subject();
                  temp.title = title;
                  temp.score = score;
                  temp.time.add(curTime);
                  subjectList.add(temp);
                  curTime = [];
                });
              },
              child: Text('저장'),
            ),
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

  DropdownButton timeButton() {
    return DropdownButton(
      value: dropdowntime,
      items: time.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: value,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdowntime = value;
        });
      },
    );
  }
}
