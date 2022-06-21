import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Profil {
  int id;
  String password;
  String nama;
  String email;
  // String seo;
  //String resume;

  Profil({
    this.id,
    this.password,
    this.email,
    this.nama,
  }
      //  this.seo,
      // this.resume
      );

  factory Profil.fromMap(Map<String, dynamic> map) {
    return Profil(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      nama: map['nama'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = id;
    map['nama'] = nama;
    map['email'] = email;
    map['password'] = password;

    // map['seo'] = seo;
    //map['resume'] = resume;
    return map;
  }
}
