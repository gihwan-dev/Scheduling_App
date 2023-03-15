import 'package:flutter/material.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';
import 'chekingtemplate.dart';

bool checkTime(List curTime) {
  for (int i = 0; i < curTime.length; i++) {
    if (essentailSubjectCheck[curTime[i][0]][curTime[i][1]] == true) {
      return false;
    } else {
      essentailSubjectCheck[curTime[i][0]][curTime[i][1]] = true;
    }
  }
  return true;
}

void removeTime(List curTime) {
  for (int i = 0; i < curTime.length; i++) {
    essentailSubjectCheck[curTime[i][0]][curTime[i][1]] = false;
  }
}

class AddingSubjects extends StatefulWidget {
  const AddingSubjects({
    required this.stateCheck,
    required this.savedCheckedfuntion,
    super.key,
  });

  final int stateCheck;
  final savedCheckedfuntion;

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
                controller: textEditingController,
                onChanged: (value) => {
                  title = value,
                  textEditingController.value =
                      textEditingController.value.copyWith(text: title),
                },
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
                autofocus: true,
                controller: scoreController,
                decoration: InputDecoration(
                  label: Text('학점'),
                ),
                onChanged: (value) => {
                  score = value,
                  scoreController.value =
                      scoreController.value.copyWith(text: score),
                },
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
                  if (widget.stateCheck == 1) {
                    if (checkTime(curTime)) {
                      Subject temp = new Subject();
                      temp.title = title;
                      temp.score = score;
                      curTime.forEach((element) {
                        temp.time.add(element);
                      });
                      curTime = [];
                      widget.savedCheckedfuntion(temp);
                      Navigator.pop(context);
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Container(
                              width: 100,
                              height: 50,
                              child: AlertDialog(
                                title: Text('필수과목은 시간이 겹칠 수 없습니다.'),
                                content: Text('겹치지 않게 선택해 주세요.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  } else {
                    Subject temp = new Subject();
                    temp.title = title;
                    temp.score = score;
                    curTime.forEach((element) {
                      temp.time.add(element);
                    });
                    curTime = [];
                    widget.savedCheckedfuntion(temp);
                    Navigator.pop(context);
                  }
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
