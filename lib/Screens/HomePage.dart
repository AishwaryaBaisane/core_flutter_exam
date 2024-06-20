import 'dart:io';

import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void set() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                set();
              },
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              )),
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text(
            'Student List',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        body: Column(
          children: [
            ...List.generate(
              StudentList.length,
              (index) => Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 400,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: (StudentList[index].img != null)
                              ? FileImage(StudentList[index].img!)
                              : null,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              StudentList[index].student_grid!.text,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              StudentList[index].student_name!.text,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              StudentList[index].student_standard!.text,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Column(children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      StudentList.removeAt(
                                                          index);
                                                    },
                                                    child: Icon(Icons.close),
                                                  ),
                                                ],
                                              ),
                                              buildSizedBox(
                                                  'Name',
                                                  StudentList[index]
                                                      .student_name!),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              buildSizedBox(
                                                  'GrId',
                                                  StudentList[index]
                                                      .student_grid!),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              buildSizedBox(
                                                  'Std',
                                                  StudentList[index]
                                                      .student_standard!),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  StudentList[index].img == null
                                                      ? const CircleAvatar(
                                                          radius: 50,
                                                        )
                                                      : CircleAvatar(
                                                          radius: 50,
                                                          backgroundImage:
                                                              (StudentList[index]
                                                                          .img !=
                                                                      null)
                                                                  ? FileImage(
                                                                      StudentList[
                                                                              index]
                                                                          .img!)
                                                                  : null,
                                                        ),
                                                  TextButton(
                                                      onPressed: () async {
                                                        XFile? img = await imagePicker
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        setState(() {
                                                          StudentList[index]
                                                                  .img =
                                                              File(img!.path);
                                                        });
                                                      },
                                                      child: Text('PickImg'))
                                                ],
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                      set();
                                                    });
                                                  },
                                                  child: Text('Update')),
                                              TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  child: Text('Cancle'))
                                            ],
                                          ),
                                        ]),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    StudentList.removeAt(index);
                                  });
                                },
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget buildSizedBox(String title, TextEditingController Controller) {
  return Center(
    child: SizedBox(
      height: 60,
      width: 400,
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
