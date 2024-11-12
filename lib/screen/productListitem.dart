//
// Created by bhavyadeeppurswani on 20/07/22.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import 'imagemodel.dart';

class ProductListItem extends StatefulWidget {
  final Product product;
  final double elevation;
  final VoidCallback? onCardTap;
  final BorderSide? cardBorder;

  const ProductListItem({
    Key? key,
    required this.product,
    this.elevation = 0,
    this.onCardTap,
    this.cardBorder,
  }) : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  static const double zoomInFactor = 1.05,
      zoomOutFactor = 0.90,
      defaultScale = 1;
  double scale = defaultScale;

  @override
  Widget build(BuildContext context) {
    // Handle behaviour of ComingSoon product cards
    return ProductCard(
      product: widget.product,
      elevation: widget.elevation,
      cardBorder: widget.cardBorder,
    );
  }
  // Normal Product Cards with Hover Effect
}

class ProductCard extends StatelessWidget {
  static const double cardWidth = 316;
  static const double cardHeight = 222;
  static const double cardAspectRatio = cardHeight / cardWidth;
  final Product product;
  final double elevation;
  final BorderSide? cardBorder;

  const ProductCard({
    required this.product,
    this.elevation = 0,
    this.cardBorder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: _getDesiredWidth(size, constraints),
            height: _getDesiredHeight(size, constraints),
            child: Card(
              borderOnForeground: cardBorder != null,
              shape: RoundedRectangleBorder(
                side: cardBorder ?? BorderSide.none,
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              color: AppThemeData.instance.backgroundLight1,
              shadowColor: AppThemeData.instance.textDark1.withOpacity(0.5),
              elevation: elevation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductListItemBody(
                      product: product,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // if (product.tag.isNotEmpty)
          //   PositionedDirectional(
          //     start: 20,
          //     top: -8,
          //     child: ProductCardTag(
          //       tag: product.tag,
          //       maxWidth: size.width >= 1280 && size.width < 1440 ? 180 : 220,
          //       padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
          //     ),
          //   ),
        ],
      );
    });
  }

  double _getDesiredWidth(Size mediaSize, BoxConstraints constraints) =>
      mediaSize.width >= 1280 && mediaSize.width < 1440
          ? ((constraints.maxWidth - (38 * 2)) / 3) > cardWidth
              ? cardWidth
              : ((constraints.maxWidth - (38 * 2)) / 3)
          : cardWidth;

  double _getDesiredHeight(Size mediaSize, BoxConstraints constraints) =>
      mediaSize.width >= 1280 && mediaSize.width < 1440
          ? cardHeight * 0.95
          : cardHeight;
}

class Product {
  final String tag;
  final String name;
  final String? iconuri;
  final String? price;
  final String? rating;
  final String? reviews;
  final String? description;

  Product({
    required this.tag,
    required this.name,
    this.iconuri,
    this.price,
    this.rating,
    this.reviews,
    this.description,
  });
}

class ProductListItemBody extends StatelessWidget {
  final Product product;

  const ProductListItemBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 15, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppThemeData.instance.backgroundLight3,
                ),
                clipBehavior: Clip.antiAlias,
                child: Center(
                  child: ImageWidget(
                    imageModel: ImageModel(
                      imageLocation: product.iconuri ?? '',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Text(
              'brief description of the product',
              style: TextStyle(
                height: 1.28,
                color: AppThemeData.instance.textDark2,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //   Text(
          //     product.variants.isNotEmpty
          //         ? '${CatalogStrings.soldBy} ${product.variants.first.resellerTitle}'
          //         : '',
          //     style: ResponsiveTextStyle.getTinyStyle(
          //       fontColor: AppThemeData.instance.textDark3,
          //     ),
          //     overflow: TextOverflow.ellipsis,
          //     maxLines: 1,
          //   ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final Category? category;
  final String? activeDealsFilter;

  const ProductList({
    Key? key,
    this.category,
    this.activeDealsFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            spacing: 37,
            runSpacing: 46,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: _getProductCards(),
          ),
          const SizedBox(
            height: 36,
          )
        ]);
  }

  List<Widget> _getProductCards() {
    List<Widget> productCards = [
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
      ProductListItem(
        product: Product(
            tag: 'xyz',
            name: 'Microsoft 365',
            iconuri:
                'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
      ),
    ];

    for (int i = 0; i < 30; i++) {
      productCards.add(
        ProductListItem(
          product: Product(
              tag: 'xyz',
              name: 'Test product',
              iconuri:
                  'https://saleoruatarise.blob.core.windows.net/saleor/thumbnails/products/1486565573-microsoft-office_81557_da875b71_thumbnail_4096.png'),
        ),
      );
    }

    return productCards;
  }
}
