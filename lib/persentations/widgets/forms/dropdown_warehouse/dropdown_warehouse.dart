import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/persentations/widgets/forms/input_dropdown_warehouse.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/forms/dropdown_warehouse/viewmodel/warehouse_viewmodel.dart';

class DropdownWarehouse extends StatefulWidget {
  const DropdownWarehouse({super.key, required this.onChanged, this.validator, this.selectedValue});

  final Function(ReceiveOrderWarehouseData?) onChanged;
  final String? Function(ReceiveOrderWarehouseData?)? validator;
  final ReceiveOrderWarehouseData? selectedValue;

  @override
  State<DropdownWarehouse> createState() => _DropdownWarehouseState();
}

class _DropdownWarehouseState extends State<DropdownWarehouse> {
  final WarehouseViewmodel _warehouseViewmodel = instance<WarehouseViewmodel>();

  @override
  void initState() {
    _warehouseViewmodel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ReceiveOrderWarehouseData>>(
        stream: _warehouseViewmodel.outputWarehouse,
        builder: (context, snapshot) {
          List<ReceiveOrderWarehouseData> data = snapshot.data ?? List.empty();
          return InputDropdownWarehouse(
            items: data,
            text: StringApp.warehouse,
            value: widget.selectedValue,
            onChanged: widget.onChanged,
            hint: StringApp.searchWarehouse,
          );
        });
  }
}
