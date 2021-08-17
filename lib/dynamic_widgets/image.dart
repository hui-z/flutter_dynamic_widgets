import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class IconHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Image';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
  }
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  ImageConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ImageConfig.fromJson(widget.config?.xVar ?? {});
    }
    if (props?.type == 'network') {
      return Image.network(
          props?.src ?? '',
          key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
          semanticLabel: props?.semanticLabel,
          excludeFromSemantics: props?.excludeFromSemantics ?? false,
          scale: props?.scale ?? 0,
          width: props?.width,
          height: props?.height,
          color: props?.color,
          colorBlendMode: props?.colorBlendMode,
          fit: props?.fit,
          alignment: props?.alignment ?? Alignment.center,
          repeat: props?.repeat ?? ImageRepeat.noRepeat,
          centerSlice: props?.centerSlice,
          matchTextDirection: props?.matchTextDirection ?? false,
          gaplessPlayback: props?.gaplessPlayback ?? false,
          filterQuality: props?.filterQuality ?? FilterQuality.low
      );
    }
    else {
      return Image.asset(
          props?.src ?? '',
          key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
          semanticLabel: props?.semanticLabel,
          excludeFromSemantics: props?.excludeFromSemantics ?? false,
          scale: props?.scale,
          width: props?.width,
          height: props?.height,
          color: props?.color,
          colorBlendMode: props?.colorBlendMode,
          fit: props?.fit,
          alignment: props?.alignment ?? Alignment.center,
          repeat: props?.repeat ?? ImageRepeat.noRepeat,
          centerSlice: props?.centerSlice,
          matchTextDirection: props?.matchTextDirection ?? false,
          gaplessPlayback: props?.gaplessPlayback ?? false,
          filterQuality: props?.filterQuality ?? FilterQuality.low
      );
    }
  }
}

/// The props of Text config
class ImageConfig {
  late String? type; //网络图片或者本地图片
  late String? src;
  late String? semanticLabel;
  late bool? excludeFromSemantics;
  late double? scale;
  late double? width;
  late double? height;
  late Color? color;
  late BlendMode? colorBlendMode;
  late BoxFit? fit;
  late Alignment? alignment;
  late ImageRepeat? repeat;
  late Rect? centerSlice;
  late bool? matchTextDirection;
  late bool? gaplessPlayback;
  late FilterQuality? filterQuality;

  ImageConfig({
    this.type,
    this.src,
    this.semanticLabel,
    this.excludeFromSemantics,
    this.scale,
    this.width,
    this.height,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment,
    this.repeat,
    this.centerSlice,
    this.matchTextDirection,
    this.gaplessPlayback,
    this.filterQuality,
  });

  ImageConfig.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    src = json['src'];
    semanticLabel = json['semanticLabel'];
    excludeFromSemantics = json['excludeFromSemantics'];
    scale = json['scale']?.toDouble();
    width = json['width']?.toDouble() ;
    height = json['height']?.toDouble();
    color =  DynamicWidgetUtils.colorAdapter(json['color']);
    colorBlendMode = DynamicWidgetUtils.blendModeAdapter(json['blendMode']) ;
    fit = DynamicWidgetUtils.boxFitAdapter(json['fit']);
    alignment = (DynamicWidgetUtils.alignmentAdapter(json['alignment'])??Alignment.center) ;
    repeat = DynamicWidgetUtils.imageRepeatAdapter(json['repeat']);
    centerSlice = DynamicWidgetUtils.rectAdapter(json['centerSlice']);
    matchTextDirection = json['matchTextDirection'];
    gaplessPlayback = json['gaplessPlayback'];
    filterQuality = DynamicWidgetUtils.filterQualityAdapter(json['filterQuality']);
  }
}
