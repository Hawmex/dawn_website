import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/items_list.dart';
import '../widgets/paragraph.dart';
import '../widgets/screen.dart';
import 'get_started.dart' deferred as get_started;

class Install extends StatelessWidget {
  const Install({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 1,
      next: Button.extendedSecondaryFilled(
        icon: 'chevron_right',
        text: 'Get Started',
        onTap: (final details) => Navigator.pushRouteLazily(
          loader: get_started.loadLibrary,
          builder: (final context) => get_started.GetStarted(),
        ),
      ),
      content: const Content([
        Heading.h1(Text('Install')),
        Paragraph([Text('How to install Dawn?')]),
        Paragraph([Text('To install Dawn you have to activate two packages:')]),
        ItemsList.unordered([
          Paragraph([
            Code.inline('dawn'),
            Text(': To set up your application'),
          ]),
          Paragraph([
            Code.inline('webdev'),
            Text(': To serve, debug, and build your application')
          ]),
        ]),
        Heading.h2(Text('Activate Dawn')),
        Code.block(
          'dart pub global activate dawn',
          language: ProgrammingLanguage.powershell,
        ),
        Heading.h2(Text('Activate Webdev')),
        Code.block(
          'dart pub global activate webdev',
          language: ProgrammingLanguage.powershell,
        ),
      ]),
    );
  }
}
