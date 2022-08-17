import 'package:dawn/dawn.dart';

import 'screens/home.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Container(
      [Navigator(child: Home())],
      style: Style({
        'height': '100vh',
        'font-size': '16px',
        'font-family': 'JostVF',
        'overflow': 'auto',
      }),
    );
  }
}
