import 'package:optimizing_schedule/component/shedule.dart';
import 'package:optimizing_schedule/screen/available_schedule.dart';
import 'adding_subjects.dart';
import 'chekingtemplate.dart';

void dfs(
  Map subjectCheck,
  List<Subject> wantToSubject,
  List<Subject> canDoSubject,
  List<Subject> temp,
  int score,
  int idx,
  int jdx,
) {
  print('dfs');
  List<Subject> cur_temp = [...temp];
  if (idx >= wantToSubject.length) return;

  Map newsubjectCheck = {...subjectCheck};

  for (int i = idx; i < wantToSubject.length; i++) {
    print('dfs is excuted');
    bool wantCheck = wantToSubject[i].time.every(
      (element) {
        return newsubjectCheck[element[0]][element[1]] == false;
      },
    );
    if (wantCheck == true) {
      wantToSubject[i].time.forEach(
        (element) {
          newsubjectCheck[element[0]][element[1]] = true;
        },
      );
      cur_temp.add(wantToSubject[i]);
      // addedWantToSubject.add(wantToSubject[i]);
      score += int.parse(wantToSubject[i].score);
      dfs(newsubjectCheck, wantToSubject, canDoSubject, cur_temp, score, i + 1,
          jdx);
    }
  }

  for (int j = jdx; j < canDoSubject.length; j++) {
    bool canCheck = canDoSubject[j].time.every(
      (element) {
        return newsubjectCheck[element[0]][element[1]] == false;
      },
    );
    if (canCheck == true) {
      cur_temp.add(canDoSubject[j]);
      // addedCanDoSubject.add(canDoSubject[j]);
      score += int.parse(canDoSubject[j].score);
    }
  }

  OptimizedSchedule optimizedSchedule = new OptimizedSchedule();
  optimizedSchedule.score = score;
  optimizedSchedule.subjectList = [...EssentialSubjectList, ...cur_temp];
  resultSubject.add(optimizedSchedule);

  // addedCanDoSubject.forEach(
  //   (element) {
  //     element.time.forEach(
  //       (element2) {
  //         subjectCheck[element2[0]][element2[1]] = false;
  //       },
  //     );
  //   },
  // );

  // addedWantToSubject.forEach(
  //   (element) {
  //     element.time.forEach(
  //       (element2) {
  //         subjectCheck[element2[0]][element2[1]] = false;
  //       },
  //     );
  //   },
  // );
}
