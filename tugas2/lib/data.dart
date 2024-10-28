class ItemMenu {
  String nama, deskripsi, linkGambar;
  int harga;
  ItemMenu(this.nama, this.deskripsi, this.linkGambar, this.harga);
}

List<ItemMenu> menuImitasi = [
  ItemMenu(
    "Nasi Goreng",
    "Nasi goreng, an Indonesian fried rice dish, often served with chicken, prawns, and a fried egg.",
    "nasgor.jpg",
    15000,
  ),
  ItemMenu(
    "Mie Ayam Geprek",
    "Mie Ayam Geprek is a flavorful and tender Indonesian beef stew, simmered with coconut milk and a blend of spices.",
    "mie_ayam_geprek.jpg",
    20000,
  ),
  ItemMenu(
    "Sate Ayam",
    "Sate ayam, or chicken satay, features skewered and grilled chicken served with a peanut sauce.",
    "sate.jpg",
    10000,
  ),
  ItemMenu(
    "Gado-Gado",
    "Gado-gado is an Indonesian salad with a peanut sauce dressing, made with mixed vegetables and tofu.",
    "gado.jpeg",
    7500,
  ),
  ItemMenu(
    "Ayam gepuk",
    "Ayam gepuk, or fried noodles, is a popular Indonesian dish with stir-fried noodles, vegetables, and your choice of protein.",
    "gepuk.jpg",
    5000,
  ),
];
