import 'package:flutter/material.dart';
import 'package:optimizing_schedule/component/adding_subjects.dart';
import 'package:optimizing_schedule/component/show_result.dart';
import 'package:optimizing_schedule/component/dfs.dart';
import 'package:optimizing_schedule/component/chekingtemplate.dart';

class ResultSubject {
  List subjects = [];
}

class Optimizing_Schedult extends StatefulWidget {
  const Optimizing_Schedult({
    super.key,
  });

  @override
  State<Optimizing_Schedult> createState() => _Optimizing_SchedultState();
}

class _Optimizing_SchedultState extends State<Optimizing_Schedult> {
  int checkState = 1;

  void savedCheckedfuntion(Subject newSubject) {
    setState(() {
      if (checkState == 1) {
        EssentialSubjectList.add(newSubject);
      } else if (checkState == 2) {
        WantToSubjectList.add(newSubject);
      } else {
        CanSubjectList.add(newSubject);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          width: 300,
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
                          builder: (BuildContext context) => AddingSubjects(
                                stateCheck: checkState,
                                savedCheckedfuntion: savedCheckedfuntion,
                              ));
                    },
                    child: Text(checkState == 1
                        ? '필수과목 추가하기'
                        : (checkState == 2
                            ? '듣고싶은 과목 추가하기'
                            : '들을 수 있는 과목 추가하기')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  child: ListView(
                    children: [...displaySubject()],
                  ),
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
                        Navigator.pop(context);
                        dfs(essentailSubjectCheck, WantToSubjectList,
                            CanSubjectList, [], 0, 0, 0);
                        EssentialSubjectList.forEach((element) {
                          element.time.forEach((element) {
                            essentailSubjectCheck[element[0]][element[1]] =
                                false;
                          });
                        });
                        EssentialSubjectList.clear();
                        WantToSubjectList.clear();
                        CanSubjectList.clear();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ShowResult();
                            });
                        setState(() {
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

  List displaySubject() {
    if (checkState == 1) {
      return List.generate(EssentialSubjectList.length, (index) {
        return ListTile(
          title: Text('${EssentialSubjectList[index].title}'),
          subtitle: Text('${EssentialSubjectList[index].time}'),
          onLongPress: () {
            removeTime(EssentialSubjectList[index].time);
            setState(() {
              EssentialSubjectList.removeAt(index);
            });
          },
        );
      });
    } else if (checkState == 2) {
      return List.generate(WantToSubjectList.length, (index) {
        return ListTile(
          title: Text('${WantToSubjectList[index].title}'),
          subtitle: Text('${WantToSubjectList[index].time}'),
          onLongPress: () {
            setState(() {
              WantToSubjectList.removeAt(index);
            });
          },
        );
      });
    } else {
      return List.generate(CanSubjectList.length, (index) {
        return ListTile(
          title: Text('${CanSubjectList[index].title}'),
          subtitle: Text('${CanSubjectList[index].time}'),
          onLongPress: () {
            CanSubjectList.removeAt(index);
          },
        );
      });
    }
  }
}
