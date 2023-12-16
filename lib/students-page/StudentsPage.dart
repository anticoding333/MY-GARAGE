import 'dart:io';

import 'package:desktopapp/students-page/StudentsPageUtils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  DataBaseHelper db = DataBaseHelper.instance;

  List<Widget> students_info = [
    StudentGrid(
        name: 'Name', ID: 'ID', license_number: 'License.No#', car: 'Car')
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.getCards(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("An error occured"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            Scaffold(
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/MainPage');
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                              color: Colors.orange),
                          width: 200,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: Colors.blue),
                              width: 130,
                              height: 130,
                              child: Center(
                                child: Text(
                                  "Students",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            width: 300,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1,
                      alignment: Alignment.center,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            );
          }
          return Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/MainPage');
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: Colors.orange),
                    width: 200,
                    height: 90,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: Colors.blue),
                        width: 130,
                        height: 130,
                        child: Center(
                          child: Text(
                            "Students",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      width: 300,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                height: 1,
                alignment: Alignment.center,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          );
        });
  }

  Future<void> show() async {
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController licenseController = TextEditingController();
    TextEditingController carController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Details'),
          content: Column(
            children: [
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: licenseController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'License Number'),
              ),
              TextField(
                controller: carController,
                decoration: const InputDecoration(labelText: 'Car'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () async {
                String? id = idController.text;
                String? name = nameController.text;
                String? licenseNumber = licenseController.text;
                String? car = carController.text;

                DataBaseHelper db = DataBaseHelper.instance;
                db.add(StudentCar(
                    name: name, ID: id, li_num: licenseNumber, car: car));

                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DataBaseHelper {
  DataBaseHelper._private();
  static final DataBaseHelper instance = DataBaseHelper._private();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = Path.join(documentsDirectory.path, 'StudentCars.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE StudentCars(
      ID TEXT PRIMARY KEY,
      name TEXT,
      li_num TEXT,
      car TEXT
    )''');
  }

  Future<List<StudentCar>> getCards() async {
    Database db = await instance.database;
    var CreditCards = await db.query('StudentCars', orderBy: 'id');
    List<StudentCar> CreditCardList = CreditCards.isNotEmpty
        ? CreditCards.map((e) => StudentCar.fromMap(e)).toList()
        : [];

    return CreditCardList;
  }

  Future<int> add(StudentCar card) async {
    Database db = await instance.database;
    return await db.insert("StudentCars", card.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('StudentCars', where: 'id = ?', whereArgs: [id]);
  }
}

class StudentCar {
  String name;
  String ID;
  String li_num;
  String car;

  StudentCar(
      {required this.name,
      required this.ID,
      required this.li_num,
      required this.car}) {}

  factory StudentCar.fromMap(Map<String, dynamic> json) {
    return StudentCar(
        name: json["name"],
        ID: json["ID"],
        li_num: json["li_num"],
        car: json["car"]);
  }

  Map<String, dynamic> toMap() =>
      {"name": name, "ID": ID, "li_num": li_num, "car": car};
}
