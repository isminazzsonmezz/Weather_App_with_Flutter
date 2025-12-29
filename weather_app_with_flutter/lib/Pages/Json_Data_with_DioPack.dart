import 'package:flutter/material.dart';
import 'package:weather_app_with_flutter/api/ApiServiceForPhotos.dart';
import 'package:weather_app_with_flutter/model/PhotosModel.dart';
import 'package:weather_app_with_flutter/widgets/custom_appBar_widget.dart';

class MyDioPackage extends StatefulWidget {
  const MyDioPackage({super.key});

  @override
  State<MyDioPackage> createState() => _MyDioPackageState();
}

class _MyDioPackageState extends State<MyDioPackage> {
  late Future<List<MyPhotosModel>> photosFuture;

  @override
  void initState() {
    super.initState();
    photosFuture = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Json with Dio Package", showBack: true),
      body: FutureBuilder(
        future: photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error has occurred"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available!!"));
          } else {
            final photos = snapshot.data!;

            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];

                return Card(
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      child: Text(photo.id.toString()),
                    ),
                    title: Text(photo.title),
                    subtitle: Text("This photograph is from the ${photo.albumId.toString()}. album"),
                    children: [
                      Image.network(
                        photo.url,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
