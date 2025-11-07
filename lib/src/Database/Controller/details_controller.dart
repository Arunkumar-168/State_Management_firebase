import 'package:get/get.dart';
import '../Model/details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../db_helper.dart';



// class DetailsController extends GetxController  {
//   late Database _db;
//   var detailsList = <DetailsModel>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _initDB();
//   }
//
//   Future<void> _initDB() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'student_details.db');
//
//     _db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE details(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, address TEXT, mobile TEXT)',
//         );
//       },
//     );
//     fetchDetails();
//   }
//
//   Future<void> addDetails(String name, String address, String mobile) async {
//     await _db.insert('details', {
//       'name': name,
//       'address': address,
//       'mobile': mobile,
//     });
//     fetchDetails();
//   }
//
//   Future<void> fetchDetails() async {
//     final data = await _db.query('details');
//     detailsList.value = data.map((e) => DetailsModel.fromMap(e)).toList();
//   }
//
//   Future<void> updateDetails(int id, String name, String address, String mobile) async {
//     await _db.update(
//       'details',
//       {'name': name, 'address': address, 'mobile': mobile},
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     fetchDetails();
//   }
//
//   Future<void> deleteDetails(int id) async {
//     await _db.delete('details', where: 'id = ?', whereArgs: [id]);
//     fetchDetails();
//   }
// }
class DetailsController extends GetxController {
  var detailsList = <DetailsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDetails();
  }

  void loadDetails() async {
    detailsList.value = await DBHelper.getStudents();
  }

  Future<void> addDetails(DetailsModel student) async {
    await DBHelper.insertStudent(student);
    loadDetails();
  }



  Future<void> updateDetails(DetailsModel student) async {
    await DBHelper.updateStudent(student);
    loadDetails();
  }

  void deleteDetails(int id) async {
    await DBHelper.deleteStudent(id);
    loadDetails();
  }
}