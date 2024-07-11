import 'package:flutter/material.dart';
import 'package:karingo_v2/features/checkout/controllers/checkout_controller.dart';
import 'package:karingo_v2/localization/language_constrants.dart';
import 'package:karingo_v2/utill/color_resources.dart';
import 'package:karingo_v2/utill/custom_themes.dart';
import 'package:karingo_v2/utill/dimensions.dart';
import 'package:provider/provider.dart';

class ProceedButtonWidget extends StatelessWidget {
  const ProceedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 60,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(child: Consumer<CheckoutController>(
          builder: (context, checkoutController, child) {
            return !checkoutController.isLoading ?
            Text(getTranslated('proceed', context)!, style: titilliumSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
              color: ColorResources.white)):
            Container(height: 30,width: 30 ,alignment: Alignment.center,
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).highlightColor)));}),
      ),
    );
  }
}
