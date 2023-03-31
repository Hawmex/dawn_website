import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/paragraph.dart';
import '../widgets/screen.dart';
import 'features.dart' deferred as features;
import 'install.dart' deferred as install;

class GetStarted extends StatelessWidget {
  const GetStarted({super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      drawerActiveItemIndex: 2,
      previous: Button.extendedNormalText(
        icon: 'chevron_left',
        text: 'Install',
        onTap: (final details) => Navigator.pushRouteLazily(
          loader: install.loadLibrary,
          builder: (final context) => install.Install(),
        ),
      ),
      next: Button.extendedSecondaryFilled(
        icon: 'chevron_right',
        text: 'Features',
        onTap: (final details) => Navigator.pushRouteLazily(
          loader: features.loadLibrary,
          builder: (final context) => features.Features(),
        ),
      ),
      content: const Content([
        Heading.h1(Text('Get Started')),
        Paragraph([Text('How to set up a Dawn application?')]),
        Heading.h2(Text('Create Your App')),
        Paragraph([
          Text(
            "Dawn's CLI, provides a command that helps you create "
            "your applications.",
          ),
        ]),
        Code.block(
          'dawn create <app_name>',
          language: ProgrammingLanguage.powershell,
        ),
        Paragraph([Text("For more information about Dawn's CLI, run:")]),
        Code.block(
          'dawn --help',
          language: ProgrammingLanguage.powershell,
        ),
        Paragraph([
          Text('After creating your app is done, open its directory.'),
        ]),
        Code.block(
          'cd <app_name>',
          language: ProgrammingLanguage.powershell,
        ),
        Heading.h2(Text('Serve And Debug Your App')),
        Paragraph([
          Text('To serve and debug your app, use '),
          Code.inline('webdev'),
          Text('. You activated this package in the previous page.')
        ]),
        Code.block(
          'webdev serve',
          language: ProgrammingLanguage.powershell,
        ),
        Paragraph([Text("For more information about Webdev's CLI, run:")]),
        Code.block(
          'webdev --help',
          language: ProgrammingLanguage.powershell,
        ),
      ]),
    );
  }
}
