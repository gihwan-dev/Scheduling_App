import 'package:flutter/material.dart';
import 'shedule.dart';
import 'dfs.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: PageView(
      children: resultSubject.length > 0
          ? List.generate(resultSubject.length, (index1) {
              if (resultSubject.length == 0) {
                return Placeholder();
              } else {
                List.generate(resultSubject[index1].subjectList.length,
                    (index2) {
                  return Schedule(
                      curSubject: resultSubject[index1].subjectList);
                });
              }
              return Placeholder();
            })
          : [Placeholder()],
    ));
  }
}
