import 'package:flutter/material.dart';
import 'adding_subjects.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';

// class scheduleDetail {
//   bool? cyber;
//   List<Map<String, int>>? day_and_time;
//   String? subjectName;
//   int? score;
// }

List week = [
  '',
  '월',
  '화',
  '수',
  '목',
  '금',
];

const time_template = {
  '월': 1,
  '화': 2,
  '수': 3,
  '목': 4,
  '금': 5,
};

List check_schedule =
    List.generate(10, (index) => List.generate(6, (index) => 0));

class Schedule extends StatefulWidget {
  Schedule({required this.curSubject, super.key});
  final List<Subject> curSubject;
  // List<scheduleDetail>? subjectList = [];
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Subject testSubject = new Subject();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      testSubject.title = '인공지능';
      testSubject.time = [
        ['목', '10'],
        ['금', '12']
      ];
      testSubject.score = '2';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: Text(
            'Favorites Schedule',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.black),
          ),
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              scheduleMaker(textCheck),
              // scheduleMaker(subjectChecker, eachSubject: testSubject),
              ...List.generate(widget.curSubject.length, (index) {
                return scheduleMaker(subjectChecker,
                    eachSubject: widget.curSubject[index]);
              })
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '학점: ',
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite),
            )
          ],
        )
      ],
    );
  }

  Container textCheck(hourIndex, dayIndex, Subject? eachSubject) {
    if (hourIndex == 0) {
      return Container(
        height: 20,
        child: Center(
          child: Text('${week[dayIndex]}'),
        ),
      );
    } else if (dayIndex == 0) {
      return Container(
        height: 30,
        child: Center(
          child: Text('${hourIndex + 8}'),
        ),
      );
    } else {
      return Container(
        height: 30,
        child: Center(
          child: Text(''),
        ),
      );
    }
  }

  Table scheduleMaker(Function makingTableContent,
      {Subject? eachSubject = null}) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(3),
        3: FlexColumnWidth(3),
        4: FlexColumnWidth(3),
        5: FlexColumnWidth(3),
      },
      children: List<TableRow>.generate(10, (hourIndex) {
        return TableRow(
            children: List.generate(6, (dayIndex) {
          return TableCell(
            child: makingTableContent(hourIndex, dayIndex, eachSubject),
          );
        }));
      }),
    );
  }

  Container subjectChecker(hourIndex, dayIndex, Subject? eachSubject) {
    if (hourIndex == 0) {
      return Container(
        height: 20,
        child: Center(
          child: Text('${week[dayIndex]}'),
        ),
      );
    } else if (dayIndex == 0) {
      return Container(
        height: 30,
        child: Center(
          child: Text('${hourIndex + 8}'),
        ),
      );
    } else {
      if (eachSubject == null) {
        return Container(
          height: 30,
          child: Center(
            child: Text(''),
          ),
        );
      } else {
        for (int i = 0; i < eachSubject.time.length; i++) {
          if (time_template[eachSubject.time[i][0]] == dayIndex &&
              int.parse(eachSubject.time[i][1]) == hourIndex + 8) {
            return Container(
              decoration: BoxDecoration(color: Colors.pink),
              height: 30,
              child: Center(
                child: Text('${eachSubject.title}'),
              ),
            );
          }
        }
        return Container(
          height: 30,
          child: Center(
            child: Text(''),
          ),
        );
      }
    }
  }
}
