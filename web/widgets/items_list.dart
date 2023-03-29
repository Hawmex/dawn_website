import 'package:dawn/dawn.dart';

enum ItemsListVariant { unordered, ordered }

class ItemsList extends StatelessWidget {
  final List<Widget> items;
  final ItemsListVariant variant;

  const ItemsList.ordered(this.items, {super.key, super.ref})
      : variant = ItemsListVariant.ordered;

  const ItemsList.unordered(this.items, {super.key, super.ref})
      : variant = ItemsListVariant.unordered;

  String get _listStyleType {
    switch (variant) {
      case ItemsListVariant.ordered:
        return 'decimal';
      case ItemsListVariant.unordered:
        return 'disc';
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        for (final item in items)
          Container(
            [item],
            style: Style({
              'display': 'list-item',
              'list-style-type': _listStyleType,
            }),
          )
      ],
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'padding': '0px 16px',
      }),
    );
  }
}
