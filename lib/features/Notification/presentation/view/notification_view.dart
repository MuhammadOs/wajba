import 'package:flutter/material.dart';
import 'package:wajba/features/Account/presentation/view/widgets/account_appbar.dart';
import 'package:wajba/features/Notification/presentation/view/no_notification_body.dart';
import 'package:wajba/features/Notification/presentation/view/notification_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key, required this.notificaions});
  final List<int> notificaions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AccountAppBar(title: 'Notifications'),
            notificaions.isEmpty ? NoNotificationsBody() : NotificationBody(),
          ],
        ),
      ),
    );
  }
}
