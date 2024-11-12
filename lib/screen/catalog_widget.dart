// //
// // Created by bhavyadeeppurswani on 20/07/22.
// //
//
// import 'package:flutter/material.dart';
//
// import 'catogary.dart';
//
// class OldCatalogWidget extends StatelessWidget {
//   final OldProductListingScreenViewModel viewModel;
//   final ListCategoriesResponse listCategoryResponse;
//
//   const OldCatalogWidget({
//     required this.viewModel,
//     Key? key,
//     required this.listCategoryResponse,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     viewModel.listingWidgetKey = GlobalKey();
//     return Row(
//       key: viewModel.listingWidgetKey,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             OldCategoriesWidget(
//               listCategoryResponse: listCategoryResponse,
//               viewModel: viewModel,
//             ),
//             //NOTE: Uncomment in future if required
//             // const SizedBox(
//             //   height: 16,
//             // ),
//             // const OldUserNudgeCard()
//           ],
//         ),
//         Expanded(
//           child: OldProductsWidget(
//             viewModel: viewModel,
//           ),
//         ),
//       ],
//     );
//   }
// }
