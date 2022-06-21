import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '/entitas/note.dart';
import 'package:myfoodapp/dbhelperkedua.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  DbHelper dbHelper = DbHelper();
  List<Profil> profil;
  String emailadmin = "";
  String keteranganProfil = '';
  String namaadmin = '';
  _getProfil() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Profil>> profilFuture = dbHelper.getProfil();
      profilFuture.then((profilList) {
        setState(() {
          profil = profilList;
          keteranganProfil = profil[0].email + '\n';
          keteranganProfil += profil[0].nama + '\n';
          keteranganProfil += profil[0].password;

          emailadmin = profil[0].email;
          namaadmin = profil[0].nama;
          // res = profil[0].resume;
          // se = profil[0].seo;
          print('email ' + emailadmin);
          print(namaadmin);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfil();
    print('email ' + emailadmin);
    // ambilfoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Welcome " + namaadmin)),
        body: Center(
          child: RaisedButton(onPressed: () {
            print('object');
            _getProfil();
          }),
        ));
  }
}
