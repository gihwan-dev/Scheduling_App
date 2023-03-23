import 'package:flutter/material.dart';
import 'package:optimizing_schedule/component/adding_subjects.dart';
import 'package:optimizing_schedule/component/shedule.dart';
import 'available_schedule.dart';
import 'package:optimizing_schedule/component/chekingtemplate.dart';

List<Subject> temp = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  bool updateHome = false;
  @override
  Widget build(BuildContext context) {
    void updateHomeFunction() {
      setState(() {
        updateHome = !updateHome;
        print("Home widget updated");
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: myDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '시간표 마법사',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [...displaySchdule(updateHomeFunction)],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    Optimizing_Schedult(homeUpdateFunction: updateHomeFunction),
              );
            },
            child: Text('가능한 시간표 검색'),
          ),
          Align(
              alignment: Alignment.bottomCenter, child: bottomNavigationBar()),
        ],
      ),
    );
  }

  Row bottomNavigationBar() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                color: Theme.of(context).bottomSheetTheme.backgroundColor),
            child: Center(child: Text('hello')),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Center(child: Text('hello')),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Container(
              child: Text('hello'),
            ),
          ),
        ),
      ],
    );
  }

  List displaySchdule(Function updateHomeFunction) {
    if (favoriteSubjects.length == 0) {
      return [
        Center(
          child: Text('저장된 시간표가 없습니다. 추가해주세요.'),
        )
      ];
    } else {
      return List.generate(
        favoriteSubjects.length,
        (index) {
          return Schedule(
            curScore: favoriteSubjects[index].score,
            curSubject: favoriteSubjects[index].subjectList,
            cur_index: index,
            updateHomeFunction: updateHomeFunction,
            resultCheck: false,
          );
        },
      );
    }
  }

  Drawer myDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('rlghks358'),
            accountEmail: Text('rlghks358@naver.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text('내 정보'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('설정'),
          ),
        ],
      ),
    );
  }
}
