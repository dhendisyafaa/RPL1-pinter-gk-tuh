import 'package:data_rpl1/controllers/data_student_controller.dart';
import 'package:data_rpl1/pages/add_school_subject.dart';
import 'package:data_rpl1/pages/add_student.dart';
import 'package:data_rpl1/pages/update_classname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  DataStudentController dataStudentController =
      Get.put(DataStudentController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text('XII RPL 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed: () {
              Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {
                            Get.to(UpdateClassName());
                          },
                          title: Text('Edit nama kelas'),
                        ),
                        ListTile(
                          onTap: () {
                            dataStudentController.studentTotal != 37
                                ? Get.to(AddStudent())
                                : null;
                          },
                          title: Text(
                            'Tambah Siswa',
                            style: TextStyle(
                                color: dataStudentController.studentTotal == 37
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(AddSchoolSubject());
                          },
                          title: Text('Tambah mata pelajaran'),
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade300),
                    child: Obx(() => Text(
                          dataStudentController.classname.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jumlah Siswa ="),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(25, 25),
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(1),
                                  backgroundColor: Colors.deepPurple.shade300),
                              onPressed: () {
                                if (dataStudentController.studentTotal != 1 &&
                                    dataStudentController.isOpen.value ==
                                        false) {
                                  return dataStudentController
                                      .decreaseStudent();
                                }
                              },
                              child: Icon(Icons.remove)),
                          Obx(() => Text(
                              dataStudentController.studentTotal.toString())),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(25, 25),
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(1),
                                  backgroundColor: Colors.deepPurple.shade300),
                              onPressed: () {
                                if (dataStudentController.studentTotal != 37 &&
                                    dataStudentController.isOpen.value ==
                                        false) {
                                  return dataStudentController
                                      .increaseStudent();
                                }
                              },
                              child: Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Row(
                            children: [
                              Text(
                                  dataStudentController.isOpen.value ||
                                          dataStudentController.studentTotal ==
                                              37
                                      ? "CLASS IS FULL"
                                      : "CLASS AVAILABLE",
                                  style: TextStyle(
                                      color:
                                          dataStudentController.isOpen.value ||
                                                  dataStudentController
                                                          .studentTotal ==
                                                      37
                                              ? Colors.red
                                              : Colors.green,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "(for 8 student)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          )),
                      Obx(() => Switch(
                          value: dataStudentController.studentTotal == 37
                              ? true
                              : dataStudentController.isOpen.value,
                          activeColor: Colors.deepPurple.shade300,
                          onChanged: (value) =>
                              {dataStudentController.closeClass(value)}))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade300),
                    child: Text(
                      "Nama Siswa",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataStudentController.studentName.length,
                      itemBuilder: (context, index) {
                        return Text(
                            dataStudentController.studentName.value[index]);
                      }))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade300),
                    child: Text(
                      "data",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
