import 'package:flutter/material.dart';
import 'package:optimizing_schedule/component/adding_subjects.dart';

List check_schedule =
    List.generate(10, (index) => List.generate(6, (index) => 0));

class Optimizing_Schedult extends StatefulWidget {
  const Optimizing_Schedult({super.key});

  @override
  State<Optimizing_Schedult> createState() => _Optimizing_SchedultState();
}

class _Optimizing_SchedultState extends State<Optimizing_Schedult> {
  int checkState = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AddingSubjects());
                },
                child: Text(checkState == 1
                    ? '필수과목 추가하기'
                    : (checkState == 2 ? '듣고싶은 과목 추가하기' : '들을 수 있는 과목 추가하기')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              child: ListView(),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  if (checkState == 1) {
                    setState(() {
                      checkState = 2;
                    });
                  } else if (checkState == 2) {
                    setState(() {
                      checkState = 3;
                    });
                  } else {
                    setState(() {
                      Navigator.pop(context);
                      checkState = 1;
                    });
                  }
                },
                child: Text(checkState == 3 ? '완료' : '다음'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
