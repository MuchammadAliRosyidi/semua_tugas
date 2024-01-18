class Makanan {
  String nama;
  int harga;
  String gambar;
  String? deskripsi;

  Makanan(this.nama, this.harga,
      {this.gambar = 'makanan.jpeg', this.deskripsi});

  static List<Makanan> dummyData = [
    Makanan("Nasi Goreng", 10000, gambar: "nasgor.jpeg"),
    Makanan("Nasi Kebuli", 20000, gambar: "kebuli.jpeg"),
    Makanan("Nasi Padang", 10000,
        gambar: "padang.jpeg", deskripsi: "Nasi padang murah"),
    Makanan(
        "Nasi Kuning",
        gambar: "naskun.jpeg",
        8000,
        deskripsi: "Masi kuning enak"),
  ];
}
