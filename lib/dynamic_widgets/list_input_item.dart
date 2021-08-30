import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/list_input_item.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class ListInputItemHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ListInputItem';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
      required BuildContext buildContext,
      Function(EventInfo value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var inputItem = widget as ListInputItem?;
    if (inputItem == null) return null;
    return {
      'widget': widgetName,
      'xVar': {
        'title': inputItem.title,
        'icon': inputItem.icon,
        'customTitle': DynamicWidgetBuilder.transformMap(
            inputItem.customTitle, buildContext),
        'text': inputItem.text,
        'placeholder': inputItem.placeholder,
        'rightWidget': DynamicWidgetBuilder.transformMap(
            inputItem.rightWidget, buildContext),
        'obscureText': inputItem.obscureText,
        'iconTitlePadding': inputItem.iconTitlePadding,
        'dividerLeftPadding': inputItem.dividerLeftPadding,
        'dividerRightPadding': inputItem.dividerRightPadding,
        'texFieldLeftPadding': inputItem.texFieldLeftPadding,
        'textFieldAlign':
            DynamicWidgetUtils.transform(inputItem.textFieldAlign),
        'textFieldStyle':
            DynamicWidgetUtils.transform(inputItem.textFieldStyle),
        'hintStyle': DynamicWidgetUtils.transform(inputItem.hintStyle),
        'keyboardType': DynamicWidgetUtils.transform(inputItem.keyboardType),
        'maxLength': inputItem.maxLength,
        'autofocus': inputItem.autofocus,
        'titleStyle': DynamicWidgetUtils.transform(inputItem.titleStyle),
        'isHideDivider': inputItem.isHideDivider,
        'divider':
            DynamicWidgetBuilder.transformMap(inputItem.divider, buildContext),
        'enable': DynamicWidgetUtils.transform(inputItem.enable),
      },
      'xKey': inputItem.key.toString()
    };
  }

  @override
  Type get widgetType => ListInputItem;
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
  TextConfig? props;
  FocusNode _node = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = TextConfig.fromJson(widget.config?.xVar ?? {});
    }
    return ListInputItem(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      title: props?.title,
      icon: props?.icon,
      customTitle: DynamicWidgetBuilder.buildWidget(
          props?.customTitle != null
              ? DynamicWidgetConfig.fromJson(props!.customTitle!)
              : null,
          context: context,
          event: widget.event),
      text: props?.text,
      placeholder: props?.placeholder,
      rightWidget: DynamicWidgetBuilder.buildWidget(
          props?.rightWidget != null
              ? DynamicWidgetConfig.fromJson(props!.rightWidget!)
              : null,
          context: context,
          event: widget.event),
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
      obscureText: props?.obscureText ?? false,
      iconTitlePadding: props?.iconTitlePadding ?? 20.0,
      dividerLeftPadding: props?.dividerLeftPadding ?? 10.0,
      dividerRightPadding: props?.dividerRightPadding ?? 10.0,
      texFieldLeftPadding: props?.texFieldLeftPadding ?? 15.0,
      textFieldAlign: props?.textFieldAlign ?? TextAlign.left,
      textFieldStyle: props?.textFieldStyle,
      hintStyle: props?.hintStyle,
      keyboardType: props?.keyboardType,
      maxLength: props?.maxLength,
      autofocus: props?.autofocus ?? false,
      titleStyle: props?.titleStyle,
      focusNode: _node,
      onEditingComplete: () {
        _node.unfocus();
      },
      isHideDivider: props?.isHideDivider ?? false,
      divider: DynamicWidgetBuilder.buildWidget(
          props?.divider != null
              ? DynamicWidgetConfig.fromJson(props!.divider!)
              : null,
          context: context) as Divider?,
      enable: props?.enable,
    );
  }
}

class TextConfig {
  late String? title;
  late String? icon;
  late Map? customTitle;
  late String? text;
  late String? placeholder;
  late Map? rightWidget;
  late bool? obscureText;
  late double? iconTitlePadding;
  late double? dividerLeftPadding;
  late double? dividerRightPadding;
  late double? texFieldLeftPadding;
  late TextAlign? textFieldAlign;
  late TextStyle? textFieldStyle;
  late TextStyle? hintStyle;
  late TextInputType? keyboardType;
  late int? maxLength;
  late bool? autofocus;
  late TextStyle? titleStyle;
  late bool? isHideDivider;
  late Map? divider;
  late bool? enable;

  TextConfig.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    customTitle = json['customTitle'];
    text = json['text'];
    placeholder = json['placeholder'];
    rightWidget = json['rightWidget'];
    obscureText = json['obscureText'];
    iconTitlePadding = json['iconTitlePadding'];
    dividerLeftPadding = json['dividerLeftPadding'];
    dividerRightPadding = json['dividerRightPadding'];
    texFieldLeftPadding = json['texFieldLeftPadding'];
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
    isHideDivider = json['isHideDivider'];
    divider = json['divider'];
    enable = json['enable'];
  }
}
