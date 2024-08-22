import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';

Future<bool?> confirmDialog(BuildContext context, {required Function() onConfirm}) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Konfirmasi!',
          style: StyleApp.text2xl.copyWith(
            fontFamily: FontFamilyApp.inter,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin melanjutkan?',
          style: StyleApp.textNormal.copyWith(
            fontFamily: FontFamilyApp.inter,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              'Confirm',
              style: StyleApp.textNormal.copyWith(
                fontFamily: FontFamilyApp.inter,
                fontWeight: FontWeight.bold,
                color: ColorApp.primary,
              ),
            ),
          ),
        ],
      );
    },
  );
}
