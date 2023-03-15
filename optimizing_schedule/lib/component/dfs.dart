import 'package:optimizing_schedule/component/shedule.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';
import 'adding_subjects.dart';
import 'chekingtemplate.dart';

List<OptimizedSchedule> resultSubject = [];

class OptimizedSchedule {
  int score = 0;
  List<Subject> subjectList = [];
}

void dfs(
  Map subjectCheck,
  List<Subject> wantToSubject,
  List<Subject> canDoSubject,
  List<Subject> temp,
  int score,
  int idx,
) {
  List<Subject> cur_temp = [];

  for (int i = idx; i < wantToSubject.length; i++) {
    print('dfs is excuted');
    bool wantCheck = wantToSubject[i].time.every((element) {
      print('${element} is ${subjectCheck[element[0]][element[1]]}.');
      print('${element[1].runtimeType}');
      return subjectCheck[element[0]][element[1]] == false;
    });

    if (wantCheck == true) {
      print("wantCheck is true");
      wantToSubject[i].time.forEach((element) {
        subjectCheck[element[0]][element[1]] = true;
      });
      cur_temp.add(wantToSubject[i]);
      score += int.parse(wantToSubject[i].score);
      dfs(subjectCheck, wantToSubject, canDoSubject, cur_temp, score, i + 1);
      wantToSubject[i].time.forEach((element) {
        subjectCheck[element[0]][element[1]] = false;
      });
    }
  }
  OptimizedSchedule optimizedSchedule = new OptimizedSchedule();
  optimizedSchedule.score = score;
  optimizedSchedule.subjectList = [...EssentialSubjectList, ...cur_temp];
  resultSubject.add(optimizedSchedule);
}
