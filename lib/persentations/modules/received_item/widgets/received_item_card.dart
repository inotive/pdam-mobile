import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/forms/search_input_field.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class ReceivedItemCard extends StatelessWidget {
  const ReceivedItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorApp.border,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomNetworkImage(
            height: 56,
            width: 56,
            borderRadius: 4,
            url:
                'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
          ),
          const SpacerWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Equal Tee Coupler hdpe 75mm',
                  style: StyleApp.textLg.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SpacerHeight(6),
                Text(
                  'ETCHDP7',
                  style: StyleApp.textSm.copyWith(
                    color: ColorApp.greyText,
                  ),
                )
              ],
            ),
          ),
          const SpacerWidth(12),
          Column(
            children: [
              Text(
                StringApp.qty,
                style: StyleApp.textSm.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
              const SpacerHeight(4),
              const SizedBox(
                width: 72,
                height: 40,
                child: SearchInputField(
                  hint: '1',
                  textAlign: TextAlign.center,
                ),
              ),
              const SpacerHeight(12),
              Row(
                children: [
                  QtyButton(
                    icon: Icons.add,
                    onTap: () {},
                  ),
                  const SpacerWidth(8),
                  QtyButton(
                    icon: Icons.remove,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QtyButton extends StatelessWidget {
  const QtyButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        width: 32,
        child: Container(
          decoration: BoxDecoration(
            color: ColorApp.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: ColorApp.white,
          ),
        ),
      ),
    );
  }
}
