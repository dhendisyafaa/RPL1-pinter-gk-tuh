import 'package:data_rpl1/controllers/data_student_controller.dart';
import 'package:data_rpl1/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    DataStudentController dataStudentController = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade300,
          title: Text("Tambah Siswa")),
      body: Container(
        child: Column(
          children: [
            TextField(
              // autofillHints: dataStudentController.classname.toString(),
              controller: dataStudentController.setStudentName,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(),
            ),
            ElevatedButton(
                onPressed: () {
                  dataStudentController.addStudentName(
                      dataStudentController.setStudentName.text);
                  Get.to(Homepage());
                },
                child: Text("Kirim"))
          ],
        ),
      ),
    );
  }
}
