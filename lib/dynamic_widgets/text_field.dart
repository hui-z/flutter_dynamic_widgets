import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event.dart';
import 'config/widget_config.dart';

class TextFieldHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'TextField';

  @override
  Type get widgetType => TextField;

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
  late String? text;
  late String? placeholder;
  late bool? obscureText;
  late TextAlign? textFieldAlign;
  late TextStyle? textFieldStyle;
  late TextStyle? hintStyle;
  late TextInputType? keyboardType;
  late int? maxLength;
  late bool? autofocus;
  late TextStyle? titleStyle;
  late bool? enable;
  late EdgeInsets? contentPadding;

  Config.fromJson(Map<dynamic, dynamic> json) {
    text = json['text'];
    placeholder = json['placeholder'];
    obscureText = json['obscureText'];
    textFieldAlign =
        DynamicWidgetUtils.adapt<TextAlign>(json['textFieldAlign']);
    textFieldStyle =
        DynamicWidgetUtils.adapt<TextStyle>(json['textFieldStyle']);
    hintStyle = DynamicWidgetUtils.adapt<TextStyle>(json['hintStyle']);
    keyboardType =
        DynamicWidgetUtils.adapt<TextInputType>(json['keyboardType']);
    maxLength = json['maxLength'];
    autofocus = json['autofocus'];
    titleStyle = DynamicWidgetUtils.adapt<TextStyle>(json['titleStyle']);
    enable = json['enable'];
    contentPadding = DynamicWidgetUtils.adapt<EdgeInsets>(json['contentPadding']);
  }

  static Widget toWidget(BuildContext context, _Builder widget) {
    Config? props;
    FocusNode _node = FocusNode();
    if (widget.config?.xVar != null) {
      props = Config.fromJson(widget.config?.xVar ?? {});
    }
    return TextField(
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        autofocus: props?.autofocus ?? false,
        keyboardType: props?.keyboardType,
        focusNode: _node,
        maxLength: props?.maxLength,
        decoration: InputDecoration(
            hintText: props?.placeholder,
            counterText: '',
            contentPadding: props?.contentPadding,
            hintStyle: props?.hintStyle,
            border: InputBorder.none),
        obscureText: props?.obscureText ?? false,
        onChanged: (text) {
          var eventInfo = widget.config?.events.firstWhere(
                  (element) => element.type == EventType.onTextChanged,
              orElse: () => EventInfo(type: '', action: ''));
          if (eventInfo?.type != null &&
              eventInfo?.type != '' &&
              widget.event != null) {
            eventInfo?.operateData = text;
            widget.event!(eventInfo!);
          }
        },
        enabled: props?.enable ?? true,
        onEditingComplete: () {
          _node.unfocus();
        },
        textAlign: props?.textFieldAlign ?? TextAlign.start,
        style: props?.textFieldStyle);
  }

  static Map? toJson(Widget? widget, String widgetName,
      BuildContext? buildContext) {
    var inputItem = widget as TextField?;
    if (inputItem == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'text': inputItem.controller?.text,
        'placeholder': inputItem.decoration?.hintText,
        'obscureText': inputItem.obscureText,
        'textFieldAlign':
        DynamicWidgetUtils.transform(inputItem.textAlign),
        'textFieldStyle':
        DynamicWidgetUtils.transform(inputItem.style),
        'hintStyle': DynamicWidgetUtils.transform(inputItem.decoration?.hintStyle),
        'keyboardType': DynamicWidgetUtils.transform(inputItem.keyboardType),
        'maxLength': inputItem.maxLength,
        'autofocus': inputItem.autofocus,
        'enable': DynamicWidgetUtils.transform(inputItem.enabled),
        'contentPadding': DynamicWidgetUtils.transform(inputItem.decoration?.contentPadding as EdgeInsets?),
      },
      'xKey': inputItem.key.toString()
    };
  }
}