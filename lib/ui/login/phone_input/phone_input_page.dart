import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});

  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset("assets/svg/monitoring.svg")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
