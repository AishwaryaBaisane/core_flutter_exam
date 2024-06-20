import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class StudentModel {
  TextEditingController? student_name;
  TextEditingController? student_grid;
  TextEditingController? student_standard;
  File? img;

  StudentModel(
      {this.student_name, this.student_grid, this.student_standard, this.img});
}

List<StudentModel> StudentList = [];


TextEditingController txtName = TextEditingController();
TextEditingController txtGrid = TextEditingController();
TextEditingController txtstd = TextEditingController();
ImagePicker imagePicker = ImagePicker();
File? img;

