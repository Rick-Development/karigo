import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:karingo_v2/features/product/controllers/product_controller.dart';
import 'package:karingo_v2/features/product/domain/models/product_model.dart';
import 'package:karingo_v2/helper/responsive_helper.dart';
import 'package:karingo_v2/localization/controllers/localization_controller.dart';
import 'package:karingo_v2/theme/controllers/theme_controller.dart';
import 'package:karingo_v2/utill/dimensions.dart';
import 'package:karingo_v2/common/basewidget/product_shimmer_widget.dart';
import 'package:karingo_v2/common/basewidget/product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class FeaturedProductWidget extends StatelessWidget {
  final ScrollController? scrollController;
  final bool isHome;

  const FeaturedProductWidget({super.key,  this.scrollController, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, prodProvider, child) {
        List<Product>? productList;
        productList = prodProvider.featuredProductList;
        return Stack(children: [
            Column(children: [

              productList != null? productList.isNotEmpty ?
              isHome? Padding(padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    pageSnapping: false,
                    pauseAutoPlayOnTouch: true,
                    autoPlayInterval: const Duration(seconds: 30),
                    viewportFraction: ResponsiveHelper.isTab(context)? .43: .5,
                    autoPlay: false,
                    aspectRatio: MediaQuery.of(context).size.width/345,
                    enlargeFactor: 0.2,
                    padEnds: false,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    onPageChanged: (index, reason) => prodProvider.setFeaturedIndex(index == 0 ? 0.5 : double.parse(index.toString()))),
                  itemCount: productList.length,
                  itemBuilder: (context, index, _) => ProductWidget(productModel: productList![index]))) :

                MasonryGridView.count(
                  itemCount: productList.length,
                  crossAxisCount: ResponsiveHelper.isTab(context)? 3 : 2,
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => ProductWidget(productModel: productList![index]),
                ): const SizedBox.shrink() : ProductShimmer(isHomePage: true ,isEnabled: prodProvider.firstFeaturedLoading),

              prodProvider.isFeaturedLoading ? Center(child: Padding(
                padding: const EdgeInsets.all(Dimensions.iconSizeExtraSmall),
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
              )) : const SizedBox.shrink()]),

            Positioned(bottom: 0,right: Provider.of<LocalizationController>(context, listen: false).isLtr?20 : MediaQuery.of(context).size.width-100,
              child: Align(alignment: Alignment.bottomRight,
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  barRadius: const Radius.circular(Dimensions.paddingSizeDefault),
                  width: 80,
                  lineHeight: 4.0,
                  percent: prodProvider.featuredIndex /productList!.length,
                  backgroundColor: Provider.of<ThemeController>(context, listen: false).darkTheme?
                  Theme.of(context).primaryColor.withOpacity(.7):Theme.of(context).primaryColor.withOpacity(.2),
                  progressColor: (Provider.of<ThemeController>(context, listen: false).darkTheme)?
                  Theme.of(context).colorScheme.onSecondary :  Theme.of(context).primaryColor)))]);
      },
    );
  }
}

