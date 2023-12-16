import 'dart:io';

import 'package:desktopapp/students-page/StudentsPageUtils.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<String> students = ['Name', 'ID', 'License.NO', 'Car'].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
        StudentGrid(
            name: 'Name', ID: 'ID', license_number: 'License.No#', car: 'Car')
      ]),
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
    String path = Path.join(documentsDirectory.path, 'CreditCard.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE CreditCard(
      id INTEGER PRIMARY KEY,
      pin TEXT,
      number TEXT
    )''');
  }

  Future<List<CreditCard>> getCards() async {
    Database db = await instance.database;
    var CreditCards = await db.query('CreditCard', orderBy: 'id');
    List<CreditCard> CreditCardList = CreditCards.isNotEmpty
        ? CreditCards.map((e) => CreditCard.fromMap(e)).toList()
        : [];

    return CreditCardList;
  }

  Future<int> add(CreditCard card) async {
    Database db = await instance.database;
    return await db.insert("CreditCard", card.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('CreditCard', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(CreditCard card) async {
    Database db = await instance.database;
    return await db.update("CreditCard", card.toMap(),
        where: 'id = ?', whereArgs: [card.id]);
  }

  Future<CreditCard> getCard(CreditCard card) async {
    Database db = await instance.database;
    final c =
        await db.query("CreditCard", where: 'id = ?', whereArgs: [card.id]);
    return CreditCard.fromMap(c[0]);
  }
}

class CreditCard {
  int? id;
  String? number;
  String pin;

  CreditCard({this.id, String? number, required this.pin}) {}

  factory CreditCard.fromMap(Map<String, dynamic> json) {
    return CreditCard(id: json["id"], number: json["number"], pin: json["pin"]);
  }

  Map<String, dynamic> toMap() => {"id": id, "number": number, "pin": pin};
}
