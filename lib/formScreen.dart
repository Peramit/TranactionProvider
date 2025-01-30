import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Input'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(label: const Text('ชื่อรายการ')),
          ),
          TextFormField(
            decoration: InputDecoration(label: const Text('จำนวนเงิน')),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              // ใช้ Navigator.pop เพื่อกลับไปหน้าจอก่อนหน้า
              Navigator.pop(context);
            },
            child: const Text('เพิ่มข้อมูล'),
          ),
          const Text(
            'This is the Form Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
