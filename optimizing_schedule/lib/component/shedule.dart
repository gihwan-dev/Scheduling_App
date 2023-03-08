import 'package:flutter/material.dart';

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

List check_schedule =
    List.generate(10, (index) => List.generate(6, (index) => 0));

class Subject {
  List time = [];
  String title = '';
  int score = 0;
}

class Schedule extends StatefulWidget {
  Schedule({super.key});
  // List<scheduleDetail>? subjectList = [];
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
          child: Table(
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
                  child: textCheck(hourIndex, dayIndex),
                );
              }));
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '학점: 20.0',
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

  Container textCheck(hourIndex, dayIndex) {
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
}
