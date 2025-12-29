import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app_with_flutter/widgets/custom_appBar_widget.dart';

class MyListandDataProcessing extends StatefulWidget {
  MyListandDataProcessing({super.key});

  List<Course> allCourse = List.generate(
    100,
    (index) =>
        Course(
          id: index + 1, 
          courseName: "Mobile Application Developer with Flutter", 
          coursesubtitle: "Intermediate Level",
          courseDetail: "You can develop mobile applications for Android and iOS using Flutter.",
          isUpdate: index % 2 == 0),
  );

  @override
  State<MyListandDataProcessing> createState() =>
      _MyListandDataProcessingState();
}

class _MyListandDataProcessingState extends State<MyListandDataProcessing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "List and Data", showBack: true),
      body: ListView.builder(
        itemCount: widget.allCourse.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //debugPrint("Clicked ${widget.allStudent[index]}");
            SmartDialog.show(builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  color: widget.allCourse[index].isUpdate
                  ? Colors.green
                  : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child:
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('The course name is ${widget.allCourse[index].courseName}', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 15,),
                      Text('Detail : ${widget.allCourse[index].courseDetail}', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              );
            });
          },
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              tileColor: widget.allCourse[index].isUpdate
                  ? Colors.green
                  : Colors.grey,
              title: Text(widget.allCourse[index].courseName),
              subtitle: Text(widget.allCourse[index].coursesubtitle),
              leading: CircleAvatar(child: Icon(Icons.book_online_sharp)),
              trailing: Icon(Icons.star),
              /*
              onTap: () {
                debugPrint("Clicked Listtile");
              },
              */
            ),
          ),
        ),
      ),
    );
  }
}

class MyCardListTile extends StatelessWidget {
  const MyCardListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white54,
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListViewMethod(),
      ),
    );
  }

  ListView ListViewMethod() {
    return ListView(
      children: [
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
        Listtile(),
      ],
    );
  }

  Column Listtile() {
    return Column(
      children: [
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.book),
          title: Text("Flutter Course"),
          subtitle: Text("Beginner level"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            debugPrint("The Course clicked.");
          },
        ),
        SizedBox(height: 5),
        Divider(
          thickness: 2,
          color: const Color.fromARGB(
            255,
            108,
            205,
            112,
          ) /*indent: 10, endIndent: 10,*/,
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.book),
          title: Text("React.js Course"),
          subtitle: Text("Beginner level"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            debugPrint("The Course clicked.");
          },
        ),
        SizedBox(height: 5),
        Divider(
          thickness: 2,
          color: const Color.fromARGB(
            255,
            108,
            205,
            112,
          ) /*indent: 10, endIndent: 10,*/,
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.book),
          title: Text("Kotlin Programing Langueage Course"),
          subtitle: Text("Beginner level"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            debugPrint("The Course clicked.");
          },
        ),
        SizedBox(height: 5),
        Divider(
          thickness: 2,
          color: const Color.fromARGB(
            255,
            108,
            205,
            112,
          ) /*indent: 10, endIndent: 10,*/,
        ),
      ],
    );
  }
}

class Course {
  final int id;
  final String courseName;
  final String coursesubtitle;
  final String courseDetail;
  final bool isUpdate;

  Course({required this.id, required this.courseName, required this.coursesubtitle, required this.courseDetail, required this.isUpdate});
}

/*
- ListTile kendi başına kaydırma (scroll) yapmaz.

✅ DOĞRU: ListTile, ListView İÇİN TASARLANMIŞTIR
- En yaygın ve doğru kullanım 👇
ListView(
  children: [
    ListTile(title: Text("Flutter")),
    ListTile(title: Text("React")),
    ListTile(title: Text("Android")),
  ],
)
📌 Burada:
Scroll işlemini ListView yapar
ListTile sadece bir satırı temsil eder

- Scroll yapan widget: ListView, SingleChildScrollView
- Satır / item widget: ListTile, Card, Container
- ListTile liste elemanıdır, liste değildir.


❌ Neden SingleChildScrollView + ListTile genelde yanlış?
SingleChildScrollView(
  child: ListTile(
    title: Text("Flutter"),
  ),
)
🚫 Çünkü:
- Tek item için scroll anlamsız
- Performans ve mimari kötü

----------------------------------------------------------------------------


✅ Card + ListTile + ListView 
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
        title: Text("Item $index"),
      ),
    );
  },
)
*/
