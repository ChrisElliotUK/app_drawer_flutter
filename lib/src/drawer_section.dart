part of 'nav_drawer.dart';

/// A drawer section which has an optional bottom divider.
/// The drawer section must be wrapped in the [NavDrawer] widget.
/// The section requires either a [DrawerTileList] or a [DrawerTile] widget.
class DrawerSection extends AbstractDrawerSection {
  const DrawerSection({
    Key? key,
    this.title,
    required this.tiles,
  }) : super(key: key, title: title);

  @override
  final String? title;
  final List<AbstractDrawerTile>? tiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              : const SizedBox(),
          ListView.builder(
            itemCount: tiles!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return tiles![index];
            },
          ),
          if (showBottomDivider)
            Divider(
              height: 1,
              color: Theme.of(context).colorScheme.outline,
            )
        ],
      ),
    );
  }
}
