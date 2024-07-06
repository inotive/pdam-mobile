import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdam_inventory/persentations/resources/theme_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/header_home_card.dart';

class DesignSystemView extends StatelessWidget {
  const DesignSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return Scaffold(
      body: ListView(
        children: [
          HeaderHomeCard(),
        ],
      ),
    );
  }
}
