import 'package:flutter/material.dart';

class common_credit extends StatefulWidget {
  const common_credit({Key? key}) : super(key: key);

  @override
  State<common_credit> createState() => _common_creditState();
}

class _common_creditState extends State<common_credit> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:Center(
            child: Text("共同學分數")
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(5,178,145,1),

      ),
      body: Container(
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.book_outlined),
                  labelText: "課程名稱",
                  helperStyle: TextStyle(
                    color: Colors.red,
                  )
              ),
              onSubmitted: (text) {
              },
            ),
                Row(
                  children: <Widget>[
                     Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.book_outlined),
                            labelText: "權重",
                            helperStyle: TextStyle(
                              color: Colors.red,
                            )
                        ),
                        onSubmitted: (text) {
                        },
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.book_outlined),
                            labelText: "學期分數",
                            helperStyle: TextStyle(
                              color: Colors.red,
                            )
                        ),
                        onSubmitted: (text) {
                        },
                      ),
                    ),
                  ],
                ),
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