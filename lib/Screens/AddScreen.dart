import 'dart:io';

import 'package:core_flutter_exam/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  void set() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: InkWell(
            onTap: () {
              set();
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Add Data',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          // backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                StudentList.length,
                (index) => Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              StudentList.removeAt(index);
                            });
                          },
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                   buildSizedBox('Name', StudentList[index].student_name!),
                    SizedBox(
                      height: 10,
                    ),
                    buildSizedBox('GrId', StudentList[index].student_grid!),
                    SizedBox(
                      height: 10,
                    ),
                    buildSizedBox('Std', StudentList[index].student_standard!),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        StudentList[index].img == null
                            ? const CircleAvatar(
                                radius: 50,
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    (StudentList[index].img != null)
                                        ? FileImage(StudentList[index].img!)
                                        : null,
                              ),
                        TextButton(
                            onPressed: () async {
                              XFile? img = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                StudentList[index].img = File(img!.path);
                              });
                            },
                            child: Text('PickImg'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            TextEditingController txtName = TextEditingController();
            TextEditingController txtGrid = TextEditingController();
            TextEditingController txtstd = TextEditingController();
            File? img;

            setState(() {
              StudentList.add(
                StudentModel(
                    student_name: txtName,
                    student_standard: txtstd,
                    student_grid: txtGrid,
                    img: img),
              );
            });
          },
          child: Text('Add'),
        ),
      ),
    );
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
}
