import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onSelected: (String result) {
          switch (result) {
            case 'option 1':
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(value: 'option 1', child: Text('option 1')),
              const PopupMenuItem(value: 'option 2', child: Text('option 2')),
              const PopupMenuItem(value: 'option 3', child: Text('option 3')),
              const PopupMenuItem(value: 'option 4', child: Text('option 4')),
              const PopupMenuItem(value: 'option 5', child: Text('option 5')),
            ]);
  }
}
