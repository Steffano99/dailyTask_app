import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        color: Color.fromARGB(255, 174, 234, 235),
        icon: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 243, 228, 228),
        ),
        onSelected: (String result) {
          switch (result) {
            case 'option 1':
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(
                  value: 'option 1',
                  child: Text(
                    'Task List',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
              const PopupMenuItem(
                  value: 'option 2',
                  child: Text(
                    'Follow Us',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
              const PopupMenuItem(
                  value: 'option 3',
                  child: Text(
                    'Invite friends to the app',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
              const PopupMenuItem(
                  value: 'option 4',
                  child: Text(
                    'About Us',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
              const PopupMenuItem(
                  value: 'option 5',
                  child: Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )),
            ]);
  }
}
