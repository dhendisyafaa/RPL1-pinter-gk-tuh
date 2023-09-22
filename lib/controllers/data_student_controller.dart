import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStudentController extends GetxController {
  RxInt studentTotal = RxInt(1);
  RxBool isOpen = RxBool(false);
  RxString classname = RxString("XII RPL 1");
  RxList studentName = RxList([]);

  TextEditingController setClassName = TextEditingController();
  TextEditingController setStudentName = TextEditingController();
  TextEditingController setSchoolSubject = TextEditingController();

  void increaseStudent() {
    studentTotal++;
  }

  void decreaseStudent() {
    studentTotal--;
  }

  void closeClass(value) {
    isOpen(value);
  }

  void changeClassname(value) {
    classname(value);
  }

  void addStudentName(name) {
    studentName.add(name);
  }
}
