import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Database/Details_Page.dart';
import 'Controller/details_controller.dart';
import 'Details_View_Page.dart';
import 'Model/details_model.dart';

class DetailsHomePage extends StatefulWidget {
  const DetailsHomePage({super.key});

  @override
  State<DetailsHomePage> createState() => _DetailsHomePageState();
}

class _DetailsHomePageState extends State<DetailsHomePage> {
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();

  // ✅ Initialize controller here
  final DetailsController controller = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Database (SQLite)',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),

          // Registration form navigation
          InkWell(
            onTap: () {
              Get.to(() => DetailsFormPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Students Registration Form',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          // Students View List
          InkWell(
            onTap: () async {
              if (nameCtrl.text.isNotEmpty &&
                  addressCtrl.text.isNotEmpty &&
                  mobileCtrl.text.isNotEmpty) {
                final student = DetailsModel(
                  name: nameCtrl.text,
                  address: addressCtrl.text,
                  mobile: mobileCtrl.text,
                );
                await controller.addDetails(student);
              }
              Get.off(() => DetailsViewPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Students View List',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
