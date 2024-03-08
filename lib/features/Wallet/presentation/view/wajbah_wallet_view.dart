import 'package:flutter/material.dart';
import 'package:wajba/features/Account/presentation/view/widgets/account_appbar.dart';
import 'package:wajba/features/Wallet/presentation/view/wajbah_wallet_body.dart';

class WajbahWalletView extends StatelessWidget {
  const WajbahWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AccountAppBar(title: 'Wajbah Wallet'),
            WajbahWalletBody(),
          ],
        ),
      ),
    );
  }
}
