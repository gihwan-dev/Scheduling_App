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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(98, 205, 255, 1),
        centerTitle: true,
        title: Text('내생에 최고의 시간표'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      backgroundColor: Color.fromRGBO(201, 238, 255, 1),
      drawer: myDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: PageView(
              controller: pageController,
              children: [...displaySchdule(updateHomeFunction)],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(170, 119, 255, 1),
              shadowColor: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    Optimizing_Schedult(homeUpdateFunction: updateHomeFunction),
              );
            },
            child: Text(
              '가능한 시간표 검색',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
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
            decoration: BoxDecoration(
              color: Color.fromRGBO(98, 205, 255, 1),
            ),
            accountName: Text(
              'rlghks358',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              'rlghks358@naver.com',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
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
