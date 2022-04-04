part of 'nav_drawer.dart';

/// The [DrawerTileList] widget is a list of [DrawerTile] widgets.
/// It must be wrapped in the [DrawerSection] widget.
class DrawerTileList extends AbstractDrawerTile {
  const DrawerTileList({Key? key, required this.items}) : super(key: key);

  final List items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return DrawerTile(
          buttonLabel: items[index],
          onPressed: () {},
        );
      },
    );
  }
}
