import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ColorBox(text: 'Primary (Light)', color: Color(0xff2E6F40)),
            _ColorBox(text: 'Primary (Dark)', color: Color(0xff6FCF97)),
            _ColorBox(text: 'Secondary (Light)', color: Color(0xffA5804B)),
            _ColorBox(text: 'Secondary (Dark)', color: Color(0xffBDA072)),
            _ColorBox(text: 'Accent (Light & Dark)', color: Color(0xffFFE066)),
            _ColorBox(text: 'Tertiary (Light)', color: Color(0xffB2EBF2)),
            _ColorBox(text: 'Tertiary (Dark)', color: Color(0xff263B36)),
            _ColorBox(
                text: 'Highlight (Light & Dark)', color: Color(0xffE8CEBF)),
            _ColorBox(text: 'Background (Light)', color: Color(0xffFDF8F5)),
            _ColorBox(text: 'Background (Dark)', color: Color(0xff181D1A)),
            _ColorBox(text: 'Card (Light)', color: Color(0xffFFFFFF)),
            _ColorBox(text: 'Card (Dark)', color: Color(0xff232823)),
            _ColorBox(text: 'Surface (Light)', color: Color(0xffFFFFFF)),
            _ColorBox(text: 'Surface (Dark)', color: Color(0xff263B36)),
            _ColorBox(text: 'Text Primary (Light)', color: Color(0xff2A2B2A)),
            _ColorBox(text: 'Text Primary (Dark)', color: Color(0xffF7F6F3)),
            _ColorBox(text: 'Text Secondary (Light)', color: Color(0xff727C6F)),
            _ColorBox(text: 'Text Secondary (Dark)', color: Color(0xffA8A8A8)),
            _ColorBox(text: 'Success (Light & Dark)', color: Color(0xff28A745)),
            _ColorBox(text: 'Warning (Light & Dark)', color: Color(0xffFFC107)),
            _ColorBox(text: 'Error (Light)', color: Color(0xffDC3545)),
            _ColorBox(text: 'Error (Dark)', color: Color(0xffFF6F6F)),
            _ColorBox(text: 'Info (Light & Dark)', color: Color(0xff17A2B8)),
            _ColorBox(text: 'Disabled (Light)', color: Color(0xffBDBDBD)),
            _ColorBox(text: 'Disabled Bg (Dark)', color: Color(0xff212825)),
            _ColorBox(text: 'Disabled Text (Dark)', color: Color(0xff47544C)),
          ],
        ),
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  const _ColorBox({
    required this.text,
    required this.color,
    super.key,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 100,
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ],
    );
  }
}
