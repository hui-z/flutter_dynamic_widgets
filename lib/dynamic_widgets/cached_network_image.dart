import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/handler.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/utils.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/widget.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

import 'config/event.dart';

class CachedNetworkImageHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'CachedNetworkImage';

  @override
  Type get widgetType => CachedNetworkImage;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    return Config.toJson(widget, widgetName, buildContext);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(EventInfo value)? event;

  _Builder(this.config, this.event, {Key? key})
      : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Config.toWidget(context, widget);
  }
}

class Config {
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

  Config.fromJson(Map<dynamic, dynamic> json) {
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
    width = DynamicWidgetUtils.adaptDouble(json['width']?.toDouble());
    height = DynamicWidgetUtils.adaptDouble(json['height']?.toDouble());
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

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    var placeholder = props?.placeholder;
    var progressIndicatorBuilder = props?.progressIndicatorBuilder;
    var errorWidget = props?.errorWidget;
    return CachedNetworkImage(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      imageUrl: props?.imageUrl ?? '',
      httpHeaders: props?.httpHeaders,
      placeholder: placeholder != null
          ? ((context, url) => Image.asset(placeholder))
          : null,
      progressIndicatorBuilder: progressIndicatorBuilder != null
          ? ((context, url, downloadProgress) =>
          LinearProgressIndicator(value: downloadProgress.progress))
          : null,
      errorWidget: errorWidget != null
          ? ((context, url, error) => Image.asset(errorWidget))
          : null,
      fadeOutDuration:
      props?.fadeOutDuration ?? const Duration(milliseconds: 1000),
      fadeOutCurve: props?.fadeOutCurve ?? Curves.easeOut,
      fadeInDuration:
      props?.fadeInDuration ?? const Duration(milliseconds: 500),
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

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var realWidget = widget as CachedNetworkImage?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'imageUrl': realWidget.imageUrl,
        'httpHeaders': realWidget.httpHeaders,
        //'placeholder': widget.placeholder,
        //'progressIndicatorBuilder': widget.progressIndicatorBuilder,
        //'errorWidget': widget.errorWidget,
        'fadeOutDuration': DynamicWidgetUtils.transform(
            realWidget.fadeOutDuration),
        'fadeOutCurve': DynamicWidgetUtils.transform(realWidget.fadeOutCurve),
        'fadeInDuration': DynamicWidgetUtils.transform(
            realWidget.fadeInDuration),
        'fadeInCurve': DynamicWidgetUtils.transform(realWidget.fadeInCurve),
        'width': DynamicWidgetUtils.transform(realWidget.width),
        'height': DynamicWidgetUtils.transform(realWidget.height),
        'fit': DynamicWidgetUtils.transform(realWidget.fit),
        'alignment': DynamicWidgetUtils.transform(realWidget.alignment),
        'repeat': DynamicWidgetUtils.transform(realWidget.repeat),
        'matchTextDirection': realWidget.matchTextDirection,
        'useOldImageOnUrlChange': realWidget.useOldImageOnUrlChange,
        'color': DynamicWidgetUtils.transform(realWidget.color),
        'filterQuality': DynamicWidgetUtils.transform(realWidget.filterQuality),
        'colorBlendMode': DynamicWidgetUtils.transform(
            realWidget.colorBlendMode),
        'placeholderFadeInDuration':
        DynamicWidgetUtils.transform(realWidget.placeholderFadeInDuration),
        'memCacheWidth': realWidget.memCacheWidth,
        'memCacheHeight': realWidget.memCacheHeight,
        'cacheKey': realWidget.cacheKey,
        'maxWidthDiskCache': realWidget.maxWidthDiskCache,
        'maxHeightDiskCache': realWidget.maxHeightDiskCache,
      },
      'xKey': realWidget.key.toString()
    };
  }
}
