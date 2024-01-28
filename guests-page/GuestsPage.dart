import 'dart:io';
import 'package:desktopapp/guests-page/GuestsPageUtils.dart';
import 'package:desktopapp/guests-page/GuestsPageUtils2.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class GuestsPage extends StatefulWidget {
  const GuestsPage({super.key});

  @override
  State<GuestsPage> createState() => _GuestsPageState();
}

class _GuestsPageState extends State<GuestsPage> {
  DataBaseHelper db = DataBaseHelper.instance;

  List<GuestCar> Guests_info = [
    GuestCar(name: "name", id: "id", liNum: "liNum", car: "car")
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.getCards(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
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
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/MainPage');
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          decoration: const BoxDecoration(
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
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: Colors.blue),
                              width: 130,
                              height: 130,
                              child: const Center(
                                child: Text(
                                  "Guests",
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
                          child: const Icon(Icons.add),
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
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1,
                      alignment: Alignment.center,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CircularProgressIndicator()
                  ]),
            );
          }

          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/MainPage');
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          decoration: const BoxDecoration(
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
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                  color: Colors.blue),
                              width: 130,
                              height: 130,
                              child: const Center(
                                child: Text(
                                  "Guests",
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
                          onPressed: () {
                            show();
                          },
                          child: const Icon(Icons.add),
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
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1,
                      alignment: Alignment.center,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GusetGrid(
                        name: "Name",
                        ID: "ID",
                        license_number: "license.No",
                        car: "car"),
                    Expanded(
                      child: ListView(
                        children: snapshot.data!
                            .map((e) => GusetGrid2(
                                name: e.name!,
                                ID: e.id!,
                                license_number: e.liNum!,
                                car: e.car!))
                            .toList(),
                      ),
                    )
                  ]),
            );
          } else {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
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
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () async {
                String? id = idController.text;
                String? name = nameController.text;
                String? licenseNumber = licenseController.text;
                String? car = carController.text;

                DataBaseHelper db = DataBaseHelper.instance;
                db.add(GuestCar(
                    name: name, id: id, liNum: licenseNumber, car: car));

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
    sqfliteFfiInit();
    // Explicitly set the database factory to ffi
    databaseFactory = databaseFactoryFfi;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = Path.join(documentsDirectory.path, 'GuestCars.db');
    print("Database Path: $path");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE GuestCars (
      id INTEGER PRIMARY KEY,
      name TEXT,
      li_num TEXT,
      car TEXT
    )''');
  }

  Future<List<GuestCar>> getCards() async {
    Database db = await instance.database;
    var result = await db.query('GuestCars', orderBy: 'id');
    List<GuestCar> guestCarsList = result.isNotEmpty
        ? result.map((e) => GuestCar.fromMap(e)).toList()
        : [];
    return guestCarsList;
  }

  Future<int> add(GuestCar guestCar) async {
    Database db = await instance.database;
    int id = await db.insert("GuestCars", guestCar.toMap());
    return id;
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('GuestCars', where: 'id = ?', whereArgs: [id]);
  }
}

class GuestCar {
  String? name;
  String? id; // Assuming id is a String, adjust if it's an integer
  String? liNum; // Updated to camelCase
  String? car;

  GuestCar({
    this.name,
    this.id,
    this.liNum,
    this.car,
  });

  factory GuestCar.fromMap(Map<String, dynamic> json) {
    return GuestCar(
      name: json["name"],
      id: json["id"].toString(),
      liNum: json["li_num"],
      car: json["car"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "id": id,
      "li_num": liNum,
      "car": car,
    };
  }
}