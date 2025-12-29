class MyPhotosModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  MyPhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  /*
    factory constructor:
    - Yeni bir nesne üretmek zorunda değildir
    - Gerekirse veriyi dönüştürür
    - En sık kullanım amacı: JSON → Model

    - Aynı işi normal named constructor ile de yapabilirsin:
      Course.fromJson(Map<String, dynamic> json)
          : id = json["id"],
            title = json["title"],
            category = json["category"];
    * Bu da çalışır ✅
    📌 Ama factory:
    - Daha okunaklı
    - Null kontrolü, default değer eklemeye uygun
    - Büyük projelerde tercih edilir
  */
  factory MyPhotosModel.fromJson(Map<String, dynamic> json) {
    return MyPhotosModel(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }
  // POST İsteği (Veri Gönderme) için..
  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
