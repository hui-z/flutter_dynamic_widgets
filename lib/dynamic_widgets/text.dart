import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class TextHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Text';

  @override
  Type get widgetType => Text;

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

  Config.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'];
    style = DynamicWidgetUtils.adapt<TextStyle>(json['style']);
    strutStyle = DynamicWidgetUtils.adapt<StrutStyle>(json['strutStyle']);
    textAlign = DynamicWidgetUtils.adapt<TextAlign>(json['textAlign']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    softWrap = json['softWrap'];
    overflow = DynamicWidgetUtils.adapt<TextOverflow>(json['overflow']);
    maxLines = json['maxLines'];
    semanticsLabel = json['semanticsLabel'];
    textHeightBehavior = DynamicWidgetUtils.adapt<TextHeightBehavior>(
        json['textHeightBehavior']);
    textScaleFactor = json['textScaleFactor']?.toDouble();
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
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

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
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
        'textHeightBehavior':
        DynamicWidgetUtils.transform(text.textHeightBehavior),
      },
      'xKey': text.key.toString()
    };
  }
}
