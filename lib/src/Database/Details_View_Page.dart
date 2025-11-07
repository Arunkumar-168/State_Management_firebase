import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Database/Details_Page.dart';
import 'Controller/details_controller.dart';

class DetailsViewPage extends StatefulWidget {
  const DetailsViewPage({super.key});

  @override
  State<DetailsViewPage> createState() => _DetailsViewPageState();
}

class _DetailsViewPageState extends State<DetailsViewPage> {
  final controller = Get.find<DetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Students View List',
          style: TextStyle(fontSize: 15, color: Colors.white),
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
          SizedBox(height: 10),
          Expanded(
            child: controller.detailsList.isEmpty
                ? const Center(child: Text('No Students Found'))
                : ListView.builder(
                    itemCount: controller.detailsList.length,
                    itemBuilder: (context, index) {
                      final student = controller.detailsList[index];
                      return Card(
                        child: ListTile(
                          title: Text(student.name),
                          subtitle: Text(
                            '${student.address}\n${student.mobile}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  Get.to(
                                    () => DetailsFormPage(),
                                    arguments: student,
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  controller.deleteDetails(student.id!);
                                  Get.snackbar(
                                    'Deleted',
                                    'Student removed',
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // void _showEditDialog(BuildContext context, student) {
  //   final nameCtrl = TextEditingController(text: student.name);
  //   final addressCtrl = TextEditingController(text: student.address);
  //   final mobileCtrl = TextEditingController(text: student.mobile);
  //
  //   Get.dialog(
  //     AlertDialog(
  //       title: const Text('Edit Student'),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           TextField(
  //             controller: nameCtrl,
  //             decoration: const InputDecoration(labelText: 'Name'),
  //           ),
  //           TextField(
  //             controller: addressCtrl,
  //             decoration: const InputDecoration(labelText: 'Address'),
  //           ),
  //           TextField(
  //             controller: mobileCtrl,
  //             decoration: const InputDecoration(labelText: 'Mobile'),
  //           ),
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () async {
  //             final student = DetailsModel(
  //               id: exsist.id, // ✅ include the existing student ID
  //               name: nameCtrl.text,
  //               address: addressCtrl.text,
  //               mobile: mobileCtrl.text,
  //             );
  //             await controller.updateDetails(
  //               student,
  //             ); // ✅ only one argument
  //
  //             Get.back();
  //
  //             Get.snackbar(
  //               'Success',
  //               'Student Updated Successfully',
  //               backgroundColor: Colors.green,
  //               colorText: Colors.white,
  //             );
  //           },
  //
  //           child: const Text('Save'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
