import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';

class NoPastOrders extends StatelessWidget {
  const NoPastOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Icon(
            Icons.not_interested_outlined,
            color: wajbah_primary,
            size: 170,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You are Missing Out ! \n You Haven\'t Placed any Orders Yet !',
            style: Styles.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Discover the Best Kitchens around\nYou and Place Your Order Now ! ',
            style: Styles.hint,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Order now',
            color: wajbah_primary,
          )
        ],
      ),
    );
  }
}
