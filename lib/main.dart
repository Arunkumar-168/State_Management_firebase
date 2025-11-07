import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Homepage.dart';
import 'package:untitled/utils/Initial_Binding/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: const Homepage(),
    );
  }
}
