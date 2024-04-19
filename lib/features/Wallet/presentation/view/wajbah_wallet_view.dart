import 'package:flutter/material.dart';
import 'package:wajba/features/Wallet/presentation/view/wajbah_wallet_body.dart';
import '../../../../core/widgets/custom_appbar.dart';

class WajbahWalletView extends StatelessWidget {
  const WajbahWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Wajbah Wallet'),
            const WajbahWalletBody(),
          ],
        ),
      ),
    );
  }
}
