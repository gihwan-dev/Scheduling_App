import 'package:flutter/material.dart';
import 'shedule.dart';
import 'chekingtemplate.dart';
import 'dfs.dart';

class ShowResult extends StatelessWidget {
  ShowResult({super.key});
  PageController pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                resultSubject.length,
                (index1) {
                  return Schedule(
                    curScore: resultSubject[index1].score,
                    curSubject: resultSubject[index1].subjectList,
                    cur_index: index1,
                  );
                },
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              resultSubject.forEach(
                (element) {
                  if (element.onSaved == true) {
                    favoriteSubjects.add(element);
                  }
                },
              );
              Navigator.pop(context);
            },
            child: Text('저장'),
          ),
        ],
      ),
    );
  }
}
