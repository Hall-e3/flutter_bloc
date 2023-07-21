import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text("Task Drawer",
                  style: TextStyle(color: Colors.grey.shade400)),
            ),
            const ListTile(
              leading: Icon(Icons.folder_special),
              title: Text("My Tasks"),
              trailing: Text("0"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.delete),
              title: Text("Bin"),
              trailing: Text("0"),
            )
          ],
        ),
      ),
    );
  }
}
