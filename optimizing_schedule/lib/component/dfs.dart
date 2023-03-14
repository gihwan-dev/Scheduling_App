import 'package:optimizing_schedule/component/shedule.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';
import 'adding_subjects.dart';

List<OptimizedSchedule> resultSubject = [];

class OptimizedSchedule {
  int score = 0;
  List<Subject> subjectList = [...EssentialSubjectList];
}

void dfs(
    Map subjectCheck,
    List<Subject> wantToSubject,
    List<Subject> canDoSubject,
    int idx1,
    int idx2,
    List<Subject> temp,
    int score) {
  for (int i = idx1; i < wantToSubject.length; i++) {
    for (int j = idx2; j < canDoSubject.length; j++) {
      bool check_exist1 = wantToSubject[i]
          .time
          .every((element) => subjectCheck[element[0]][element[1]] == false);
      bool check_exist2 = canDoSubject[j]
          .time
          .every((element) => subjectCheck[element[0]][element[1]] == false);
      // 시간표에 넣을 수 없다
      if (check_exist1) {
        // 시간표에 넣는다.
        wantToSubject[i].time.map((e) => subjectCheck[e[0]][e[1]] == true);
        int initScore = score;
        score += int.parse(wantToSubject[i].score);
        temp.add(wantToSubject[i]);
        dfs(subjectCheck, wantToSubject, canDoSubject, i + 1, j, temp, score);
        wantToSubject[i].time.map((e) => subjectCheck[e[0]][e[1]] == false);
        score = initScore;
      }

      if (check_exist2) {
        canDoSubject[j].time.map((e) => subjectCheck[e[0]][e[1]] == true);
        temp.add(canDoSubject[j]);
        int initScore = score;
        score += int.parse(canDoSubject[j].score);
        dfs(subjectCheck, wantToSubject, canDoSubject, i, j + 1, temp, score);
        canDoSubject[j].time.map((e) => subjectCheck[e[0]][e[1]] == false);
        score = initScore;
      }
    }
  }
  OptimizedSchedule optimizedSchedule = new OptimizedSchedule();
  optimizedSchedule.score = score;
  temp.forEach((element) {
    optimizedSchedule.subjectList.add(element);
  });
  resultSubject.add(optimizedSchedule);
}
