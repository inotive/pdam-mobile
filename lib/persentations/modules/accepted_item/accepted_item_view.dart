import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/modules/accepted_item/widgets/accepted_item_by_date_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class AcceptedItemView extends StatelessWidget {
  const AcceptedItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.grey,
      appBar: AppBar(
        title: const Text(StringApp.acceptedItem),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.receivedItem),
        backgroundColor: ColorApp.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.add_box_outlined,
          color: ColorApp.white,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: const [
          AcceptedItemByDateCard(),
          AcceptedItemByDateCard(),
          AcceptedItemByDateCard(),
        ],
      ),
    );
  }
}
