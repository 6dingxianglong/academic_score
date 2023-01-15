import 'package:academic_score/professional_credits.dart';
import 'package:flutter/material.dart';

import 'common_credit.dart';
import 'general_education_credits.dart';
import 'main.dart';

class settlement extends StatefulWidget {
  const settlement({Key? key}) : super(key: key);

  @override
  State<settlement> createState() => _settlementState();
}

class _settlementState extends State<settlement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('結算',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(5,158,145,1),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                    Colors.white10.withOpacity(0.1),
                    BlendMode.dstATop //混合模式，放到上面去
                ),
                image: const AssetImage('assets/nkust.png'),
              ),
            ),
          ),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(padding: EdgeInsets.only(top: 30,left: 20),
                child:const Text(
                  '校內共同課程學分',
                  style: TextStyle(
                    fontSize: 20, // 大小
                    fontWeight: FontWeight.bold,
                  ),
                ) ,),
                Padding(padding: EdgeInsets.only(top: 10,left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '累積學分: $commonCredit_weigrhCount_pass',
                        style: TextStyle(
                          fontSize:20, // 大小
                        ),
                      ) ,
                      Text(
                        '平均分數: $commonCredit_scoreAverage',
                        style: TextStyle(
                          fontSize: 18, // 大小
                        ),
                      ) ,
                      if(commonCredit_weigrhCount_pass>=12)
                      Text(
                        '狀態: 合格',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20, // 大小
                        ),
                      ) ,
                      if(commonCredit_weigrhCount_pass<12)
                        Text(
                        '狀態: 不合格',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20, // 大小
                        ),
                      ) ,
                    ],
                  )),


                Padding(padding: EdgeInsets.only(top: 30,left: 20),
                  child:const Text(
                    '通識課程學分',
                    style: TextStyle(
                      fontSize: 20, // 大小
                      fontWeight: FontWeight.bold,
                    ),
                  ) ,),
                Padding(padding: EdgeInsets.only(top: 10,left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '累積學分: $generalEducationCredits_weigrhCount_pass',
                          style: TextStyle(
                            fontSize: 20, // 大小
                          ),
                        ) ,
                        Text(
                          '核心學分: \n核心1: ${generalEducationCredits_compulsory[0]}\n'
                              '核心2: ${generalEducationCredits_compulsory[1]}\n'
                              '核心3: ${generalEducationCredits_compulsory[2]}\n'
                              '博雅學分: $generalEducationCredits_elective',
                          style: TextStyle(
                            fontSize: 15, // 大小
                          ),
                        ) ,
                        Text(
                          '平均分數: $generalEducationCredits_scoreAverage',
                          style: TextStyle(
                            fontSize: 18, // 大小
                          ),
                        ) ,
                        if(generalEducationCredits_weigrhCount_pass>=16)
                          Text(
                            '狀態: 合格',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20, // 大小
                            ),
                          ) ,
                        if(generalEducationCredits_weigrhCount_pass<16)
                          Text(
                            '狀態: 不合格',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20, // 大小
                            ),
                          ) ,
                      ],
                    )),


                Padding(padding: EdgeInsets.only(top: 30,left: 20),
                  child:const Text(
                    '專業課程學分',
                    style: TextStyle(
                      fontSize: 20, // 大小
                      fontWeight: FontWeight.bold,
                    ),
                  ) ,),
                Padding(padding: EdgeInsets.only(top: 10,left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '累積學分: $professionalCredits_weigrhCount_pass',
                          style: TextStyle(
                            fontSize: 20, // 大小
                          ),
                        ) ,
                        Text(
                          '必修學分: $professionalCredits_compulsory\n'
                              '選修學分: $professionalCredits_elective',
                          style: TextStyle(
                            fontSize: 15, // 大小
                          ),
                        ) ,
                        Text(
                          '平均分數: $professionalCredits_scoreAverage',
                          style: TextStyle(
                            fontSize: 18, // 大小
                          ),
                        ) ,
                        if(professionalCredits_weigrhCount_pass>=100
                            && professionalCredits_compulsory>=56 &&
                            professionalCredits_elective>=44)
                          Text(
                            '狀態: 合格',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20, // 大小
                            ),
                          ) ,
                        if(professionalCredits_weigrhCount_pass<100
                            || professionalCredits_compulsory<=56 ||
                            professionalCredits_elective<=44)
                          Text(
                            '狀態: 不合格',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20, // 大小
                            ),
                          ) ,
                      ],
                    )),

              ],
            ),
          ),
        ],
      )
    );
  }
}
