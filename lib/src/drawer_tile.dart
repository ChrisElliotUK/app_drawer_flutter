part of 'nav_drawer.dart';

/// The [DrawerTile] widget is a single tile in a [DrawerSection].
/// It must be wrapped in the [DrawerSection] widget.
/// You can use the [DrawerTileList] widget to create a list of [DrawerTile] widgets.
/// You can provider the [onPressed] callback to perform an action when the tile is pressed.
/// The [buttonLabel] is the text that will be displayed on the tile.
/// The tile uses the [TextButton] widget.
class DrawerTile extends AbstractDrawerTile {
  const DrawerTile({Key? key, required this.buttonLabel, this.onPressed})
      : super(key: key);

  final String buttonLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: Theme.of(context).textButtonTheme.style!.copyWith(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.onPrimaryContainer),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            buttonLabel,
          ),
        ),
      ),
    );
  }
}
