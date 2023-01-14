import 'package:flutter/material.dart';

import 'data.dart';


var commonCredit=[];
int _weigrhCount = 0;
double? _scoreAverage;

class common_credit extends StatefulWidget {
  const common_credit({Key? key}) : super(key: key);

  @override
  State<common_credit> createState() => _common_creditState();
}

class _common_creditState extends State<common_credit> {

  String? _name;
  int? _weigth;
  int? _score;
  int _scoreCount=0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              '共同學分門檻：$_weigrhCount/12',
              style: TextStyle(
                fontSize: 20, // 大小
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '共同學分平均：$_scoreAverage 分',
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
      body: Container(
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

                          if(commonCredit.contains([_name,_weigth,_score])){

                          }else{
                            setState((){
                              commonCredit.add([_name,_weigth,_score]);
                            });
                            _weigrhCount+=_weigth!;
                            _scoreCount+=(_weigth!*_score!);
                            _scoreAverage=(_scoreCount/_weigrhCount).roundToDouble();
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
                                    _weigrhCount-=count;
                                    _scoreCount-=(count*count2);
                                    _scoreAverage=(_scoreCount/_weigrhCount).roundToDouble();

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