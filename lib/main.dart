import 'package:academic_score/professional_credits.dart';
import 'package:academic_score/settlement.dart';

import 'package:flutter/material.dart';
import 'common_credit.dart';
import 'general_education_credits.dart';

void main() {
  runApp(const MyApp());
}

var professionalCredits_compulsory=0;
var professionalCredits_elective=0;

var generalEducationCredits_compulsory=[false,false,false];
var generalEducationCredits_elective=0;

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
        title: Row(
          children: [
            Text('高科大畢業學分計算機',style: TextStyle(color: Colors.white),),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(5,158,145,1),

        actions: <Widget>[
          Builder(
            builder: (context) {
              return Builder(
                builder: (context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      '結算',
                      style: TextStyle(
                        fontSize: 20, // 大小
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                          builder: (BuildContext contest){
                            return settlement();
                          }));

                       professionalCredits_compulsory=0;
                       professionalCredits_elective=0;

                       generalEducationCredits_compulsory=[false,false,false];
                       generalEducationCredits_elective=0;

                       if(generalEducationCredits.isNotEmpty){
                         for(var generalEducationCredit in generalEducationCredits){
                           if(generalEducationCredit[2]>=60){
                             if(generalEducationCredit.contains('核心1')){
                               generalEducationCredits_compulsory[0]=true;}
                             if(generalEducationCredit.contains('核心2')){
                               generalEducationCredits_compulsory[1]=true;}
                             if(generalEducationCredit.contains('核心3')){
                               generalEducationCredits_compulsory[2]=true;}
                           }else{
                             int flash=0;
                             flash=generalEducationCredit[1];
                             generalEducationCredits_elective+=flash;
                           }
                         }
                       }

                      if(professionalCredits.isNotEmpty){
                        for (var professionalCredit in professionalCredits ){
                          if(professionalCredit[2]>=60){
                            if(professionalCredit[3]=='必修'){
                              int flash=0;
                              flash=professionalCredit[1];
                              professionalCredits_compulsory+=flash;
                            }else{
                              int flash=0;
                              flash=professionalCredit[1];
                              professionalCredits_elective+=flash;
                            }
                          }

                        }
                      }

                    },
                  );
                },
              );
            },
          )
        ],
        // leading:
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
