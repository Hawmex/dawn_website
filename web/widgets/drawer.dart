import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'button.dart';
import 'scrim.dart';
import 'theme.dart';

final _drawerState = _DrawerState();

extension DrawerModal on BuildContext {
  void openDrawer() {
    _drawerState.setState(() => _drawerState._isOpen = true);

    pushModal(
      onPop: () => _drawerState.setState(() => _drawerState._isOpen = false),
    );
  }

  void setDrawerActiveItemIndex(final int index) =>
      _drawerState._setActiveItemIndex(index);
}

class Drawer extends StatefulWidget {
  final List<Button> items;

  const Drawer(this.items, {super.key, super.ref});

  @override
  State createState() => _drawerState;
}

class _DrawerState extends State<Drawer> {
  bool _isOpen = false;

  int _activeItemIndex = -1;

  void _setActiveItemIndex(final int index) =>
      setState(() => _activeItemIndex = index);

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      final duration = store.standardDuration;
      final curve = store.standardCurve;
      final transition = 'transform ${duration.inMilliseconds}ms $curve';

      final wrappedItems = widget.items.asMap().entries.map(
        (final entry) {
          final index = entry.key;
          final item = entry.value;

          return Container(
            [
              if (_activeItemIndex == index)
                Button.coloredDrawer(
                  icon: item.icon,
                  text: item.text,
                  onTap: (final details) {},
                )
              else
                item
            ],
            style: const Style({'display': 'contents'}),
          );
        },
      ).toList();

      return Container(
        [
          Scrim(active: _isOpen),
          Container(
            [
              Container(
                wrappedItems,
                style: const Style({
                  'display': 'flex',
                  'flex-flow': 'column',
                  'padding': '12px',
                  'min-height': '100%',
                }),
              ),
            ],
            style: Style({
              'position': 'fixed',
              'top': '0px',
              'left': '0px',
              'width': html.window.innerWidth! > 640
                  ? '360px'
                  : 'calc(100vw - 56px)',
              'height': '100vh',
              'background': store.surfaceColor.toString(),
              'color': store.onSurfaceColor.toString(),
              'transform': _isOpen ? 'translateX(0%)' : 'translateX(-100%)',
              'transition': transition,
              'overflow': 'auto',
            }),
          ),
        ],
        style: const Style({'display': 'contents'}),
      );
    });
  }
}
