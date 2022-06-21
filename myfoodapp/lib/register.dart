import 'package:flutter/material.dart';
import 'package:myfoodapp/app/modules/home/views/home_view.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:myfoodapp/login.dart';

class RegisterPage extends StatefulWidget {
  // const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Image.asset('assets/logo/logo-splash.png'),
              width: 50,
              height: 202,
            ),
            Container(
              child: Center(
                  child: Text(
                "Masukkan Data Diri Anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Nama",
                    hintText: "Masukkan nama",
                    icon: Icon(Icons.people)),
                controller: namaController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Masukkan email",
                    icon: Icon(Icons.mail)),
                controller: emailController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.security)),
                controller: passwordController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Alamat",
                    hintText: "Masukkan alamat",
                    icon: Icon(Icons.home)),
                controller: alamatController,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "No. HP",
                  hintText: "Masukkan no hp",
                  icon: Icon(Icons.phone),
                ),
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  registrasi();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future registrasi() async {
    if (namaController.text.isEmpty ||
            emailController.text.isEmpty ||
            passwordController.text.isEmpty ||
            alamatController.text.isEmpty ||
            phoneController.text.isEmpty
        // kota.text.isEmpty ||
        // _imageFile.path.isEmpty ||
        // file.path.isEmpty) {
        ) {
      final snackBar = SnackBar(
          duration: const Duration(seconds: 5),
          content: Text("Silahkan Isi Yang Bertanda *"),
          backgroundColor: Colors.red);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final uri = Uri.parse(
          // "https://infokerja-disnaker.pekanbaru.go.id/outfit/api/register_perusahaan.php");
          "http://slkbankum.com/api_app/register.php");
      var request = http.MultipartRequest('POST', uri);
      // print(result.files.single.path);
      //  request.fields['name'] = res;
      request.fields['nama'] = namaController.text;
      request.fields['email'] = emailController.text;
      request.fields['password'] = passwordController.text;
      request.fields['alamat'] = alamatController.text;
      request.fields['phone'] = phoneController.text;
      // var pic = await http.MultipartFile.fromPath("image", _imageFile.path);
      // request.files.add(pic);
      // var fil =
      //     await http.MultipartFile.fromPath("file", result.files.single.path);
      // request.files.add(fil);
      var response = await request.send();
      if (response.statusCode == 200) {
        _showAlertDialogBerhasil(context);
        //   _showAlertDialoguploads(context);
      } else {
        _showAlertDialog(context);
      }
    }
  }

  _showAlertDialogBerhasil(BuildContext context) {
    Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
            ));
    AlertDialog alert = AlertDialog(
      title: Text("Notifikasi"),
      content: Text("Registrasi Berhasil"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
    );
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("err"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
