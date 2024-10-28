import 'package:flutter/material.dart';

class HalamanRegistrasi extends StatelessWidget {
  final String username, password;
  HalamanRegistrasi(
      {super.key, required this.username, required this.password});
  @override
  Widget build(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          Row(children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
            ),
            Text(
              "Berhasil Registrasi!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ]),
          Text("Username : $username"),
          Text("Password : $password"),
        ],
      ));
}
