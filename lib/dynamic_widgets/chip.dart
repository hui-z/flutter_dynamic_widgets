import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
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
    var padding = realWidget.padding as EdgeInsets?;
    var margin = realWidget.margin as EdgeInsets?;
    var constraints = realWidget.constraints;
    return {
      'widget': widgetName,
      'child':
          DynamicWidgetBuilder.transformMap(realWidget.child, buildContext),
      'xVar': {
        'alignment': DynamicWidgetUtils.transform(
            realWidget.alignment as Alignment?),
        'padding': DynamicWidgetUtils.transform(padding),
        'color': DynamicWidgetUtils.transform(realWidget.color),
        'margin': DynamicWidgetUtils.transform(margin),
        'constraints': DynamicWidgetUtils.transform(constraints),
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
    return Chip(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      alignment: props?.alignment,
      padding: props?.padding,
      color: props?.color,
      margin: props?.margin,
      width: props?.width,
      height: props?.height,
      constraints: props?.constraints,
      child: DynamicWidgetBuilder.buildWidget(widget.config?.child,
          context: context, event: widget.event),
    );
  }
}

class ChipConfig {
  late Map? avatar;//左侧的图标
  late Map? label;//这个是必填的参数，控件上显示的文本
  late TextStyle? labelStyle;
  late EdgeInsets? labelPadding;
  late Map? deleteIcon;//右侧的删除图标
  late VoidCallback? onDeleted;//删除图标的点击事件，如果不写该方法的话，deleteIcon显示不出来
  late Color? deleteIconColor;
  late bool? useDeleteButtonTooltip;
  late String? deleteButtonTooltipMessage;//点击删除图标后弹出的文本，类似于tooltip的效果
  late BorderSide? side;
  //late OutlinedBorder? shape;
  late Clip? clipBehavior;
  late FocusNode? focusNode;
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
