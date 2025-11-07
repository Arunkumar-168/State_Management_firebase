import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Database/Details_Home_Page.dart';
import 'package:untitled/src/Movie_Home_Page.dart';
import 'package:untitled/src/adminpanel.dart';
import 'package:untitled/src/login.dart';
import 'Animation/Bubble.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> details = [
    {'title': 'Login Page'},
    {'title': 'ERP'},
    {'title': 'Movies'},
    {'title': 'Ecommerce'},
    {'title': 'Games'},
    {'title': 'video'},
    {'title': 'Audio'},
    {'title': 'Document'},
    {'title': 'WhatsApp'},
    {'title': 'Database(SQLite'},
  ];
  final bgColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.purple,
    Colors.blue,
  ];
  final List<Widget Function()> pageMoving = [
    () => const LoginPage(),
    () => const AdminPanel(),
    () => const MovieHomePage(),
    () => const LoginPage(),
    () => const AdminPanel(),
    () => const MovieHomePage(),
    () => const LoginPage(),
    () => const AdminPanel(),
    () => const MovieHomePage(),
    () => const DetailsHomePage(),
  ];

  final textColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        toolbarHeight: 70, // this centers the title automatically
        title: const Text(
          'Project Work',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          const BubblesController(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, index) {
                final item = details[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(pageMoving[index]());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgColors[index % bgColors.length],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: textColors[index % textColors.length],
                      ),
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
}
