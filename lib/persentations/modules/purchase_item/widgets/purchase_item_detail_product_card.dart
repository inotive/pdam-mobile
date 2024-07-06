import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/widgets/custom_cached_network_image.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';

class PurchaseItemDetailProductCard extends StatelessWidget {
  const PurchaseItemDetailProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorApp.border,
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              item(),
              const SpacerHeight(16),
              item(),
              const SpacerHeight(16),
              item(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: ColorApp.border,
              ),
              left: BorderSide(
                width: 1,
                color: ColorApp.border,
              ),
              right: BorderSide(
                width: 1,
                color: ColorApp.border,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${StringApp.total}:",
                style: StyleApp.textNormal.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
              Text(
                'Rp 2.300.000',
                style: StyleApp.textLg.copyWith(
                  color: ColorApp.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget item() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomNetworkImage(
          height: 40,
          width: 40,
          borderRadius: 4,
          url:
              'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
        ),
        const SpacerWidth(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Equal Tee Coupler hdpe 75mm',
                style: StyleApp.textNormal.copyWith(
                  color: ColorApp.blackText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '3 buah',
                style: StyleApp.textXs.copyWith(
                  color: ColorApp.greyText,
                ),
              ),
            ],
          ),
        ),
        const SpacerHeight(6),
        Text(
          'Rp 300.000',
          style: StyleApp.textNormal.copyWith(
            color: ColorApp.greyText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
