import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'button.dart';
import 'scrim.dart';
import 'theme.dart';

class Drawer extends StatefulWidget {
  static _DrawerState? _state;

  static void open() {
    _state!.setState(() {
      _state!._isOpen = true;
    });

    Navigator.pushModal(
      onPop: () {
        _state!.setState(() {
          _state!._isOpen = false;
        });
      },
    );
  }

  static void setActiveItemIndex(final int index) =>
      _state!._setActiveItemIndex(index);

  final List<Button> items;

  const Drawer(this.items, {super.key, super.ref});

  @override
  State createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  bool _isOpen = false;

  int _activeItemIndex = -1;

  void _setActiveItemIndex(final int index) =>
      setState(() => _activeItemIndex = index);

  @override
  void initialize() {
    super.initialize();
    Drawer._state = this;
  }

  @override
  void dispose() {
    Drawer._state = null;
    super.dispose();
  }

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
