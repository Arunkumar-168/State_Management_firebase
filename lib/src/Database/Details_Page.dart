import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Database/Details_View_Page.dart';
import 'Controller/details_controller.dart';
import 'Model/details_model.dart';
import 'Validator.dart';

class DetailsFormPage extends StatefulWidget {
  const DetailsFormPage({super.key});

  @override
  State<DetailsFormPage> createState() => _DetailsFormPageState();
}

class _DetailsFormPageState extends State<DetailsFormPage> {
  final controller = Get.put(DetailsController());
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  DetailsModel? student;

  @override
  void initState() {
    super.initState();
    student = Get.arguments;
    if (student != null) {
      nameCtrl.text = student!.name;
      addressCtrl.text = student!.address;
      mobileCtrl.text = student!.mobile;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = student != null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          isEdit ? 'Edit Student' : 'Student Registration Form',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: TextStyle(fontSize: 15, color: Colors.black)),
              SizedBox(height: 10),
              TextFormField(
                controller: nameCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your name";
                  }
                  return Validator.validateName(name: value);
                },
                decoration: _inputDecoration("Name"),
              ),
              SizedBox(height: 10),
              Text(
                'Address',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your address";
                  }
                  return Validator.validateAddress(address: value);
                },
                decoration: _inputDecoration("Address"),
              ),
              SizedBox(height: 10),
              Text(
                'Mobile Number',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: mobileCtrl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your Mobile Number";
                  }
                  return Validator.validateMobile(mobile: value);
                },
                decoration: _inputDecoration("Mobile Number"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;

                  if (isEdit) {
                    final student  = DetailsModel(
                      // id: student.id, // ✅ Pass ID to update
                      name: nameCtrl.text,
                      address: addressCtrl.text,
                      mobile: mobileCtrl.text,
                    );
                    await controller.updateDetails(student );
                    Get.snackbar(
                      'Success',
                      'Student Updated Successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    final student = DetailsModel(
                      name: nameCtrl.text,
                      address: addressCtrl.text,
                      mobile: mobileCtrl.text,
                    );

                    await controller.addDetails(student);

                    Get.snackbar(
                      'Success',
                      'Student Added Successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  }

                  Get.off(() => DetailsViewPage()); // ✅ Replace current page with list view
                },

                child: Center(child: Text(isEdit ? 'Update' : 'Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.purple, width: 1.5),
    ),
  );
}
