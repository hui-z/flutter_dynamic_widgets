import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class RichTextHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'RichText';

  @override
  Type get widgetType => RichText;

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
  late TextSpan? text;
  late TextAlign? textAlign;
  late TextDirection? textDirection;
  late bool? softWrap;
  late TextOverflow? overflow;
  late double? textScaleFactor;
  late int? maxLines;

  // late Locale? locale;
  late StrutStyle? strutStyle;

  // late TextWidthBasis? textWidthBasis;
  // late ui.TextHeightBehavior? textHeightBehavior;

  Config.fromJson(Map<dynamic, dynamic> json) {
    text = DynamicWidgetUtils.adapt<TextSpan>(json['text']);
    textAlign = DynamicWidgetUtils.adapt<TextAlign>(json['textAlign']);
    textDirection =
        DynamicWidgetUtils.adapt<TextDirection>(json['textDirection']);
    softWrap = json['softWrap'];
    overflow = DynamicWidgetUtils.adapt<TextOverflow>(json['overflow']);
    textScaleFactor = json['textScaleFactor']?.toDouble();
    maxLines = json['maxLines'];
    strutStyle = DynamicWidgetUtils.adapt<StrutStyle>(json['strutStyle']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return RichText(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      text: props?.text ?? TextSpan(),
      textAlign: props?.textAlign ?? TextAlign.start,
      textDirection: props?.textDirection,
      softWrap: props?.softWrap ?? true,
      overflow: props?.overflow ?? TextOverflow.clip,
      textScaleFactor: props?.textScaleFactor ?? 1.0,
      maxLines: props?.maxLines,
      strutStyle: props?.strutStyle,
    );
  }

  static Map? toJson(Widget? realWidget, String widgetName,
      BuildContext? buildContext) {
    var widget = realWidget as RichText?;
    if (widget == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'text': DynamicWidgetUtils.transform(widget.text as TextSpan),
        'textAlign': DynamicWidgetUtils.transform(widget.textAlign),
        'textDirection': DynamicWidgetUtils.transform(widget.textDirection),
        'softWrap': widget.softWrap,
        'overflow': DynamicWidgetUtils.transform(widget.overflow),
        'textScaleFactor': widget.textScaleFactor,
        'maxLines': widget.maxLines,
        'strutStyle': DynamicWidgetUtils.transform(widget.strutStyle),
      },
      'xKey': widget.key.toString()
    };
  }
}