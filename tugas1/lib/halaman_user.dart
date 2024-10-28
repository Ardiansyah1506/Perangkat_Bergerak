import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas1/halaman_login.dart';
import 'package:tugas1/halaman_register.dart';

class HalamanUser extends StatelessWidget {
  final usernameController = TextEditingController(),
      passwordController = TextEditingController();
  HalamanUser({super.key});
  @override
  Widget build(BuildContext context) {
    void redirectLogin(String username, String password) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              HalamanLogin(username: username, password: password)));
    }

    void redirectRegistrasi(String username, String password) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              HalamanRegistrasi(username: username, password: password)));
    }

    void submit() async {
      final spInstance = await SharedPreferences.getInstance();
      final spUsername = spInstance.get("username");
      final spPassword = spInstance.get("password");
      if (spUsername == usernameController.text &&
          spPassword == passwordController.text) {
        redirectLogin(usernameController.text, passwordController.text);
      } else {
        spInstance.setString("username", usernameController.text);
        spInstance.setString("password", passwordController.text);
        redirectRegistrasi(usernameController.text, passwordController.text);
      }
    }

    return Scaffold(
        body: ListView(children: [
      Text(
        "Registrasi / Login",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      TextField(
          controller: usernameController,
          decoration: const InputDecoration(labelText: "username")),
      TextField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(labelText: "password"),
      ),
      ElevatedButton(onPressed: submit, child: const Text("Submit"))
    ]));
  }
}
