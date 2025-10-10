import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/types/leaf.dart';
import 'package:ugaoo/modules/app_core/design/components/checkbox/types/sprout.dart';
import 'package:ugaoo/modules/app_core/design/components/switcher/types/tendril.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/root.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ugaoo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Leaf.primary(
                label: 'Primary Button',
                isLoading: isLoading,
                onPressed: () {
                  setState(() {
                    isLoading = !isLoading;
                  });
                }),
            Leaf.secondary(
              label: 'Secondary Button',
              isLoading: isLoading,
              onPressed: () {},
            ),
            Leaf.link(label: 'Link Button', onPressed: () {}),
            Bud.display(
              text: 'Display Text',
            ),
            Bud.headline(text: 'Headline Text'),
            Bud.title(text: 'Title Text'),
            Bud.bodyLarge(text: 'Body Large Text'),
            Bud.bodyMedium(text: 'Body Medium Text'),
            Bud.label(text: 'Label Text'),
            Bud.caption(text: 'Caption Text'),
            Root(
              hintText: 'Enter your text',
            ),
            Sprout(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            Tendril(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
