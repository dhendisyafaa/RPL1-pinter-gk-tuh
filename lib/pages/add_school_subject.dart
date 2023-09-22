import 'package:flutter/material.dart';

class AddSchoolSubject extends StatelessWidget {
  const AddSchoolSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Text("Tambah mata pelajaran"),
      ),
    );
  }
}
