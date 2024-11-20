import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/config/fonts.dart';
import '../core/utils.dart';
import '../widgets/my_button.dart';
import '../widgets/custom_container.dart';
import '../widgets/my_svg_widget.dart';
import '../widgets/title_txt.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20 + statusBar(context)),
        const TitleTxt('SETTINGS'),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: CustomContainer(
            borderRadius: 12,
            child: Column(
              children: [
                SizedBox(height: 22),
                GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://docs.google.com/document/d/1CsR9z3jJLvXVHu25hOHsd4Q8IZCZuEjnoZfio-wgL0Q/edit?usp=sharing'));
                    },
                    child: _Button(id: 2, title: 'Privacy Policy')),
                GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(
                          'https://docs.google.com/document/d/1gY7rCtYMIXmz4VV8SRtk2RJ2_G8o-wmw7SyZFSB-Jus/edit?usp=sharing'));
                    },
                    child: _Button(id: 3, title: 'Terms of use')),
                GestureDetector(
                    onTap: () {
                      launchUrl(
                          Uri.parse('https://forms.gle/P4HPVsuJwE7mUdxy6'));
                    },
                    child: _Button(id: 4, title: 'Write Support')),
                SizedBox(height: 22),
              ],
            ),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            const SizedBox(width: 20),
            MySvgWidget('assets/set$id.svg'),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: Fonts.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xff33FF00),
            ),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }
}
