// //
// // Created by bhavyadeeppurswani on 20/07/22.
// //
//
// import 'package:flutter/material.dart';
// import 'package:wasmproject/screen/productListitem.dart';
//
// import '../app_theme.dart';
//
// class OldCategoriesWidget extends StatelessWidget {
//   static const categoriesCardAspectRatio = 312 / 1440;
//   final ListCategoriesResponse listCategoryResponse;
//   final OldProductListingScreenViewModel viewModel;
//
//   const OldCategoriesWidget({
//     required this.viewModel,
//     Key? key,
//     required this.listCategoryResponse,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * categoriesCardAspectRatio,
//       decoration: BoxDecoration(
//         color: AppThemeData.instance.backgroundLight2,
//         border: BorderDirectional(
//           top: BorderSide(color: AppThemeData.instance.strokeDark3, width: 0.5),
//           end: BorderSide(color: AppThemeData.instance.strokeDark3, width: 0.5),
//           bottom:
//               BorderSide(color: AppThemeData.instance.strokeDark3, width: 0.5),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsetsDirectional.fromSTEB(35, 40, 35, 30),
//             child: Text(
//               "Catogaries",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           OldCategoryList(
//             viewModel: viewModel,
//             categoryList: listCategoryResponse.categories,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class OldProductsWidget extends StatelessWidget {
//   final OldProductListingScreenViewModel viewModel;
//
//   const OldProductsWidget({
//     required this.viewModel,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.fromSTEB(53, 37, 53, 42),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsetsDirectional.only(start: 8),
//                 child: Text(
//                   "catalog",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//               ),
//               const SizedBox(
//                 height: 23,
//               ),
//               OldFilterCategoryWidget(
//                 viewModel: viewModel,
//               ),
//               Container(
//                 height: 1,
//                 decoration:
//                     BoxDecoration(color: AppThemeData.instance.strokeDark3),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           OldProductList(
//             viewModel: viewModel,
//             category: viewModel.activeCategory.value,
//             activeDealsFilter: viewModel.activeDealsCategoryId.value,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class OldProductList extends StatelessWidget {
//   final OldProductListingScreenViewModel viewModel;
//   final Category? category;
//   final String? activeDealsFilter;
//
//   const OldProductList({
//     required this.viewModel,
//     Key? key,
//     this.category,
//     this.activeDealsFilter,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ServiceHandlerWidget(
//       onRetry: (scaffoldViewModel) {
//         if (activeDealsFilter != null) {
//           if (activeDealsFilter ==
//                   OldProductListingScreenViewModel.allDealsCategoriesId &&
//               category != null) {
//             viewModel.onCategoryClick(category!);
//             return;
//           } else {
//             viewModel.onDealsCategoryClick(viewModel.dealCategoryList
//                 .where((deal) => deal.tag == activeDealsFilter)
//                 .first);
//             return;
//           }
//         }
//         if (category != null) {
//           viewModel.onCategoryClick(category!);
//         }
//       },
//       onViewModelCreated: (serviceHandlerViewModel) {
//         viewModel.updateProductListViewModel(serviceHandlerViewModel);
//       },
//       serviceHandler: AppScaffoldServiceHandler<ListProductsResponse>(
//         cacheInitialCallResponse: false,
//         initialServiceCall: () => viewModel.productsResponseFuture,
//         serviceWaitingWidget: const SizedBox(),
//         serviceResponseWidgetBuilder: (
//           context,
//           serviceHandlerViewModel,
//           response,
//         ) {
//           var mediaQuery = MediaQuery.of(context);
//           viewModel.updateInitialPageToken(response.nextPageToken);
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Wrap(
//                 alignment: WrapAlignment.start,
//                 runAlignment: WrapAlignment.start,
//                 spacing: 37,
//                 runSpacing: 46,
//                 crossAxisAlignment: WrapCrossAlignment.start,
//                 children: _getProductCards(mediaQuery.size),
//               ),
//               const SizedBox(
//                 height: 36,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   List<Widget> _getProductCards(Size size) {
//     List<Widget> productCards = [];
//     viewModel.products.values.toList().forEachIndexed((index, element) {
//       if (viewModel.catalogDynamicCardContent.containsKey(index + 1)) {
//         productCards.add(
//           LayoutBuilder(builder: (context, constraints) {
//             return MigrationProductListItem(
//               catalogDynamicCardContent: viewModel.catalogDynamicCardContent,
//               migrationCardNumber: index + 1,
//               elevation: 0,
//               width: size.width >= 1280 && size.width < 1440
//                   ? ((constraints.maxWidth - (38 * 2)) / 3) >
//                           ProductCard.cardWidth
//                       ? ProductCard.cardWidth
//                       : ((constraints.maxWidth - (38 * 2)) / 3)
//                   : ProductCard.cardWidth,
//               height: size.width >= 1280 && size.width < 1440
//                   ? ProductCard.cardHeight * 0.95
//                   : ProductCard.cardHeight,
//             );
//           }),
//         );
//       }
//       productCards.add(
//         ProductListItem(
//           product: element,
//           cardBorder: BorderSide(
//             color: AppThemeData.instance.strokeDark3,
//           ),
//         ),
//       );
//     });
//     return productCards;
//   }
// }
//
// class OldCategoryList extends StatelessWidget {
//   final List<Category> categoryList;
//   final OldProductListingScreenViewModel viewModel;
//   final DeBouncer deBouncer = DeBouncer(milliseconds: 750);
//
//   OldCategoryList({
//     required this.viewModel,
//     Key? key,
//     required this.categoryList,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: categoryList.length,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) => Obx(
//         () => GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () {
//             if (viewModel.activeCategory.value?.id != categoryList[index].id) {
//               deBouncer.throttle(
//                 () async =>
//                     await viewModel.onCategoryClick(categoryList[index]),
//               );
//               OldProductListingScreenEventManager.instance
//                   .trackCategorySelectionEvent(
//                       categorySelected: categoryList[index].displayName);
//             }
//           },
//           child: ClickHandler(
//             mouseCursor: SystemMouseCursors.click,
//             child: OldCategoryListItem(
//               category: categoryList[index],
//               isSelected:
//                   categoryList[index].id == viewModel.activeCategory.value?.id,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OldFilterCategoryWidget extends StatelessWidget {
//   final OldProductListingScreenViewModel viewModel;
//   final double filterHorizontalGap;
//   final ScrollPhysics? scrollPhysics;
//   final bool shouldExpand;
//
//   OldFilterCategoryWidget({
//     Key? key,
//     required this.viewModel,
//     this.filterHorizontalGap = 40,
//     this.scrollPhysics,
//     this.shouldExpand = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => SizedBox(
//         height: 38,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ClickHandler(
//               onTap: () async {
//                 if (viewModel.activeDealsCategoryId.value !=
//                     OldProductListingScreenViewModel.allDealsCategoriesId) {
//                   deBouncer.throttle(
//                     () async => await viewModel
//                         .onCategoryClick(viewModel.activeCategory.value!),
//                   );
//                 }
//               },
//               child: OldFilterCategoryItemWidget(
//                   filterDisplayName: CatalogStrings.allProducts,
//                   isSelected: viewModel.activeDealsCategoryId.value ==
//                       OldProductListingScreenViewModel.allDealsCategoriesId),
//             ),
//             if (viewModel.dealCategoryList.isNotEmpty)
//               SizedBox(
//                 width: filterHorizontalGap,
//               ),
//             shouldExpand
//                 ? Expanded(
//                     child: _filterList,
//                   )
//                 : _filterList,
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget get _filterList => ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: viewModel.dealCategoryList.length,
//         shrinkWrap: true,
//         physics: scrollPhysics,
//         itemBuilder: (context, index) {
//           return ClickHandler(
//             onTap: () async {
//               if (viewModel.activeDealsCategoryId.value !=
//                   viewModel.dealCategoryList[index].tag) {}
//             },
//             child: OldFilterCategoryItemWidget(
//                 filterDisplayName:
//                     viewModel.dealCategoryList[index].displayName,
//                 isSelected: viewModel.activeDealsCategoryId.value ==
//                     viewModel.dealCategoryList[index].tag),
//           );
//         },
//         separatorBuilder: (context, index) =>
//             SizedBox(width: filterHorizontalGap),
//       );
// }
