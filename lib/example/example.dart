import 'package:app_drawer/app_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNavDrawer extends StatelessWidget {
  const AppNavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavDrawer(
      title: 'Your Nav Drawer',
      bottom: true,
      bottomButtonIcon: const Icon(Icons.settings),
      bottomButtonLabel: 'Settings',
      bottomButtonOnPressed: () {
        if (kDebugMode) {
          print('Settings button pressed');
        }
      },
      sections: <DrawerSection>[
        DrawerSection(tiles: <DrawerTile>[
          DrawerTile(
              buttonLabel: 'Button One',
              onPressed: () {
                if (kDebugMode) {
                  print('Button One Pressed');
                }
              }),
          DrawerTile(
              buttonLabel: 'Button Two',
              onPressed: () {
                if (kDebugMode) {
                  print('Button Two Pressed');
                }
              }),
        ])
      ],
    );
  }
}
