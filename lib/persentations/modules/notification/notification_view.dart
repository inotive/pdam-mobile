import 'package:flutter/material.dart';
import 'package:pdam_inventory/dummy/dummy_data.dart';
import 'package:pdam_inventory/persentations/modules/notification/widgets/notification_card.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.notifcation),
      ),
      body: ListView(
        children: notifications.map((item) => NotificationCard(item)).toList(),
      ),
    );
  }
}
