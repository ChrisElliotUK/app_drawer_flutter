import 'package:app_drawer/src/abstract_drawer_section.dart';
import 'package:flutter/material.dart';

import 'abstract_drawer_tile.dart';

part 'drawer_section.dart';
part 'drawer_tile.dart';
part 'drawer_tile_list.dart';

/// The NavDrawer widget is a [Drawer] widget that contains a list of [DrawerSection]s.
/// You must provide at least one [DrawerSection] to the NavDrawer.
/// It has an optional [bottom] button that is displayed at the bottom of the drawer.
/// If [bottom] is true, then you must provide a [bottomButtonLabel],
/// [bottomButtonOnPressed] callback and [bottomButtonIcon] icon.
/// By default, [shrinkWrap] is true, and the drawer is scrollable
/// with [ClampingScrollPhysics].
class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
    required this.title,
    this.shrinkWrap = true,
    this.physics = const ClampingScrollPhysics(),
    this.sections,
    this.bottom = false,
    this.bottomButtonLabel,
    this.bottomButtonOnPressed,
    this.bottomButtonIcon,
  }) : super(key: key);

  final String title;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final List<AbstractDrawerSection>? sections;
  final bool bottom;
  final String? bottomButtonLabel;
  final VoidCallback? bottomButtonOnPressed;
  final Icon? bottomButtonIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ListView.builder(
                  physics: physics,
                  shrinkWrap: shrinkWrap,
                  itemCount: sections!.length,
                  itemBuilder: (context, index) {
                    AbstractDrawerSection current = sections![index];
                    AbstractDrawerSection? futureOne;
                    if (index + 1 != sections!.length) {
                      futureOne = sections![index + 1];
                    }
                    return current;
                  },
                ),
                bottom == true
                    ? Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: TextButton.icon(
                                  icon: bottomButtonIcon!,
                                  onPressed: bottomButtonOnPressed,
                                  style: Theme.of(context)
                                      .textButtonTheme
                                      .style!
                                      .copyWith(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimaryContainer),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                  label: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      bottomButtonLabel!,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )
                    : const SizedBox(),
              ],
            )),
      ),
    );
  }
}
