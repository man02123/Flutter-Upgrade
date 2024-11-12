import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wasmproject/screen/productListitem.dart';

import 'OldProductListingScreenViewModel.dart';
import 'app_theme.dart';

class OldProductListingScreenDesktopLayout extends StatelessWidget {
  final ListCategoriesResponse listCategoryResponse;

  const OldProductListingScreenDesktopLayout({
    Key? key,
    required this.listCategoryResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        // if (viewModel.skipPagination) return true;
        // viewModel.onPageScrolled(
        //   scrollNotification,
        //   PrimaryScrollController.of(context),
        // );
        return false;
      },
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          children: [
            Container(
              height: 1,
              decoration:
                  BoxDecoration(color: AppThemeData.instance.strokeDark3),
            ),
            Stack(
              fit: StackFit.passthrough,
              children: [
                Column(
                  children: [
                    // SizedBox(
                    //   height: (BannerWidget.bannerAspectRatio *
                    //           (mediaQuery.size.width -
                    //               BannerWidget.bannerOldHorizontalPadding)) +
                    //       BannerWidget.bannerTotalVerticalSpacing,
                    // ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 500),
                      child: OldCatalogWidget(
                        listCategoryResponse: listCategoryResponse,
                      ),
                    ),
                  ],
                ),
                // BannerWidget(
                //   totalHorizontalPadding:
                //       BannerWidget.bannerOldHorizontalPadding,
                //   totalScreenWidth: MediaQuery.of(context).size.width,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListCategoriesResponse {
  List<Category> categories;

  ListCategoriesResponse({required this.categories});
}

class OldCatalogWidget extends StatelessWidget {
  final ListCategoriesResponse listCategoryResponse;

  const OldCatalogWidget({
    Key? key,
    required this.listCategoryResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // viewModel.listingWidgetKey = GlobalKey();
    return Row(
      // key: viewModel.listingWidgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // OldCategoriesWidget(
            //   listCategoryResponse: listCategoryResponse,
            //   viewModel: viewModel,
            // ),
            //NOTE: Uncomment in future if required
            // const SizedBox(
            //   height: 16,
            // ),
            // const OldUserNudgeCard()
          ],
        ),
        Expanded(
          child: ProductList(),
        ),
      ],
    );
  }
}
