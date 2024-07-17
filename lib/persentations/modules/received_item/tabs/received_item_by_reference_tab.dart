import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/received_item/widgets/received_item_card.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_outline_button.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown.dart';

class ReceivedItemByReferenceTab extends StatelessWidget {
  const ReceivedItemByReferenceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 6,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          decoration: const BoxDecoration(
            color: ColorApp.white,
            border: Border(
              bottom: BorderSide(
                color: ColorApp.border,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              InputDropdown(
                items: itemReceiveds,
                text: StringApp.reference,
                onChanged: (String? value) {},
                hint: StringApp.referenceHint,
              ),
            ],
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReceivedItemCard(),
                ReceivedItemCard(),
                ReceivedItemCard(),
                ReceivedItemCard(),
                ReceivedItemCard(),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorApp.border),
            ),
          ),
          child: CustomOutlineButton(
            text: StringApp.save,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
