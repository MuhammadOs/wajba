import 'package:flutter/material.dart';
import 'package:wajba/features/Notification/presentation/view/no_notification_body.dart';
import 'package:wajba/features/Notification/presentation/view/notification_body.dart';

import '../../../../core/widgets/custom_appbar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.notificaions});
  final List<int> notificaions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Notifications'),
            notificaions.isEmpty ? NoNotificationsBody() : NotificationBody(),
          ],
        ),
      ),
    );
  }
}
