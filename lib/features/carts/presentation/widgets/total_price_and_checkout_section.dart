import 'package:e_commerce/app/app_colors.dart' show AppColors;
import 'package:e_commerce/app/utils/constant.dart';
import 'package:e_commerce/features/carts/presentation/controllers/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class TotalPriceAndCheckoutSection extends StatelessWidget {
  const TotalPriceAndCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GetBuilder<CartListController>(
                builder: (controller) {
                  return Text(
                    '${takaSign}${controller.totalPrice}',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.themeColor,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () async {
                try {
                  await payment();
                } catch (e) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Payment failed: $e')),
                  );
                }
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> payment() async {
    final sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "ostad68fdb35627768",
        store_passwd: "ostad68fdb35627768@ssl",
        total_amount: 1.00,
        tran_id: "custom_transaction_id_${DateTime.now().millisecondsSinceEpoch}",
      ),
    );

    final response = await sslcommerz.payNow();

    if (response.status == 'VALID') {
      print('Success');
      print('TxID: ${response.tranId}');
      print('TxDate: ${response.tranDate}');

    } else if (response.status == 'FAILED') {
      print('Payment Failed');

    } else if (response.status == 'CLOSED') {
      print('Payment Closed by User');

    } else {
      print('Unknown Status: ${response.status}');
    }
  }
}