import 'package:flutter/material.dart';
import 'adding_subjects.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';
import 'chekingtemplate.dart';
import 'package:optimizing_schedule/component/schdule_color.dart';

// class scheduleDetail {
//   bool? cyber;
//   List<Map<String, int>>? day_and_time;
//   String? subjectName;
//   int? score;
// }

List check_schedule =
    List.generate(10, (index) => List.generate(6, (index) => 0));

class Schedule extends StatefulWidget {
  Schedule({
    required this.curScore,
    required this.curSubject,
    required this.cur_index,
    required this.updateHomeFunction,
    required this.resultCheck,
    super.key,
  });
  final List<Subject> curSubject;
  final int curScore;
  final int cur_index;
  final Function updateHomeFunction;
  final bool resultCheck;
  // List<scheduleDetail>? subjectList = [];
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Subject testSubject = new Subject();
  Icon? savedCheckIcon;
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
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color.fromRGBO(98, 205, 255, 1),
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
            child: Text(
              'Favorites Schedule',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(98, 205, 255, 1),
          ),
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              scheduleMaker(textCheck),
              // scheduleMaker(subjectChecker, eachSubject: testSubject),
              ...List.generate(widget.curSubject.length, (index) {
                return scheduleMaker(subjectChecker,
                    eachSubject: widget.curSubject[index],
                    color: colors[index]);
              })
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '학점: ${widget.curScore}',
            ),
            IconButton(
              onPressed: () {
                widget.updateHomeFunction();
                setState(() {
                  if (resultSubject[widget.cur_index].onSaved == false) {
                    resultSubject[widget.cur_index].onSaved = true;
                    savedCheckIcon = Icon(Icons.favorite);
                  } else {
                    resultSubject[widget.cur_index].onSaved = false;
                    savedCheckIcon = Icon(Icons.favorite_border);
                  }
                });
              },
              icon: resultSubject[widget.cur_index].onSaved
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            )
          ],
        )
      ],
    );
  }

  Container textCheck(hourIndex, dayIndex, Subject? eachSubject, Color? color) {
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
      {Subject? eachSubject = null, Color? color}) {
    return Table(
      border: TableBorder.all(color: Colors.white),
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
            child: makingTableContent(
              hourIndex,
              dayIndex,
              eachSubject,
              color,
            ),
          );
        }));
      }),
    );
  }

  Container subjectChecker(
      hourIndex, dayIndex, Subject? eachSubject, Color? color) {
    if (hourIndex == 0) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        height: 20,
        child: Center(
          child: Text('${week[dayIndex]}'),
        ),
      );
    } else if (dayIndex == 0) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        height: 30,
        child: Center(
          child: Text('${hourIndex + 8}'),
        ),
      );
    } else {
      if (eachSubject == null) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          height: 30,
          child: Center(
            child: Text(''),
          ),
        );
      } else {
        if (count_color >= colors.length) {
          count_color = 0;
        }
        for (int i = 0; i < eachSubject.time.length; i++) {
          if (time_template[eachSubject.time[i][0]] == dayIndex &&
              int.parse(eachSubject.time[i][1]) == hourIndex + 8) {
            return Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              height: 30,
              child: Center(
                child: Text('${eachSubject.title}'),
              ),
            );
          }
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          height: 30,
          child: Center(
            child: Text(''),
          ),
        );
      }
    }
  }
}
