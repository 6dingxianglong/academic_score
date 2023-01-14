import 'package:academic_score/professional_credits.dart';

import 'package:flutter/material.dart';
import 'common_credit.dart';
import 'general_education_credits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;
  final screens=[
  const common_credit(),
  const general_education_credits(),
  const professional_credits(),
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('學分計算機',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(5,158,145,1),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.calculate),
              onPressed: () {

              },
            );
          },
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(5,178,145,1),
        selectedItemColor: Colors.white,
        iconSize: 30,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index)=>setState(()=>currentIndex=index),
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.group),
            label: '共同學分',),
          BottomNavigationBarItem(
            icon:Icon(Icons.architecture),
            label: '通識學分',),
          BottomNavigationBarItem(
            icon:Icon(Icons.engineering),
            label: '專業學分',
          )],
      ),
    );
  }
}
