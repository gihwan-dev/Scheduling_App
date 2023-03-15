import 'package:flutter/material.dart';
import 'package:optimizing_schedule/component/adding_subjects.dart';
import 'package:optimizing_schedule/component/shedule.dart';
import 'available_schedule.dart';
import 'package:optimizing_schedule/component/chekingtemplate.dart';

List<Subject> temp = [];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('시간표 최적화'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Schedule(
            curSubject: [],
            curScore: 0,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => Optimizing_Schedult());
            },
            child: Text('가능한 시간표 검색'),
          ),
        ],
      ),
    );
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
