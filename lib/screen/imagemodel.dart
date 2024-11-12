//
// Created by bhavyadeeppurswani on 19/07/22.
//
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageType { asset, network }

class ImageModel {
  final bool isSvg;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final ImageType imageType;
  final String imageLocation;
  final Color? color;
  final bool matchTextDirection;

  ImageModel({
    this.boxFit = BoxFit.contain,
    required this.imageLocation,
    this.height,
    this.width,
    this.color,
    this.matchTextDirection = false,
  })  : imageType = imageLocation.trim().startsWith('packages/')
            ? ImageType.asset
            : ImageType.network,
        isSvg = imageLocation.trim().startsWith('packages/')
            ? imageLocation.endsWith('.svg')
            : Uri.parse(imageLocation).path.endsWith('.svg');
}

class ImageWidget extends StatelessWidget {
  final ImageModel imageModel;

  const ImageWidget({
    required this.imageModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageModel.isSvg) {
      switch (imageModel.imageType) {
        case ImageType.asset:
          return SvgPicture.asset(
            imageModel.imageLocation,
            height: imageModel.height,
            width: imageModel.width,
            fit: imageModel.boxFit,
            color: imageModel.color,
            matchTextDirection: imageModel.matchTextDirection,
            key: key,
          );
        case ImageType.network:
          return SvgPicture.network(
            imageModel.imageLocation,
            height: imageModel.height,
            width: imageModel.width,
            fit: imageModel.boxFit,
            color: imageModel.color,
            matchTextDirection: imageModel.matchTextDirection,
            key: key,
          );
      }
    } else {
      switch (imageModel.imageType) {
        case ImageType.asset:
          return Image.asset(
            imageModel.imageLocation,
            height: imageModel.height,
            width: imageModel.width,
            fit: imageModel.boxFit,
            color: imageModel.color,
            matchTextDirection: imageModel.matchTextDirection,
            key: key,
          );

        case ImageType.network:
          return CachedNetworkImage(
            imageUrl: imageModel.imageLocation,
            height: imageModel.height,
            width: imageModel.width,
            fit: imageModel.boxFit,
            color: imageModel.color,
            matchTextDirection: imageModel.matchTextDirection,
            key: key,
          );
      }
    }
  }
}
