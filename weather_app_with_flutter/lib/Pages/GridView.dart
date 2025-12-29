import 'package:flutter/material.dart';
import 'package:weather_app_with_flutter/widgets/custom_appBar_widget.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Gridview", showBack: true),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return createCard(index);
        },
      ),
    );
  }

  Card createCard(int index) {
    return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, size: 40),
              SizedBox(height: 8),
              Text("Ürün $index"),
            ],
          ),
        );
  }

  GridView GridView_Extent() {
    return GridView.extent(
      maxCrossAxisExtent: 180, // item max genişliği
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(16),
      children: List.generate(10, (index) {
        return Card(
          child: Center(
            child: Text("Item $index"),
          ),
        );
      }),
    );
  }

  GridView GridView_Count() {
    return GridView.count(
      crossAxisCount: 6,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: createContainer(20),
      scrollDirection: Axis.vertical,
    );
  }
}

List<Widget> createContainer(int length) {
  return List.generate(length, (index) {
    var colorShade = 100 * ((index + 1) % 10);
    var endShade = colorShade == 0 ? 100 : colorShade;

    return Container(
      color: Colors.pink[endShade],
      alignment: Alignment.center,
      child: Text(
        "Pink ${endShade}",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  });
}

/*

- GridView, Flutter’da elemanları satır–sütun (ızgara) şeklinde gösteren, kaydırılabilir (scrollable) bir widget’tır.
 - 📱 Fotoğraf galerileri, 
 - 🛍 ürün listeleri, 
 - 📊 dashboard’lar için çok sık kullanılır.

🧠 GridView Mantığı;
- ListView = tek sütun,
- GridView = çok sütun

- Flutter’da GridView Çeşitleri : Flutter’da 4 ana GridView yapısı vardır.
1. GridView.count (Sabit sütun sayısı)
📌 Ne zaman kullanılır?
-Sütun sayısı belliyse (ör: 2’li, 3’lü grid)

2. GridView.extent (Maksimum item genişliği)
📌 Ne zaman kullanılır?
- Ekran boyutuna göre otomatik sütun sayısı istiyorsan

3. GridView.builder (Dinamik / Performanslı)
📌 Ne zaman kullanılır?
- API’den gelen data
- Uzun listeler (100+ item)
✅ En çok kullanılan
✅ Performanslı
✅ Profesyonel kullanım

4. GridView.custom (İleri seviye)
📌 Ne zaman kullanılır?
- Özel animasyonlar
- Sliver mantığı
- Karmaşık grid yapıları


GridView.custom(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  childrenDelegate: SliverChildBuilderDelegate(
    (context, index) {
      return Card(
        child: Center(child: Text("Item $index")),
      );
    },
    childCount: 15,
  ),
)

--------------------------------------------------------------------------------

📌  GridDelegate Türleri ;
- GridView nasıl dizileceğini delegate ile belirler:
1. SliverGridDelegateWithFixedCrossAxisCount
- Sütun sayısı sabit
- crossAxisCount: 2
2. SliverGridDelegateWithMaxCrossAxisExtent
- Item max genişliği sabit
- maxCrossAxisExtent: 200

📌 GridView(...) // tek başına scroll eder

Ex.
👉 Ana ekran: GridView.builder
👉 Detay sayfa: SingleChildScrollView
👉 Ayarlar: ListView + SwitchListTile

*/
