import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/handler.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/utils.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/widget.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

class CachedNetworkImageHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CachedNetworkImage';

  @override
  Type get widgetType => CachedNetworkImage;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as CachedNetworkImage?;
    if (realWidget == null) return null;
    return CachedNetworkImageConfig.toJson(realWidget, widgetName, buildContext);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  CachedNetworkImageConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = CachedNetworkImageConfig.fromJson(widget.config?.xVar ?? {});
    }
    var placeholder = props?.placeholder;
    var progressIndicatorBuilder = props?.progressIndicatorBuilder;
    var errorWidget = props?.errorWidget;
    return CachedNetworkImage(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      imageUrl: props?.imageUrl ?? '',
      httpHeaders: props?.httpHeaders,
      placeholder: placeholder != null ? ((context, url) =>
          Image.asset(placeholder)) : null,
      progressIndicatorBuilder: progressIndicatorBuilder != null ? ((context,
          url, downloadProgress) =>
          LinearProgressIndicator(value: downloadProgress.progress)) : null,
      errorWidget: errorWidget != null ? ((context, url, error) =>
          Image.asset(errorWidget)) : null,
      fadeOutDuration: props?.fadeOutDuration ??
          const Duration(milliseconds: 1000),
      fadeOutCurve: props?.fadeOutCurve ?? Curves.easeOut,
      fadeInDuration: props?.fadeInDuration ??
          const Duration(milliseconds: 500),
      fadeInCurve: props?.fadeInCurve ?? Curves.easeIn,
      width: props?.width,
      height: props?.height,
      fit: props?.fit,
      alignment: props?.alignment ?? Alignment.center,
      repeat: props?.repeat ?? ImageRepeat.noRepeat,
      matchTextDirection: props?.matchTextDirection ?? false,
      useOldImageOnUrlChange: props?.useOldImageOnUrlChange ?? false,
      color: props?.color,
      filterQuality: props?.filterQuality ?? FilterQuality.low,
      colorBlendMode: props?.colorBlendMode,
      placeholderFadeInDuration: props?.placeholderFadeInDuration,
      memCacheWidth: props?.memCacheWidth,
      memCacheHeight: props?.memCacheHeight,
      cacheKey: props?.cacheKey,
      maxWidthDiskCache: props?.maxWidthDiskCache,
      maxHeightDiskCache: props?.maxHeightDiskCache,
    );
  }
}

class CachedNetworkImageConfig {
  late String? imageUrl;
  late Map<String, String>? httpHeaders;

  //late ImageWidgetBuilder? imageBuilder;
  late String? placeholder;
  late String? progressIndicatorBuilder;
  late String? errorWidget;
  late Duration? fadeOutDuration;
  late Curve? fadeOutCurve;
  late Duration? fadeInDuration;
  late Curve? fadeInCurve;
  late double? width;
  late double? height;
  late BoxFit? fit;
  late Alignment? alignment;
  late ImageRepeat? repeat;
  late bool? matchTextDirection;

  //late BaseCacheManager? cacheManager;
  late bool? useOldImageOnUrlChange;
  late Color? color;
  late FilterQuality? filterQuality;
  late BlendMode? colorBlendMode;
  late Duration? placeholderFadeInDuration;
  late int? memCacheWidth;
  late int? memCacheHeight;
  late String? cacheKey;
  late int? maxWidthDiskCache;
  late int? maxHeightDiskCache;

  CachedNetworkImageConfig.fromJson(Map<dynamic, dynamic> json) {
    imageUrl = json['imageUrl'];
    httpHeaders = json['padding'];
    placeholder = json['placeholder'];
    progressIndicatorBuilder = json['progressIndicatorBuilder'];
    errorWidget = json['errorWidget'];
    fadeOutDuration =
        DynamicWidgetUtils.adapt<Duration>(json['fadeOutDuration']);
    fadeOutCurve = DynamicWidgetUtils.adapt<Curve>(json['fadeOutCurve']);
    fadeInDuration = DynamicWidgetUtils.adapt<Duration>(json['fadeInDuration']);
    fadeInCurve = DynamicWidgetUtils.adapt<Curve>(json['fadeInCurve']);
    width = json['width']?.toDouble();
    height = json['height']?.toDouble();
    fit = DynamicWidgetUtils.adapt<BoxFit>(json['fit']);
    alignment = DynamicWidgetUtils.adapt<Alignment>(json['alignment']);
    repeat = DynamicWidgetUtils.adapt<ImageRepeat>(json['repeat']);
    matchTextDirection = json['matchTextDirection'];
    useOldImageOnUrlChange = json['useOldImageOnUrlChange'];
    color = DynamicWidgetUtils.adapt<Color>(json['color']);
    filterQuality =
        DynamicWidgetUtils.adapt<FilterQuality>(json['filterQuality']);
    colorBlendMode =
        DynamicWidgetUtils.adapt<BlendMode>(json['colorBlendMode']);
    placeholderFadeInDuration =
        DynamicWidgetUtils.adapt<Duration>(json['placeholderFadeInDuration']);
    memCacheWidth = json['memCacheWidth'];
    memCacheHeight = json['memCacheHeight'];
    cacheKey = json['cacheKey'];
    maxWidthDiskCache = json['maxWidthDiskCache'];
    maxHeightDiskCache = json['maxHeightDiskCache'];
  }

  static Map? toJson(CachedNetworkImage widget, String widgetName,
      BuildContext? buildContext) {
    return {
      'widget': widgetName,
      'xVar': {
        'imageUrl': widget.imageUrl,
        'httpHeaders': widget.httpHeaders,
        //'placeholder': widget.placeholder,
        //'progressIndicatorBuilder': widget.progressIndicatorBuilder,
        //'errorWidget': widget.errorWidget,
        'fadeOutDuration': DynamicWidgetUtils.transform(
            widget.fadeOutDuration),
        'fadeOutCurve': DynamicWidgetUtils.transform(
            widget.fadeOutCurve),
        'fadeInDuration': DynamicWidgetUtils.transform(
            widget.fadeInDuration),
        'fadeInCurve': DynamicWidgetUtils.transform(
            widget.fadeInCurve),
        'width': widget.width,
        'height': widget.height,
        'fit': DynamicWidgetUtils.transform(
            widget.fit),
        'alignment': DynamicWidgetUtils.transform(
            widget.alignment),
        'repeat': DynamicWidgetUtils.transform(
            widget.repeat),
        'matchTextDirection': widget.matchTextDirection,
        'useOldImageOnUrlChange': widget.useOldImageOnUrlChange,
        'color': DynamicWidgetUtils.transform(
            widget.color),
        'filterQuality': DynamicWidgetUtils.transform(
            widget.filterQuality),
        'colorBlendMode': DynamicWidgetUtils.transform(
            widget.colorBlendMode),
        'placeholderFadeInDuration': DynamicWidgetUtils.transform(
            widget.placeholderFadeInDuration),
        'memCacheWidth': widget.memCacheWidth,
        'memCacheHeight': widget.memCacheHeight,
        'cacheKey': widget.cacheKey,
        'maxWidthDiskCache': widget.maxWidthDiskCache,
        'maxHeightDiskCache': widget.maxHeightDiskCache,
      },
      'xKey': widget.key.toString()
    };
  }
}
