import 'package:flutter/material.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Order_Tracking/presentation/view/track_screen_view.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../data/cart_item_class.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final int totalItems;
  final double taxRate;
  final double deliveryFee;
  final double discount;

  const CheckoutScreen({
    Key? key,
    required this.cartItems,
    required this.totalItems,
    required this.taxRate,
    required this.deliveryFee,
    required this.discount,
  }) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late double total;
  bool isInstantChecked = true;
  bool isScheduledChecked = false;
  TimeOfDay selectedTime = const TimeOfDay(hour: 12, minute: 0); // Default time

  bool isCashChecked = true;
  bool isCreditChecked = false;
  String promoCode = '';
  List<String> promoCodesList = [
    'PROMO1',
    'PROMO2',
    'PROMO3'
  ]; // List of promo codes

  String promoCodeFeedback = '';
  Color promoCodeFieldColor = Colors.transparent;

  String paymentMethod = 'Cash';

  String deliveryInstructions = '';

  double tipAmount = 0.0;

  @override
  void initState() {
    super.initState();
    total = calculateTotal(widget.cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(title: "Checkout"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDeliveryInfo(),
                  const Divider(
                    thickness: 15,
                    color: wajbah_gray_light,
                  ),
                  const SizedBox(height: 10),
                  _buildPromoCodeSection(),
                  const SizedBox(height: 10),
                  Text(
                    promoCodeFeedback,
                    style: TextStyle(
                      color: promoCodeFieldColor == Colors.red
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  // Payment Method Section
                  const Divider(
                    thickness: 15,
                    color: wajbah_gray_light,
                  ),
                  const SizedBox(height: 10),
                  _buildPaymentMethodSection(),
                  const Divider(
                    thickness: 15,
                    color: wajbah_gray_light,
                  ),
                  SizedBox(height: 10),
                  _buildDeliveryInstructionsSection(),
                  // Say Thanks with a Tip Section
                  const Divider(
                    thickness: 15,
                    color: wajbah_gray_light,
                  ),
                  _buildSayThanksWithTipSection(),
                  // Order Summary Section
                  const Divider(
                    thickness: 15,
                    color: wajbah_gray_light,
                  ),
                  const SizedBox(height: 10),
                  _buildOrderSummarySection(),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: wajbah_primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TrackScreenView()),
          );
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.totalItems.toString(),
              style: Styles.titleSmall.copyWith(color: wajbah_white),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              "Place order",
              style:
                  Styles.titleSmall.copyWith(color: wajbah_white, fontSize: 18),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              total.roundToDouble().toString(),
              style: Styles.titleSmall.copyWith(color: wajbah_white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildDeliveryInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Info',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isInstantChecked ? Colors.blue.withOpacity(0.3) : null,
            ),
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isInstantChecked = true;
                  isScheduledChecked = false;
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.fastfood),
                  const SizedBox(width: 10),
                  const Text('Instant Delivery'),
                  const Spacer(),
                  Checkbox(
                    value: isInstantChecked,
                    onChanged: (value) {
                      setState(() {
                        isInstantChecked = value!;
                        isScheduledChecked = !value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                isScheduledChecked = true;
                isInstantChecked = false;
              });
            },
            child: Container(
              color: isScheduledChecked ? Colors.blue.withOpacity(0.3) : null,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10),
                  Text('Scheduled Delivery'),
                  Spacer(),
                  TextButton(
                    onPressed: _selectTime,
                    child: Text('Select Time'),
                  ),
                  Checkbox(
                    value: isScheduledChecked,
                    onChanged: (value) {
                      setState(() {
                        isScheduledChecked = value!;
                        isInstantChecked = !value;
                        if (value) {
                          _selectTime();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateDeliveryMethod() {
    // Add any necessary logic to handle updating the delivery method state here
  }

  Widget _buildPromoCodeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promo Code',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter promo code',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: promoCodeFieldColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: _applyPromoCode,
                        icon: const Text(
                          'Apply',
                          style: TextStyle(color: wajbah_primary),
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      promoCode = value;
                      promoCodeFieldColor =
                          Colors.transparent; // Reset outline color
                      promoCodeFeedback = ''; // Reset feedback
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                isCashChecked = true;
                isCreditChecked = false;
              });
            },
            child: PaymentMethodOption(
              icon: Icons.money,
              text: 'Cash',
              isSelected: isCashChecked,
              onTap: () {
                setState(() {
                  isCashChecked = true;
                  isCreditChecked = false;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                isCreditChecked = true;
                isCashChecked = false;
              });
            },
            child: PaymentMethodOption(
              icon: Icons.credit_card,
              text: 'Credit Card',
              isSelected: isCreditChecked,
              onTap: () {
                setState(() {
                  isCreditChecked = true;
                  isCashChecked = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInstructionsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Instructions',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // Circular border radius
              border: Border.all(color: Colors.grey), // Outline border
            ),
            child: TextField(
              maxLines: 3, // Set max lines to 3
              decoration: const InputDecoration(
                hintText: 'Enter delivery instructions (if any)',
                border: InputBorder.none, // Hide default border
                contentPadding: EdgeInsets.all(10), // Adjust padding
              ),
              onChanged: (value) {
                deliveryInstructions = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSayThanksWithTipSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Say Thanks with a Tip',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildTipButton(5),
              SizedBox(width: 10),
              _buildTipButton(10),
              SizedBox(width: 10),
              _buildTipButton(15),
              SizedBox(width: 10),
              //_buildTipButton(20),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Selected Tip Amount: $tipAmount EGP',
            style: TextStyle(fontSize: 16),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter custom tip amount',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                tipAmount = double.tryParse(value) ?? 0;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Subtotal: ${widget.cartItems.length > 0 ? widget.cartItems.map((item) => item.price * item.quantity).reduce((value, element) => value + element) : 0}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Coupons: ${promoCodeFeedback.isNotEmpty ? promoCodeFeedback : "No coupon applied"}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Delivery Fee: ${widget.deliveryFee}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTipButton(double amount) {
    return FilledButton(
      onPressed: () {
        setState(() {
          tipAmount = amount;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: tipAmount == amount ? wajbah_white : wajbah_gray,
        backgroundColor: tipAmount == amount ? wajbah_primary : wajbah_white,
        side: const BorderSide(color: wajbah_gray), // Add gray outline
      ),
      child: Text('$amount EGP'),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _applyPromoCode() {
    if (promoCodesList.contains(promoCode)) {
      setState(() {
        promoCodeFeedback = 'Promo code applied successfully!';
        promoCodeFieldColor = Colors.green;
      });
    } else {
      setState(() {
        promoCodeFeedback = 'Invalid promo code';
        promoCodeFieldColor = Colors.red;
      });
    }
  }

  double calculateTotal(List<CartItem> cartItems) {
    double subtotal = 0;
    for (var item in cartItems) {
      subtotal += (item.price * item.quantity);
    }
    double tax = subtotal * widget.taxRate;
    double total =
        subtotal + tax + widget.deliveryFee - widget.discount + tipAmount;
    return total;
  }
}

class PaymentMethodOption extends StatefulWidget {
  final IconData icon;
  final String text;
  bool isSelected;
  final VoidCallback onTap;

  PaymentMethodOption({
    Key? key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PaymentMethodOption> createState() => _PaymentMethodOptionState();
}

class _PaymentMethodOptionState extends State<PaymentMethodOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected ? Colors.blue.withOpacity(0.3) : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width: 10),
            Text(widget.text),
            Spacer(),
            Checkbox(
              value: widget.isSelected,
              onChanged: (value) {
                setState(() {
                  widget.isSelected = value!;
                });
                widget.onTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
