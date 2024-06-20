import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Deatail Screen',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: (StudentList[si].img != null)
                    ? FileImage(StudentList[si].img!)
                    : null,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      '  Name :',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'GrId :',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Std : ',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '  ${StudentList[si].student_name!.text}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${StudentList[si].student_grid!.text}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${StudentList[si].student_standard!.text}',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
