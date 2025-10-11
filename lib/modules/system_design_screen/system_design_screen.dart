import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/buttons/types/leaf.dart';
import 'package:ugaoo/modules/app_core/design/components/checkbox/types/sprout.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/components/switcher/types/tendril.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/root.dart';
import 'package:ugaoo/modules/app_core/design/extensions/app_design_extension.dart';
import 'package:ugaoo/modules/system_design_screen/model/system_design_screen_model.dart';

part 'types/font_variations.dart';
part 'types/color_variations.dart';
part 'types/switch_variation.dart';
part 'types/button_variation.dart';
part 'types/input_variation.dart';

class SystemDesignScreen extends StatefulWidget {
  const SystemDesignScreen({super.key});

  @override
  State<SystemDesignScreen> createState() => _SystemDesignScreenState();
}

class _SystemDesignScreenState extends State<SystemDesignScreen> {
  final List<SystemDesignScreenModel> _tabs = const [
    SystemDesignScreenModel(name: 'Colors', widget: _ColorVariations()),
    SystemDesignScreenModel(name: 'Typography', widget: _TextVariations()),
    SystemDesignScreenModel(name: 'Switcher', widget: _SwitcherVariations()),
    SystemDesignScreenModel(name: 'Button', widget: _ButtonVariation()),
    SystemDesignScreenModel(name: 'Input', widget: _InputVariation()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding.regular),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                tabs: _tabs.map((label) => Tab(text: label.name)).toList(),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.padding.relaxed),
                  child: TabBarView(
                    children: _tabs.map((tab) => tab.widget).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
