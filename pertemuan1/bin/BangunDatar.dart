int LuasPersegi(int sisi) {
  return sisi * sisi;
}

int KelilingPersegi(int sisi) {
  return 4 * sisi;
}

double LuasLingkaran({required int jari}) {
  return 3.14 * (jari * jari);
}

double KelilingLingkaran({required int jari}) {
  return 2 * 3.14 * jari;
}

int LuasKubus(int rusuk) {
  return 6 * (rusuk * rusuk);
}

int KelilingKubus(int rusuk) {
  return 12 * rusuk;
}

void main() {
  print('Luas Persegi: ${LuasPersegi(4)}');
  print('Keliling Persegi: ${KelilingPersegi(12)}');
  print('Luas Lingkaran: ${LuasLingkaran(jari: 7)}');
  print('Keliling Lingkaran: ${LuasLingkaran(jari: 7)}');
  print('Luas Kubus: ${LuasKubus(7)}');
  print('Keliling Persegi:  ${KelilingKubus(7)}');
}
