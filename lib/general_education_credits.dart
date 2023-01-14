import 'package:flutter/material.dart';

var generalEducationCredits=[];
int generalEducationCredits_weigrhCount = 0;
double? generalEducationCredits_scoreAverage;
int generalEducationCredits_scoreCount=0;

List<String> generalEducationCredits_list = <String>['類型', '核心1', '核心2', '核心3','通識'];


class general_education_credits extends StatefulWidget {
  const general_education_credits({Key? key}) : super(key: key);

  @override
  State<general_education_credits> createState() => _general_education_creditsState();
}

class _general_education_creditsState extends State<general_education_credits> {

  String? _name;
  int? _weigth;
  int? _score;
  String dropdownValue = generalEducationCredits_list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '通識學分門檻：$generalEducationCredits_weigrhCount/16',
                style: TextStyle(
                  fontSize: 20, // 大小
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '通識學分平均：$generalEducationCredits_scoreAverage 分',
                style: TextStyle(
                  fontSize: 20, // 大小
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(5, 178, 145, 1),

        ),
      ),
      body: Container(
        color: Color.fromRGBO(236, 240, 241, 1),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20,),
                Flexible(
                  child: TextField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.book_outlined),
                        labelText: "課程名稱",
                        helperStyle: TextStyle(
                          color: Colors.red,
                        )
                    ),
                    onSubmitted: (text) {
                      _name = text;
                      print(_name);
                    },
                  ),
                ),
                SizedBox(width: 20,),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_circle_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 2,
                    // color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: generalEducationCredits_list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 25,),
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
                      _weigth = int.parse(text);
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
                      _score = int.parse(text);
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
                    if (_name != null && _weigth != null && _score != null && dropdownValue!='類型') {
                      if (generalEducationCredits.contains(
                          [_name, _weigth, _score,dropdownValue])) {

                      } else {
                        setState(() {
                          generalEducationCredits.add([_name, _weigth, _score,dropdownValue]);
                        });
                        generalEducationCredits_weigrhCount += _weigth!;
                        generalEducationCredits_scoreCount +=
                        (_weigth! * _score!);
                        generalEducationCredits_scoreAverage =
                            (generalEducationCredits_scoreCount /
                                generalEducationCredits_weigrhCount)
                                .roundToDouble();
                      }
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

                itemCount: generalEducationCredits.length,
                itemBuilder: (context, index) {
                  final course = generalEducationCredits[index];

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
                          SizedBox(width: 50,),
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
                              int count = course[1];
                              int count2 = course[2];
                              //因為 A value of type 'num' can't be assigned to a variable of type 'int'.
                              //所以先把course[1]放進變數，再做運算
                              generalEducationCredits_weigrhCount -= count;
                              generalEducationCredits_scoreCount -=
                              (count * count2);
                              generalEducationCredits_scoreAverage =
                                  (generalEducationCredits_scoreCount /
                                      generalEducationCredits_weigrhCount)
                                      .roundToDouble();

                              setState(() {
                                generalEducationCredits.removeAt(index);
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
