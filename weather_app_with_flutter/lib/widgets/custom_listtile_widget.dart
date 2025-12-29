import 'package:flutter/material.dart';

class MyListTileWidget extends StatelessWidget {
  const MyListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.book), 
              title: Text("Flutter Course"),
              subtitle: Text("Beginner level"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                debugPrint("The Course clicked.");
              },
            ),
            SizedBox(height: 5,),
            Divider(thickness: 2, color: const Color.fromARGB(255, 108, 205, 112), /*indent: 10, endIndent: 10,*/),
          ],
        );
  }
}

