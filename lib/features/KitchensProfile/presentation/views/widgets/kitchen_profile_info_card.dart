import 'package:flutter/material.dart';
import '../../../../../core/util/theme.dart';
import 'kitchen_raiting_container.dart';

class KitchenProfileInfoCard extends StatelessWidget {
  const KitchenProfileInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.1,
            backgroundImage: const AssetImage("assets/images/willy.png"),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Willy’s Kitchen',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.04, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Burger, Chicken, Fried chicken, Wrap',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We hope to deliver you the best homemade food ever just like your mama’s food',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.025, // Responsive font size
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  KitchenProfileCustomContainer(
                    icon: Icons.watch_later,
                    label: 'Open Now',
                    iconColor: wajbah_green,
                    labelColor: wajbah_green,
                    containerColor: wajbah_green_light,
                  ),
                  KitchenProfileCustomContainer(
                    icon: Icons.motorcycle,
                    label: '30-35 min',
                    iconColor: wajbah_primary,
                    labelColor: wajbah_primary,
                    containerColor: wajbah_buttons,
                  ),
                  KitchenProfileCustomContainer(
                    icon: Icons.star,
                    label: '4.7 (80)',
                    iconColor: Colors.yellow,
                    labelColor: wajbah_gray,
                    containerColor: wajbah_gray_light,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
