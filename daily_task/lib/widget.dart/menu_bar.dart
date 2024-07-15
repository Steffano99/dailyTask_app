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
              const PopupMenuItem(value: 'option 1', child: Text('option 1'))
            ]);
  }
}
