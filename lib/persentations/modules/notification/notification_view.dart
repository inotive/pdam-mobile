import 'package:flutter/material.dart';
import 'package:pdam_inventory/app/di.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/persentations/modules/notification/viewmodel/notification_viewmodel.dart';
import 'package:pdam_inventory/persentations/modules/notification/widgets/notification_card.dart';
import 'package:pdam_inventory/persentations/packages/state_renderer/state_renderer_impl.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';
import 'package:pdam_inventory/persentations/widgets/card/empty_card.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final NotificationViewmodel _notificationViewmodel = instance<NotificationViewmodel>();

  _bind() {
    _notificationViewmodel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringApp.notifcation),
      ),
      body: StreamBuilder<FlowState>(
          stream: _notificationViewmodel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidgets(), () {
                  _bind();
                }) ??
                _getContentWidgets();
          }),
    );
  }

  ListView _getContentWidgets() {
    return ListView(
      children: [
        StreamBuilder<List<NotificationData>>(
            stream: _notificationViewmodel.outputNotification,
            builder: (context, snapshot) {
              List<NotificationData> data = snapshot.data ?? List.empty();

              if (snapshot.hasData) {
                return Column(
                  children: data.map((item) {
                    return NotificationCard(item);
                  }).toList(),
                );
              } else {
                return const EmptyCard(message: StringApp.notificationDataNotYet);
              }
            }),
      ],
    );
  }

  @override
  void dispose() {
    _notificationViewmodel.dispose();
    super.dispose();
  }
}
