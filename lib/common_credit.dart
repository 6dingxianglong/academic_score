import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var commonCredit=[];

int commonCredit_weigrhCount = 0;
int commonCredit_weigrhCount_pass=0;
double? commonCredit_scoreAverage;
int commonCredit_scoreCount=0;

class common_credit extends StatefulWidget {
  const common_credit({Key? key}) : super(key: key);

  @override
  State<common_credit> createState() => _common_creditState();
}

class _common_creditState extends State<common_credit> {

  String? _name;
  int? _weigth;
  int? _score;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child:AppBar(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                '共同學分門檻：$commonCredit_weigrhCount_pass/12',
                style: TextStyle(
                  fontSize: 20, // 大小
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '共同學分平均：$commonCredit_scoreAverage 分',
                style: TextStyle(
                  fontSize: 20, // 大小
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(5,178,145,1),

        ),
      ),
      body: Container(
        color:Color.fromRGBO(236, 240, 241, 1),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Flexible(
                  child:TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.book_outlined),
                        labelText: "課程名稱",
                        helperStyle: TextStyle(
                          color: Colors.red,
                        )
                    ),
                    onSubmitted: (text) {
                      _name=text;
                      print(_name);
                    },
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                     Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.line_weight),
                            labelText: "權重",
                            helperStyle: TextStyle(
                              color: Colors.red,
                            )
                        ),
                        onSubmitted: (text) {
                          _weigth=int.parse(text);
                          print(_weigth);
                        },
                      ),
                    ),
                    SizedBox(width: 30,),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.sports_score_rounded),
                            labelText: "學期分數",
                            helperStyle: TextStyle(
                              color: Colors.red,
                            )
                        ),
                        onSubmitted: (text) {
                          _score=int.parse(text);
                          print(_score);
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                      child: const Text(
                        '紀錄',
                        style: TextStyle(
                          fontSize: 20, // 大小
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                          if(_name!=null && _weigth!=null && _score!=null){
                            if(commonCredit.contains([_name,_weigth,_score])){

                            }else{
                              setState((){
                                commonCredit.add([_name,_weigth,_score]);
                              });
                              if(_score!>=60){
                                commonCredit_weigrhCount_pass+=_weigth!;
                              }
                              commonCredit_weigrhCount+=_weigth!;
                              commonCredit_scoreCount+=(_weigth!*_score!);
                              commonCredit_scoreAverage=(commonCredit_scoreCount/commonCredit_weigrhCount).roundToDouble();
                            }
                          }else{
                            Fluttertoast.showToast(
                                msg: "課程名稱、權重、分數皆避填",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                          },

                    ),
                    SizedBox(width: 20,),
                  ],
                ),
                  SizedBox(height: 20,),
                const Text(
                  "課程/權重/學分",
                  style: TextStyle(
                    fontSize: 20, // 大小
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                    child: ListView.builder(

                      itemCount: commonCredit.length,
                      itemBuilder: (context, index) {
                        final course = commonCredit[index];

                        return Card(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                            child: Row(
                              children: [
                                Text('$course',
                                  style: const TextStyle(
                                    fontSize: 20, // 大小
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 120,),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                  ),

                                  child: const Text(
                                    '刪除',
                                    style: TextStyle(
                                      fontSize: 20, // 大小
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    int count =course[1];
                                    int count2 =course[2];
                                    //因為 A value of type 'num' can't be assigned to a variable of type 'int'.
                                    //所以先把course[1]放進變數，再做運算
                                    if(course[1]!=0 && course[2]>=60){
                                      commonCredit_weigrhCount_pass-=count;
                                    commonCredit_weigrhCount-=count;}
                                    commonCredit_scoreCount-=(count*count2);
                                    commonCredit_scoreAverage=(commonCredit_scoreCount/commonCredit_weigrhCount).roundToDouble();

                                        setState(() {
                                          commonCredit.removeAt(index);
                                        });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                )

          ],
        ),
      ),
    );
  }
}


class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}