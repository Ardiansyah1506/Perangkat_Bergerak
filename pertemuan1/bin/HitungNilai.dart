class Mahasiswa {
  String nim;
  String nama;
  String nHuruf = '';
  String predikat = '';

  Mahasiswa({
    required this.nim,
    required this.nama,
  });

  // Fungsi untuk menghitung nilai akhir
  double hitungNilai(double nUts, double nUas, double nTugas) {
    double pNilaiUts = nUts * 0.3;
    double pNilaiTugas = nTugas * 0.35;
    double pNilaiUas = nUas * 0.35;

    return pNilaiUts + pNilaiTugas + pNilaiUas;
  }

  // Fungsi untuk menentukan nilai huruf
  String getNilaiHuruf(double na) {
    if (na >= 85) {
      nHuruf = 'A';
    } else if (na >= 70) {
      nHuruf = 'B';
    } else if (na >= 56) {
      nHuruf = 'C';
    } else if (na >= 40) {
      nHuruf = 'D';
    } else {
      nHuruf = 'E';
    }
    return nHuruf;
  }

  // Fungsi untuk menentukan predikat
  String getPredikat(String nh) {
    switch (nh) {
      case 'A':
        return 'Sangat Baik';
      case 'B':
        return 'Baik';
      case 'C':
        return 'Cukup';
      case 'D':
        return 'Kurang';
      case 'E':
        return 'Tidak Lulus';
      default:
        return '';
    }
  }

  // Fungsi untuk mencetak hasil
  void cetak(double nilaiAkhir) {
    print('\n--- Hasil ---');
    print('NIM: $nim');
    print('Nama: $nama');
    print('Nilai Akhir: $nilaiAkhir');
    print('Nilai Huruf: $nHuruf');
    print('Predikat: $predikat');
  }
}

void main() {
  String nim = 'A11.2022.14711';
  String nama = 'Ardiansyah';
  double nilaiUts = 90;
  double nilaiTugas = 95;
  double nilaiUas = 97;

  // Membuat objek Mahasiswa
  Mahasiswa mhs = Mahasiswa(nim: nim, nama: nama);

  // Menghitung nilai akhir
  double nilaiAkhir = mhs.hitungNilai(nilaiUts, nilaiUas, nilaiTugas);
  mhs.getNilaiHuruf(nilaiAkhir);
  mhs.predikat = mhs.getPredikat(mhs.nHuruf);

  // Mencetak hasil
  mhs.cetak(nilaiAkhir);
}
