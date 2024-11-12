// //
// // Created by bhavyadeeppurswani on 20/07/22.
// //
//
//
// import 'package:flutter/material.dart';
//
// import '../app_theme.dart';
// import 'catalog_widget.dart';
//
// class OldProductListingScreenDesktopLayout extends StatelessWidget {
//   final OldProductListingScreenViewModel viewModel;
//   final ListCategoriesResponse listCategoryResponse;
//
//   const OldProductListingScreenDesktopLayout({
//     required this.viewModel,
//     Key? key,
//     required this.listCategoryResponse,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context);
//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (viewModel.skipPagination) return true;
//         viewModel.onPageScrolled(
//           scrollNotification,
//           PrimaryScrollController.of(context),
//         );
//         return false;
//       },
//       child: SingleChildScrollView(
//         primary: true,
//         child: Column(
//           children: [
//               Container(
//                 height: 1,
//                 decoration:
//                 BoxDecoration(color: AppThemeData.instance.strokeDark3),
//               )
//             ],
//             Stack(
//               fit: StackFit.passthrough,
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: (BannerWidget.bannerAspectRatio *
//                           (mediaQuery.size.width -
//                               BannerWidget.bannerOldHorizontalPadding)) +
//                           BannerWidget.bannerTotalVerticalSpacing,
//                     ),
//                     ConstrainedBox(
//                       constraints: BoxConstraints(
//                           minHeight: MediaQuery.of(context).size.height -
//                               DesktopAppBar.appBarHeight),
//                       child: OldCatalogWidget(
//                         viewModel: viewModel,
//                         listCategoryResponse: listCategoryResponse,
//                       ),
//                     ),
//                   ],
//                 ),
//                 BannerWidget(
//                   totalHorizontalPadding:
//                   BannerWidget.bannerOldHorizontalPadding,
//                   totalScreenWidth: MediaQuery.of(context).size.width,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class BannerWidget extends StatelessWidget {
//   static const bannerAspectRatio = 300 / 1302;
//   static const bannerTopPadding = 55.0;
//   static const bannerBottomPadding = 34.0;
//   static const bannerOldHorizontalPadding = 132.0;
//   static const bannerNewHorizontalPadding = 200.0;
//   static const bannerIndicatorHeight = 8.0;
//   static const bannerIndicatorSpacing = 26.0;
//   static const autoPlayDuration = Duration(seconds: 5);
//
//   static double get bannerTotalVerticalSpacing =>
//       bannerTopPadding +
//           bannerBottomPadding +
//           bannerIndicatorHeight +
//           bannerIndicatorSpacing;
//
//
//   final carouselController = CarouselController();
//   final RxInt activeIndex = 0.obs;
//   final double elevation;
//   final Color? backgroundColor;
//   final double totalHorizontalPadding;
//   final double totalScreenWidth;
//   final bool maintainIndicatorSpaceIfNoCarousel;
//
//   BannerWidget({
//     Key? key,
//     this.elevation = 10.0,
//     this.backgroundColor,
//     required this.totalHorizontalPadding,
//     required this.totalScreenWidth,
//     this.maintainIndicatorSpaceIfNoCarousel = true,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // NOTE: Added here deliberately so that the view gets updated when the
//     // screen is resized
//     MediaQuery.of(context);
//     return Card(
//       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//       margin: const EdgeInsetsDirectional.all(0),
//       elevation: elevation,
//       shadowColor: AppThemeData.instance.shadowColor,
//       color: backgroundColor,
//       child: Padding(
//         padding: const EdgeInsetsDirectional.only(
//           top: bannerTopPadding,
//           bottom: bannerBottomPadding,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // CarouselSlider.builder(
//             //   itemCount: homeScreenBanners.length,
//             //   //carouselController: carouselController,
//             //   itemBuilder: _getBannerItem,
//             //   options: CarouselOptions(
//             //     height: bannerAspectRatio *
//             //         (totalScreenWidth - totalHorizontalPadding),
//             //     aspectRatio: bannerAspectRatio,
//             //     autoPlay: true,
//             //     pauseAutoPlayOnManualNavigate: true,
//             //     autoPlayCurve: Curves.easeOutQuint,
//             //     padEnds: true,
//             //     enableInfiniteScroll: homeScreenBanners.length > 1,
//             //     autoPlayInterval: autoPlayDuration,
//             //     viewportFraction: 1,
//             //     onPageChanged: (index, reason) {
//             //       activeIndex.value = index;
//             //     },
//             //   ),
//             //),
//             const SizedBox(height: bannerIndicatorSpacing),
//             Visibility(
//               visible: homeScreenBanners.length > 1,
//               maintainSize: maintainIndicatorSpaceIfNoCarousel,
//               maintainAnimation: maintainIndicatorSpaceIfNoCarousel,
//               maintainState: maintainIndicatorSpaceIfNoCarousel,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClickHandler(
//                     onTap: () {
//                       //carouselController.previousPage();
//                     },
//                     child: ImageWidget(
//                       imageModel: ImageModel(
//                         imageLocation: ConfigIcons.bannerIndicatorLeft,
//                         width: 33,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   // Obx(
//                   //       () => AnimatedSmoothIndicator(
//                   //     activeIndex: activeIndex.value,
//                   //     count: homeScreenBanners.length,
//                   //     effect: JumpingDotEffect(
//                   //       dotWidth: 68,
//                   //       dotHeight: bannerIndicatorHeight,
//                   //       spacing: 18,
//                   //       dotColor: AppThemeData.instance.neutralColor,
//                   //       activeDotColor: AppThemeData.instance.primaryColor,
//                   //     ),
//                   //     onDotClicked: (index) {
//                   //       //carouselController.animateToPage(index);
//                   //     },
//                   //   ),
//                   // ),
//                   const SizedBox(width: 12),
//                   ClickHandler(
//                     onTap: () {
//                       //carouselController.nextPage();
//                     },
//                     child: ImageWidget(
//                       imageModel: ImageModel(
//                         imageLocation: ConfigIcons.bannerIndicatorRight,
//                         width: 33,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _getBannerItem(BuildContext context, int index, int realIndex) {
//     return ClickHandler(
//       mouseCursor: homeScreenBanners[index].redirectionUri.isNotEmpty
//           ? SystemMouseCursors.click
//           : MouseCursor.defer,
//       onTap: () {
//         if (homeScreenBanners[index].redirectionUri.isNotEmpty) {
//          // AppNavigator.pushPath(homeScreenBanners[index].redirectionUri);
//         }
//       },
//       child: ImageWidget(
//         imageModel: ImageModel(
//           boxFit: BoxFit.fitWidth,
//           imageLocation: homeScreenBanners[index].imageUri,
//           errorWidgetBuilder:
//           ImageErrorWidgetBuilders.darkGreyBackgroundWithLogo(
//             logoHeight: 148,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class ClickHandler extends StatelessWidget {
//   final Widget child;
//   final GestureTapCallback? onTap;
//   final GestureTapDownCallback? onTapDown;
//   final GestureTapUpCallback? onTapUp;
//   final GestureTapCallback? onTapCancel;
//   final GestureTapCallback? onDoubleTap;
//   final GestureLongPressCallback? onLongPress;
//   final GestureTapCallback? onSecondaryTap;
//   final GestureTapDownCallback? onSecondaryTapDown;
//   final GestureTapUpCallback? onSecondaryTapUp;
//   final GestureTapCallback? onSecondaryTapCancel;
//   final ValueChanged<bool>? onHighlightChanged;
//   final ValueChanged<bool>? onHover;
//   final MouseCursor? mouseCursor;
//   final double? radius;
//   final BorderRadius? borderRadius;
//   final ShapeBorder? customBorder;
//   final Color? focusColor;
//   final Color? hoverColor;
//   final Color? highlightColor;
//   final MaterialStateProperty<Color?>? overlayColor;
//   final Color? splashColor;
//   final InteractiveInkFeatureFactory? splashFactory;
//   final bool enableFeedback;
//   final bool excludeFromSemantics;
//   final ValueChanged<bool>? onFocusChange;
//   final bool autofocus;
//   final FocusNode? focusNode;
//   final bool canRequestFocus;
//   RectCallback? getRectCallback(RenderBox referenceBox) => null;
//   final MaterialStatesController? statesController;
//
//   const ClickHandler({
//     required this.child,
//     this.onTap,
//     this.onDoubleTap,
//     this.onLongPress,
//     this.onTapDown,
//     this.onTapUp,
//     this.onTapCancel,
//     this.onSecondaryTap,
//     this.onSecondaryTapUp,
//     this.onSecondaryTapDown,
//     this.onSecondaryTapCancel,
//     this.onHighlightChanged,
//     this.onHover,
//     this.mouseCursor,
//     this.focusColor,
//     this.hoverColor,
//     this.highlightColor,
//     this.overlayColor,
//     this.splashColor,
//     this.splashFactory,
//     this.radius,
//     this.borderRadius,
//     this.customBorder,
//     this.enableFeedback = true,
//     this.excludeFromSemantics = false,
//     this.focusNode,
//     this.canRequestFocus = true,
//     this.onFocusChange,
//     this.autofocus = false,
//     this.statesController,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       onDoubleTap: onDoubleTap,
//       onLongPress: onLongPress,
//       onTapDown: onTapDown,
//       onTapUp: onTapUp,
//       onTapCancel: onTapCancel,
//       onSecondaryTap: onSecondaryTap,
//       onSecondaryTapUp: onSecondaryTapUp,
//       onSecondaryTapDown: onSecondaryTapDown,
//       onSecondaryTapCancel: onSecondaryTapCancel,
//       onHighlightChanged: onHighlightChanged,
//       onHover: onHover,
//       mouseCursor: mouseCursor ?? _defaultCursor,
//       focusColor: focusColor,
//       hoverColor: hoverColor ?? Colors.transparent,
//       highlightColor: highlightColor ?? Colors.transparent,
//       overlayColor: overlayColor,
//       splashColor: splashColor ?? Colors.transparent,
//       splashFactory: splashFactory,
//       radius: radius,
//       borderRadius: borderRadius,
//       customBorder: customBorder,
//       enableFeedback: enableFeedback,
//       excludeFromSemantics: excludeFromSemantics,
//       focusNode: focusNode,
//       canRequestFocus: canRequestFocus,
//       onFocusChange: onFocusChange,
//       autofocus: autofocus,
//       statesController: statesController,
//       // TODO: Revert this after upgrading to Flutter v3.13.6
//       // child: child,
//       child: SelectionContainer.disabled(
//         child: child,
//       ),
//     );
//   }
//
//   MouseCursor? get _defaultCursor =>
//       isClickable ? SystemMouseCursors.click : null;
//
//   bool get isClickable =>
//       onTap != null ||
//           onDoubleTap != null ||
//           onSecondaryTap != null ||
//           onLongPress != null;
// }
//
