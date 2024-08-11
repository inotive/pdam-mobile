import 'package:flutter/material.dart';
import 'package:pdam_inventory/persentations/resources/color_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/resources/style_app.dart';
import 'package:pdam_inventory/persentations/resources/value_app.dart';
import 'package:pdam_inventory/persentations/widgets/button/custom_button.dart';
import 'package:pdam_inventory/persentations/widgets/spacer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerApp {
  showDateRangePicker(
    BuildContext context, {
    required DateTime initialSelectedDate,
    required Function(DateRangePickerSelectionChangedArgs) onSelectionChanged,
    required Function() onYes,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: ColorApp.white,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter stateSetter) {
            return Container(
              height: 500,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 18,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringApp.chooseDate,
                        style: StyleApp.textLg.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamilyApp.inter,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          color: ColorApp.black,
                        ),
                      ),
                    ],
                  ),
                  SfDateRangePicker(
                    showNavigationArrow: true,
                    selectionMode: DateRangePickerSelectionMode.single,
                    selectionShape: DateRangePickerSelectionShape.rectangle,
                    selectionColor: ColorApp.primary,
                    selectionRadius: 8,
                    backgroundColor: Colors.white,
                    selectionTextStyle: StyleApp.textNormal.copyWith(
                      color: ColorApp.white,
                      fontFamily: FontFamilyApp.inter,
                      fontWeight: FontWeight.bold,
                    ),
                    initialSelectedDate: initialSelectedDate,
                    headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: Colors.white,
                      textStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                    ),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      weekendTextStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                      todayTextStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                      blackoutDateTextStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                      textStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                      trailingDatesTextStyle: StyleApp.textNormal.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyApp.inter,
                      ),
                      todayCellDecoration: BoxDecoration(
                        border: Border.all(
                          color: ColorApp.primary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      dayFormat: 'EEE',
                    ),
                    onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                      if (args.value is DateTime) {
                        stateSetter(() {
                          initialSelectedDate = args.value;
                        });
                        onSelectionChanged(args);
                      }
                    },
                  ),
                  const SpacerHeight(18),
                  Row(
                    children: [
                      const Text(
                        StringApp.date,
                        style: StyleApp.textNormal,
                      ),
                      const SpacerWidth(16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: ColorApp.grey),
                          ),
                        ),
                        child: Text(
                          "${initialSelectedDate.day}",
                          style: StyleApp.textNormal,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Text('/'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: ColorApp.grey),
                          ),
                        ),
                        child: Text(
                          "${initialSelectedDate.month}",
                          style: StyleApp.textNormal,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Text('/'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: ColorApp.grey),
                          ),
                        ),
                        child: Text(
                          "${initialSelectedDate.year}",
                          style: StyleApp.textNormal,
                        ),
                      ),
                    ],
                  ),
                  const SpacerHeight(24),
                  CustomButton(
                    onPressed: () {
                      onYes();
                      Navigator.pop(context);
                    },
                    text: StringApp.yes,
                  ),
                ],
              ),
            );
          });
        });
  }
}
