import 'package:aplikasi_nilai/mahasiswa.dart';
import 'package:flutter/material.dart';

class FormulirNilai extends StatefulWidget {
  const FormulirNilai({super.key});
  @override
  State<StatefulWidget> createState() => _FormulirNilaiState();
}

class _FormulirNilaiState extends State<FormulirNilai> {
  final tugasController =
          TextEditingController.fromValue(TextEditingValue(text: 0.toString())),
      utsController =
          TextEditingController.fromValue(TextEditingValue(text: 0.toString())),
      uasController =
          TextEditingController.fromValue(TextEditingValue(text: 0.toString())),
      mhs = Mahasiswa(0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
          controller: tugasController,
          onChanged: (value) {
            updateNilai("tugas", double.tryParse(value) ?? 0.0);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nilai Tugas",
          )),
      const SizedBox(height: 7),
      TextField(
          controller: utsController,
          onChanged: (value) {
            updateNilai("uts", double.tryParse(value) ?? 0.0);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nilai UTS",
          )),
      const SizedBox(height: 7),
      TextField(
          controller: uasController,
          onChanged: (value) {
            updateNilai("uas", double.tryParse(value) ?? 0.0);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nilai UAS",
          )),
      const SizedBox(height: 7),
      Text("Nilai Akhir", style: Theme.of(context).textTheme.labelSmall),
      Text("${mhs.nilaiAkhir}", style: Theme.of(context).textTheme.bodyLarge),
      const SizedBox(height: 7),
      Text("Nilai Huruf", style: Theme.of(context).textTheme.labelSmall),
      Text("${mhs.nilaiHuruf}", style: Theme.of(context).textTheme.bodyLarge),
      const SizedBox(height: 7),
      Text("Predikat", style: Theme.of(context).textTheme.labelSmall),
      Text("${mhs.predikat}", style: Theme.of(context).textTheme.bodyLarge),
    ]);
  }

  void updateNilai(String key, double value) {
    setState(() {
      switch (key) {
        case "tugas":
          mhs.nilaiTugas = value;
          break;
        case "uts":
          mhs.nilaiUts = value;
          break;
        case "uas":
          mhs.nilaiUas = value;
          break;
      }
      mhs.hitungNilai();
    });
  }
}
