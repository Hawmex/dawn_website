import 'package:dawn/dawn.dart';

import '../utils/syntax_highlighting.dart';
import '../widgets/code_block.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/inline_code.dart';
import '../widgets/link.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Screen([
      TopBar(title: 'Get Started'),
      Content(
        [
          Section([
            Heading('Install Dart'),
            Container([
              Text('There are two ways to install Dart. You can either '),
              Link(
                text: 'directly install it',
                address: 'https://dart.dev/get-dart',
              ),
              Text(' or you can '),
              Link(
                text: 'indirectly get it',
                address: 'https://docs.flutter.dev/get-started/install',
              ),
              Text(' by installing Flutter.'),
            ]),
          ]),
          Section([
            Heading('Install Dawn CLI'),
            Text(
              'First, we need to install Dawn CLI by globally activating Dawn.',
            ),
            CodeBlock(
              'dart pub global activate dawn',
              language: Language.powershell,
            ),
          ]),
          Section([
            Heading('Create A New Dawn App'),
            Text(
              'Now that we have Dawn CLI installed, we can simply run a '
              'Dawn command to create a new app.',
            ),
            CodeBlock(
              'dawn create my_awesome_app',
              language: Language.powershell,
            ),
          ]),
          Section([
            Heading('Open Project Directory'),
            Text('Next, we head to the directory of our project.'),
            CodeBlock(
              'cd my_awesome_app',
              language: Language.powershell,
            ),
          ]),
          Section([
            Heading('Start Development Environment'),
            Container([
              Text('Now, we can edit the '),
              InlineCode('/web'),
              Text(
                ' directory in our project. To see the changes, we can run a '
                'development server using Dawn CLI.',
              ),
            ]),
            CodeBlock(
              'dawn compile -s',
              language: Language.powershell,
            ),
          ]),
          Section([
            Heading('Compile For Production'),
            Text(
              'Finally, to get the production-ready output of our app, we '
              'run the following Dawn command.',
            ),
            CodeBlock(
              'dawn compile -m prod',
              language: Language.powershell,
            ),
            Container([
              Text('Production output, will be available at '),
              InlineCode('/.dawn/prod'),
              Text(' .'),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
