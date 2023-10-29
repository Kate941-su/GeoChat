/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/logo_geochat.png
  AssetGenImage get logoGeochat =>
      const AssetGenImage('assets/icons/logo_geochat.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoGeochat];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_logo.png
  AssetGenImage get appleLogo =>
      const AssetGenImage('assets/images/apple_logo.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/google_logo.png');

  /// File path: assets/images/logo_geochat.png
  AssetGenImage get logoGeochat =>
      const AssetGenImage('assets/images/logo_geochat.png');

  /// File path: assets/images/onlineIcon.png
  AssetGenImage get onlineIcon =>
      const AssetGenImage('assets/images/onlineIcon.png');

  /// File path: assets/images/place_holder.png
  AssetGenImage get placeHolder =>
      const AssetGenImage('assets/images/place_holder.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleLogo,
        avatar,
        googleLogo,
        logoGeochat,
        onlineIcon,
        placeHolder,
        splash
      ];
}

class $AssetsMockGen {
  const $AssetsMockGen();

  $AssetsMockJsonGen get json => const $AssetsMockJsonGen();
}

class $AssetsMockJsonGen {
  const $AssetsMockJsonGen();

  /// File path: assets/mock/json/messages.json
  String get messages => 'assets/mock/json/messages.json';

  /// List of all assets
  List<String> get values => [messages];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMockGen mock = $AssetsMockGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
