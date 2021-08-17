
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';
import 'config/widget_config.dart';

/// RawMaterialButton handler
class RawMaterialButtonHandler extends DynamicBasicWidgetHandler {

  @override
  String get widgetName => 'RawMaterialButton';

  @override
  Widget build(DynamicWidgetConfig? config,
      {Key? key, required BuildContext buildContext}) {
    return _Builder(config, key: key);
  }

  @override
  Map? transformJson(Widget? widget, BuildContext? buildContext) {
    var button = widget as RawMaterialButton?;
    if (button == null) return null;
    return {
      'widget': widgetName,
      'child': DynamicWidgetBuilder.transformMap(button.child, buildContext),
      'xVar': {
        'textStyle': DynamicWidgetUtils.transformTextStyle(button.textStyle),
        'fillColor': DynamicWidgetUtils.transformColor(button.fillColor),
        'focusColor': DynamicWidgetUtils.transformColor(button.focusColor),
        'hoverColor': DynamicWidgetUtils.transformColor(button.hoverColor),
        'highlightColor': DynamicWidgetUtils.transformColor(button.highlightColor),
        'splashColor': DynamicWidgetUtils.transformColor(button.splashColor),
        'elevation': button.elevation,
        'focusElevation': button.focusElevation,
        'hoverElevation': button.hoverElevation,
        'highlightElevation': button.highlightElevation,
        'disabledElevation': button.disabledElevation,
        'padding': DynamicWidgetUtils.transformEdgeInset(button.padding as EdgeInsets?),
        'constraints': DynamicWidgetUtils.transformBoxConstraints(button.constraints),
        'shape': DynamicWidgetUtils.transformRoundedRectangleBorder(button.shape as RoundedRectangleBorder?),
        'animationDuration': DynamicWidgetUtils.transformDuration(button.animationDuration),
        'clipBehavior': DynamicWidgetUtils.transformClipBehavior(button.clipBehavior),
        'autofocus': button.autofocus,
        'enableFeedback': button.enableFeedback,
        
      },
      'xKey': button.key.toString()
    };
  }

  @override
  Type get widgetType => RawMaterialButton;
  
}

class _Builder extends DynamicBaseWidget {
  final DynamicWidgetConfig? config;

  _Builder(this.config, {Key? key}) : super(config, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<_Builder> {
  RawMaterialButtonConfig? props;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.config?.xVar != null) {
      props = RawMaterialButtonConfig.fromJson(widget.config?.xVar ?? {});
    }
    Widget _widget;
    Widget child = DynamicWidgetBuilder.buildWidget(widget.config?.child, context: context) ?? Container();

    _widget = RawMaterialButton(
      key: widget.config?.xKey != null ? Key(widget.config!.xKey!) : null,
      onPressed: () {
      },
      onLongPress: (){
      },
      fillColor: props?.fillColor,
      textStyle: props?.textStyle,
      focusColor: props?.focusColor,
      hoverColor: props?.hoverColor,
      highlightColor: props?.highlightColor,
      splashColor: props?.splashColor,
      elevation: props?.elevation ?? 2.0,
      focusElevation: props?.focusElevation ?? 4.0,
      hoverElevation: props?.hoverElevation ?? 4.0,
      highlightElevation: props?.highlightElevation ?? 8.0,
      disabledElevation: props?.disabledElevation ?? 0.0,
      padding: props?.padding ?? EdgeInsets.zero,
      constraints: props?.constraints ?? BoxConstraints(minWidth: 0.0, maxWidth: double.infinity, minHeight: 0.0, maxHeight: double.infinity),
      shape: props?.shape ?? const RoundedRectangleBorder(),
      animationDuration: props?.animationDuration ?? kThemeChangeDuration,
      clipBehavior: props?.clipBehavior ?? Clip.none,
      autofocus: props?.autofocus ?? false,
      enableFeedback: props?.enableFeedback ?? true,
      child: child,
    );  

    return _widget;
  }
}

/// The props of RawMaterialButton config
class RawMaterialButtonConfig {
  late TextStyle? textStyle;
  late Color? fillColor;
  late Color? focusColor;
  late Color? hoverColor;
  late Color? highlightColor;
  late Color? splashColor;
  late double? elevation;
  late double? focusElevation;
  late double? hoverElevation;
  late double? highlightElevation;
  late double? disabledElevation;
  late EdgeInsetsGeometry? padding;
  late BoxConstraints? constraints;
  late RoundedRectangleBorder? shape;
  late Duration? animationDuration;
  late Clip? clipBehavior;
  late bool? autofocus;
  late bool? enableFeedback;



  RawMaterialButtonConfig(
      {this.textStyle,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.elevation,
      this.focusElevation,
      this.hoverElevation,
      this.highlightElevation,
      this.disabledElevation,      
      this.padding, this.shape, this.animationDuration, this.clipBehavior, this.autofocus, this.enableFeedback});

  RawMaterialButtonConfig.fromJson(Map<dynamic, dynamic> json) {
    textStyle = DynamicWidgetUtils.textStyleAdapter(json['textStyle']);
    fillColor = DynamicWidgetUtils.colorAdapter(json['fillColor']);
    focusColor = DynamicWidgetUtils.colorAdapter(json['focusColor']);
    hoverColor = DynamicWidgetUtils.colorAdapter(json['hoverColor']);
    highlightColor = DynamicWidgetUtils.colorAdapter(json['highlightColor']);
    splashColor = DynamicWidgetUtils.colorAdapter(json['splashColor']);
    elevation = json['elevation'];
    focusElevation = json['focusElevation'];
    hoverElevation = json['hoverElevation'];
    highlightElevation = json['highlightElevation'];
    disabledElevation = json['disabledElevation'];   
    padding = DynamicWidgetUtils.edgeInsetAdapter(json['padding']);
    constraints = DynamicWidgetUtils.boxConstraintsAdapter(json['constraints']);
    shape = DynamicWidgetUtils.roundedRectangleBorderAdapter(json['shape']);
    animationDuration = DynamicWidgetUtils.durationAdapter(json['animationDuration']);
    clipBehavior = DynamicWidgetUtils.clipBehaviorAdapter(json['clipBehavior']);
    autofocus = json['autofocus'];
    enableFeedback = json['enableFeedback'];
  }
}
