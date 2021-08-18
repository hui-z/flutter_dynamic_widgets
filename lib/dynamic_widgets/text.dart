import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

class TextHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Text';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext, Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var text = widget as Text?;
    if (text == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'data': text.data,
        'style': DynamicWidgetUtils.transform(text.style),
        'strutStyle': DynamicWidgetUtils.transform(text.strutStyle),
        'textAlign': DynamicWidgetUtils.transform(text.textAlign),
        'textDirection': DynamicWidgetUtils.transform(text.textDirection),
        'softWrap': text.softWrap,
        'overflow': DynamicWidgetUtils.transform(text.overflow),
        'textScaleFactor': text.textScaleFactor,
        'maxLines': text.maxLines,
        'semanticsLabel': text.semanticsLabel,
        'textHeightBehavior': DynamicWidgetUtils.transform(text.textHeightBehavior),
      },
      'xKey': text.key.toString()
    };
  }

  @override
  Type get widgetType => Text;
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;
  final Function(String value)? event;

  _Builder(this.config, this.event, {Key? key}) : super(config, event, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  TextConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = TextConfig.fromJson(widget.config?.xVar ?? {});
    }
    return Text(
      props?.data ?? '',
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      style: props?.style,
      strutStyle: props?.strutStyle,
      textAlign: props?.textAlign,
      textDirection: props?.textDirection,
      softWrap: props?.softWrap,
      overflow: props?.overflow,
      textScaleFactor: props?.textScaleFactor,
      maxLines: props?.maxLines,
      semanticsLabel: props?.semanticsLabel,
      textHeightBehavior: props?.textHeightBehavior,
    );
  }
}

/// The props of Text config
class TextConfig {
  late String? data;
  late TextStyle? style;
  late StrutStyle? strutStyle;
  late TextAlign? textAlign;
  late TextDirection? textDirection;
  late bool? softWrap;
  late TextOverflow? overflow;
  late double? textScaleFactor;
  late int? maxLines;
  late String? semanticsLabel;
  late TextHeightBehavior? textHeightBehavior;

  TextConfig({
    this.data,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textHeightBehavior
  });

  TextConfig.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'];
    style = DynamicWidgetUtils.textStyleAdapter(json['style']);
    strutStyle = DynamicWidgetUtils.strutStyleAdapter(json['strutStyle']);
    textAlign = DynamicWidgetUtils.textAlignAdapter(json['textAlign']);
    textDirection = DynamicWidgetUtils.textDirectionAdapter(json['textDirection']);
    softWrap = json['softWrap'];
    overflow = DynamicWidgetUtils.textOverflowAdapter(json['overflow']);
    maxLines = json['maxLines'];
    semanticsLabel = json['semanticsLabel'];
    textHeightBehavior = DynamicWidgetUtils.textHeightBehaviorAdapter(json['textHeightBehavior']);
    textScaleFactor = json['textScaleFactor'];
  }
}