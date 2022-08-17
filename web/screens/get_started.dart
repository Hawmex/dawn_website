import 'package:dawn/dawn.dart';

import '../components/docs_dropdown.dart';
import '../widgets/button.dart';
import '../widgets/code.dart';
import '../widgets/content.dart';
import '../widgets/heading.dart';
import '../widgets/link.dart';
import '../widgets/screen.dart';
import '../widgets/section.dart';
import '../widgets/top_bar.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen([
      TopBar(
        title: 'Get Started',
        trailing: [
          const DocsDropDown(),
          Button('Back', onTap: (final event) => context.pop(), solid: true),
        ],
      ),
      const Content(
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
            Code('dart pub global activate dawn'),
          ]),
          Section([
            Heading('Create A New Dawn App'),
            Text(
              'Now that we have Dawn CLI installed, we can simply run a '
              'Dawn command to create a new app.',
            ),
            Code('dawn create my_awesome_app'),
          ]),
          Section([
            Heading('Open Project Directory'),
            Text('Next, we head to the directory of our project.'),
            Code('cd my_awesome_app'),
          ]),
          Section([
            Heading('Start Development Environment'),
            Container([
              Text('Now, we can edit the '),
              Code('/web', inline: true),
              Text(
                ' directory in our project. To see the changes, we can run a '
                'development server using Dawn CLI.',
              ),
            ]),
            Code('dawn compile -s'),
          ]),
          Section([
            Heading('Compile For Production'),
            Text(
              'Finally, to get the production-ready output of our app, we '
              'run the following Dawn command.',
            ),
            Code('dawn compile -m prod'),
            Container([
              Text('Production output, will be available at '),
              Code('/.dawn/prod', inline: true),
              Text(' .'),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
