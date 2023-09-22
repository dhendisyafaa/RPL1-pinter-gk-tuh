import 'package:data_rpl1/controllers/data_student_controller.dart';
import 'package:data_rpl1/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateClassName extends StatelessWidget {
  UpdateClassName({super.key});

  @override
  DataStudentController dataStudentController = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Edit nama kelas"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              // autofillHints: dataStudentController.classname.toString(),
              controller: dataStudentController.setClassName,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(),
            ),
            ElevatedButton(
                onPressed: () {
                  dataStudentController
                      .changeClassname(dataStudentController.setClassName.text);
                  Get.to(Homepage());
                },
                child: Text("Kirim"))
          ],
        ),
      ),
    );
  }
}
