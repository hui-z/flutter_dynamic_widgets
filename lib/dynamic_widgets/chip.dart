import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/event_name.dart';
import 'config/widget_config.dart';

class ChipHandler extends DynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Chip';

  @override
  Type get widgetType => Chip;

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key,
        required BuildContext buildContext,
        Function(String value)? event}) {
    return _Builder(config, event, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Chip?;
    if (realWidget == null) return null;
    return {
      'widget': widgetName,
      'avatar':
      DynamicWidgetBuilder.transformMap(realWidget.avatar, buildContext),
      'label':
      DynamicWidgetBuilder.transformMap(realWidget.label, buildContext),
      'deleteIcon':
      DynamicWidgetBuilder.transformMap(realWidget.deleteIcon, buildContext),
      'xVar': {
        'labelStyle': DynamicWidgetUtils.transform(realWidget.labelStyle),
        'labelPadding': DynamicWidgetUtils.transform(realWidget.labelPadding as EdgeInsets?),
        'deleteIconColor': DynamicWidgetUtils.transform(realWidget.deleteIconColor),
        'useDeleteButtonTooltip': realWidget.useDeleteButtonTooltip,
        'deleteButtonTooltipMessage': realWidget.deleteButtonTooltipMessage,
        'side': DynamicWidgetUtils.transform(realWidget.side),
        'clipBehavior': DynamicWidgetUtils.transform(realWidget.clipBehavior),
        'autofocus': realWidget.autofocus,
        'backgroundColor': DynamicWidgetUtils.transform(realWidget.backgroundColor),
        'padding': DynamicWidgetUtils.transform(realWidget.padding as EdgeInsets?),
      },
      'xKey': realWidget.key.toString()
    };
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
  ChipConfig? props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = ChipConfig.fromJson(widget.config?.xVar ?? {});
    }
    var onDeleted = widget.config?.eventNames?.contains(EventName.onDeleted) ==
        true
        ? () {
      if (widget.event != null) {
        widget.event!(widget.config?.eventNames?.firstWhere(
                (element) => element.contains(EventName.onDeleted)) ??
            '');
      }
    } : null;

    return Chip(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      avatar: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(props?.avatar ?? {}), context: context,
          event: widget.event) ?? SizedBox(),
      label: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(props?.label ?? {}), context: context,
          event: widget.event) ?? SizedBox(),
      labelStyle: props?.labelStyle,
      labelPadding: props?.labelPadding,
      deleteIcon: DynamicWidgetBuilder.buildWidget(
          DynamicWidgetConfig.fromJson(props?.deleteIcon ?? {}),
          context: context,
          event: widget.event) ?? SizedBox(),
      onDeleted:onDeleted,
      deleteIconColor: props?.deleteIconColor,
      useDeleteButtonTooltip: props?.useDeleteButtonTooltip??true,
      deleteButtonTooltipMessage: props?.deleteButtonTooltipMessage,
      side: props?.side,
      clipBehavior: props?.clipBehavior??Clip.none,
      autofocus: props?.autofocus??false,
      backgroundColor: props?.backgroundColor,
      padding: props?.padding,
    );
  }
}

class ChipConfig {
  late Map? avatar;//左侧的图标
  late Map? label;//这个是必填的参数，控件上显示的文本
  late TextStyle? labelStyle;
  late EdgeInsets? labelPadding;
  late Map? deleteIcon;//右侧的删除图标
  // late VoidCallback? onDeleted;//删除图标的点击事件，如果不写该方法的话，deleteIcon显示不出来
  late Color? deleteIconColor;
  late bool? useDeleteButtonTooltip;
  late String? deleteButtonTooltipMessage;//点击删除图标后弹出的文本，类似于tooltip的效果
  late BorderSide? side;
  //late OutlinedBorder? shape;
  late Clip? clipBehavior;
  //late FocusNode? focusNode;
  late bool? autofocus;
  late Color? backgroundColor;
  late EdgeInsets? padding;
  //late VisualDensity? visualDensity;
  //late MaterialTapTargetSize? materialTapTargetSize;
  //late double? elevation;//阴影深度
  //late Color? shadowColor;//阴影颜色


  ChipConfig.fromJson(Map<dynamic, dynamic> json) {
    avatar = json['avatar'];
    label = json['label'];
    labelStyle = DynamicWidgetUtils.adapt<TextStyle>(json['labelStyle']);
    labelPadding =  DynamicWidgetUtils.adapt<EdgeInsets>(json['labelPadding']);
    deleteIcon = json['deleteIcon'];
    deleteIconColor = DynamicWidgetUtils.adapt<Color>(json['deleteIconColor']);
    useDeleteButtonTooltip = json['useDeleteButtonTooltip'];
    deleteButtonTooltipMessage = json['deleteButtonTooltipMessage'];
    side =  DynamicWidgetUtils.adapt<BorderSide>(json['side']);
    clipBehavior =  DynamicWidgetUtils.adapt<Clip>(json['clipBehavior']);
    autofocus = json['autofocus'];
    backgroundColor = DynamicWidgetUtils.adapt<Color>(json['backgroundColor']);
    padding = DynamicWidgetUtils.adapt<EdgeInsets>(json['padding']);
  }
}
