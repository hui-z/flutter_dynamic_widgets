import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

import '../button.dart';
import '../column.dart';
import '../row.dart';
import '../text.dart';
import 'handler.dart';

class DynamicWidgetUtils {
  DynamicWidgetUtils._();

  static Map<String, DynamicBasicWidgetHandler> _widgetHandlers = {};

  static registerSysWidgets() {
    List<DynamicBasicWidgetHandler> allDynamicWidgetHandlers = [
      TextHandler(),
      RawMaterialButtonHandler(),
      RowHandler(),
      ColumnHandler()
    ];
    for (DynamicBasicWidgetHandler item in allDynamicWidgetHandlers) {
      _widgetHandlers[item.widgetName] = item;
    }
  }

  ///Build widget
  static Widget? buildWidget(DynamicWidgetConfig? config,
      {Key? key, required BuildContext context}) {
    if (config == null) return null;
    DynamicBasicWidgetHandler? handler = _widgetHandlers[config.widget];
    if (handler == null) return null;
    return handler.build(config, key: key, buildContext: context);
  }

  static Alignment? alignmentAdapter(String? alignmentString) {
    Alignment? alignment;
    switch (alignmentString) {
      case 'center':
        alignment = Alignment.center;
        break;
      case 'topCenter':
        alignment = Alignment.topCenter;
        break;
      case 'bottomCenter':
        alignment = Alignment.bottomCenter;
        break;
      case 'centerLeft':
        alignment = Alignment.centerLeft;
        break;
      case 'topLeft':
        alignment = Alignment.topLeft;
        break;
      case 'bottomLeft':
        alignment = Alignment.bottomLeft;
        break;
      case 'topRight':
        alignment = Alignment.topRight;
        break;
      case 'centerRight':
        alignment = Alignment.centerRight;
        break;
      case 'bottomRight':
        alignment = Alignment.bottomRight;
        break;
      default:
    }

    return alignment;
  }

  static TextAlign? textAlignAdapter(String? alignmentString) {
    TextAlign? alignment;
    switch (alignmentString) {
      case 'center':
        alignment = TextAlign.center;
        break;
      case 'end':
        alignment = TextAlign.end;
        break;
      case 'justify':
        alignment = TextAlign.justify;
        break;
      case 'left':
        alignment = TextAlign.left;
        break;
      case 'right':
        alignment = TextAlign.right;
        break;
      case 'start':
        alignment = TextAlign.start;
        break;
      default:
    }

    return alignment;
  }

  ///adapt dsl color to the flutter color 0xff123456
  static Color? colorAdapter(String? colorString) {
    Color? color;
    if (colorString != null) {
      if (colorString.startsWith('#')) {
        colorString.replaceFirst('#', '0xff');
      }
      int? v = int.tryParse(colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }

  static BoxConstraints? boxConstraintsAdapter(
      Map<String, double?>? constraints) {
    BoxConstraints? boxConstraints;
    if (constraints != null) {
      boxConstraints = BoxConstraints(
          minWidth: constraints['minWidth'] ?? 0.0,
          maxWidth: constraints['maxWidth'] ?? double.infinity,
          minHeight: constraints['minHeight'] ?? 0.0,
          maxHeight: constraints['maxHeight'] ?? double.infinity);
    }

    return boxConstraints;
  }

  static RoundedRectangleBorder? roundedRectangleBorderAdapter(
      Map<String, dynamic>? border) {
    if (border == null) return null;

    return RoundedRectangleBorder(
        side: borderSideAdapter(border['side']) ?? BorderSide.none,
        borderRadius:
            borderRadiusAdapter(border['borderRadius']) ?? BorderRadius.zero);
  }

  static Duration? durationAdapter(Map<String, int?>? duration) {
    if (duration == null) return null;
    return Duration(
      days: duration['days'] ?? 0,
      hours: duration['hours'] ?? 0,
      minutes: duration['minutes'] ?? 0,
      seconds: duration['seconds'] ?? 0,
      milliseconds: duration['milliseconds'] ?? 0,
      microseconds: duration['microseconds'] ?? 0,
    );
  }


  static BorderSide? borderSideAdapter(Map<String, dynamic>? side) {
    if (side == null) return null;

    return BorderSide(
        color: colorAdapter(side['color']) ?? const Color(0xFF000000),
        width: side['width'] ?? 1.0,
        style: borderStyleAdapter(side['style']) ?? BorderStyle.solid);
  }

  static BorderRadius? borderRadiusAdapter(Map<String, double?>? borderRadius) {
    if (borderRadius == null) return null;

    return BorderRadius.only(
        topLeft: radiusAdapter(borderRadius['topLeft']) ?? Radius.zero,
        topRight: radiusAdapter(borderRadius['topRight']) ?? Radius.zero,
        bottomLeft: radiusAdapter(borderRadius['bottomLeft']) ?? Radius.zero,
        bottomRight: radiusAdapter(borderRadius['bottomRight']) ?? Radius.zero);
  }

  static Radius? radiusAdapter(double? radius) {
    if (radius == null) return null;

    return Radius.circular(radius);
  }

  static BorderStyle? borderStyleAdapter(String? style) {
    if (style == null) return null;

    BorderStyle? borderStyle;
    switch (style) {
      case 'none':
        borderStyle = BorderStyle.none;
        break;
      case 'solid':
        borderStyle = BorderStyle.solid;
        break;
      default:
    }
    return borderStyle;
  }

  static FontWeight? fontWeightAdapter(String? fontWeightString) {
    FontWeight? fontWeight;
    switch (fontWeightString) {
      case 'bold':
        fontWeight = FontWeight.bold;
        break;
      case 'normal':
        fontWeight = FontWeight.normal;
        break;
      case '100':
        fontWeight = FontWeight.w100;
        break;
      case '200':
        fontWeight = FontWeight.w200;
        break;
      case '300':
        fontWeight = FontWeight.w300;
        break;
      case '400':
        fontWeight = FontWeight.w400;
        break;
      case '500':
        fontWeight = FontWeight.w500;
        break;
      case '600':
        fontWeight = FontWeight.w600;
        break;
      case '700':
        fontWeight = FontWeight.w700;
        break;
      case '800':
        fontWeight = FontWeight.w800;
        break;
      case '900':
        fontWeight = FontWeight.w900;
        break;
      default:
    }

    return fontWeight;
  }

  static FontStyle? fontStyleAdapter(String? fontStyleString) {
    FontStyle? fontStyle;
    switch (fontStyleString) {
      case 'normal':
        fontStyle = FontStyle.normal;
        break;
      case 'italic':
        fontStyle = FontStyle.italic;
        break;
      default:
    }

    return fontStyle;
  }

  static EdgeInsets? edgeInsetAdapter(Map<String, dynamic>? inset) {
    if (inset == null) {
      return null;
    }

    return EdgeInsets.fromLTRB(
        inset['left']?.toDouble() ?? 0.0,
        inset['top']?.toDouble() ?? 0.0,
        inset['right']?.toDouble() ?? 0.0,
        inset['bottom'].toDouble() ?? 0.0);
  }

  static Rect? rectAdapter(Map<String, dynamic>? rect) {
    if (rect == null) {
      return null;
    }

    return Rect.fromLTRB(
        rect['left']?.toDouble() ?? 0.0,
        rect['top']?.toDouble() ?? 0.0,
        rect['right']?.toDouble() ?? 0.0,
        rect['bottom'].toDouble() ?? 0.0);
  }

  static TextInputType? inputTypeAdapter(String? inputTypeString) {
    TextInputType? inputType;
    switch (inputTypeString) {
      case 'datetime':
        inputType = TextInputType.datetime;
        break;
      case 'emailAddress':
        inputType = TextInputType.emailAddress;
        break;
      case 'number':
        inputType = TextInputType.number;
        break;
      case 'phone':
        inputType = TextInputType.phone;
        break;
      case 'multiline':
        inputType = TextInputType.multiline;
        break;
      case 'text':
        inputType = TextInputType.text;
        break;
      case 'url':
        inputType = TextInputType.url;
        break;
      case 'visiblePassword':
        inputType = TextInputType.visiblePassword;
        break;
      default:
    }

    return inputType;
  }

  static BoxFit? boxFitAdapter(String? str) {
    BoxFit? _boxFit;
    switch (str) {
      case 'contain':
        _boxFit = BoxFit.contain;
        break;
      case 'cover':
        _boxFit = BoxFit.cover;
        break;
      case 'fill':
        _boxFit = BoxFit.fill;
        break;
      case 'fitHeight':
        _boxFit = BoxFit.fitHeight;
        break;
      case 'fitWidth':
        _boxFit = BoxFit.fitWidth;
        break;
      case 'none':
        _boxFit = BoxFit.none;
        break;
      case 'scaleDown':
        _boxFit = BoxFit.scaleDown;
        break;
      default:
    }

    return _boxFit;
  }

  static StackFit? stackFitAdapter(String? str) {
    StackFit? _boxFit;
    switch (str) {
      case 'loose':
        _boxFit = StackFit.loose;
        break;
      case 'expand':
        _boxFit = StackFit.expand;
        break;
      case 'passthrough':
        _boxFit = StackFit.passthrough;
        break;

      default:
    }

    return _boxFit;
  }

  static ImageRepeat? imageRepeatAdapter(String? str) {
    ImageRepeat? _imageRepeat;
    switch (str) {
      case 'noRepeat':
        _imageRepeat = ImageRepeat.noRepeat;
        break;
      case 'repeat':
        _imageRepeat = ImageRepeat.repeat;
        break;
      case 'repeatX':
        _imageRepeat = ImageRepeat.repeatX;
        break;
      case 'repeatY':
        _imageRepeat = ImageRepeat.repeatY;
        break;
      default:
    }

    return _imageRepeat;
  }

  static MainAxisAlignment? mainAxisAlignmentAdapter(String? str) {
    MainAxisAlignment? _mainAxisAlignment;
    switch (str) {
      case 'center':
        _mainAxisAlignment = MainAxisAlignment.center;
        break;
      case 'end':
        _mainAxisAlignment = MainAxisAlignment.end;
        break;
      case 'spaceAround':
        _mainAxisAlignment = MainAxisAlignment.spaceAround;
        break;
      case 'spaceBetween':
        _mainAxisAlignment = MainAxisAlignment.spaceBetween;
        break;
      case 'spaceEvenly':
        _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
        break;
      case 'start':
        _mainAxisAlignment = MainAxisAlignment.start;
        break;
      default:
    }

    return _mainAxisAlignment;
  }

  static MainAxisSize? mainAxisSizeAdapter(String? str) {
    MainAxisSize? _mainAxisSize;
    switch (str) {
      case 'max':
        _mainAxisSize = MainAxisSize.max;
        break;
      case 'min':
        _mainAxisSize = MainAxisSize.min;
        break;
      default:
    }

    return _mainAxisSize;
  }

  static CrossAxisAlignment? crossAxisAlignmentAdapter(String? str) {
    CrossAxisAlignment? _crossAxisAlignment;
    switch (str) {
      case 'baseline':
        _crossAxisAlignment = CrossAxisAlignment.baseline;
        break;
      case 'center':
        _crossAxisAlignment = CrossAxisAlignment.center;
        break;
      case 'end':
        _crossAxisAlignment = CrossAxisAlignment.end;
        break;
      case 'start':
        _crossAxisAlignment = CrossAxisAlignment.start;
        break;
      case 'stretch':
        _crossAxisAlignment = CrossAxisAlignment.stretch;
        break;
      default:
    }

    return _crossAxisAlignment;
  }

  static WrapAlignment? wrapAlignmentAdapter(String? str) {
    WrapAlignment? _wrapAlignment;
    switch (str) {
      case 'center':
        _wrapAlignment = WrapAlignment.center;
        break;
      case 'end':
        _wrapAlignment = WrapAlignment.end;
        break;
      case 'spaceAround':
        _wrapAlignment = WrapAlignment.spaceAround;
        break;
      case 'spaceBetween':
        _wrapAlignment = WrapAlignment.spaceBetween;
        break;
      case 'spaceEvenly':
        _wrapAlignment = WrapAlignment.spaceEvenly;
        break;
      case 'start':
        _wrapAlignment = WrapAlignment.start;
        break;
      default:
    }

    return _wrapAlignment;
  }

  static WrapCrossAlignment? wrapCrossAlignmentAdapter(String? str) {
    WrapCrossAlignment? _wrapCrossAlignment;
    switch (str) {
      case 'center':
        _wrapCrossAlignment = WrapCrossAlignment.center;
        break;
      case 'end':
        _wrapCrossAlignment = WrapCrossAlignment.end;
        break;
      case 'start':
        _wrapCrossAlignment = WrapCrossAlignment.start;
        break;
      default:
    }

    return _wrapCrossAlignment;
  }

  static TextDirection? textDirectionAdapter(String? str) {
    TextDirection? _textDirection;
    switch (str) {
      case 'ltr':
        _textDirection = TextDirection.ltr;
        break;
      case 'rtl':
        _textDirection = TextDirection.rtl;
        break;
      default:
    }

    return _textDirection;
  }

  static TextOverflow? textOverflowAdapter(String? str) {
    TextOverflow? _textOverflow;
    switch (str) {
      case 'clip':
        _textOverflow = TextOverflow.clip;
        break;
      case 'fade':
        _textOverflow = TextOverflow.fade;
        break;
      case 'ellipsis':
        _textOverflow = TextOverflow.ellipsis;
        break;
      case 'visible':
        _textOverflow = TextOverflow.visible;
        break;
      default:
    }

    return _textOverflow;
  }

  static TextHeightBehavior? textHeightBehaviorAdapter(
      Map<String, dynamic>? behavior) {
    if (behavior == null) return null;

    return TextHeightBehavior(
        applyHeightToFirstAscent: behavior['applyHeightToFirstAscent'] ?? true,
        applyHeightToLastDescent: behavior['applyHeightToLastDescent'] ?? true,
        leadingDistribution:
            textLeadingDistributionAdapter(behavior['leadingDistribution']) ??
                TextLeadingDistribution.proportional);
  }

  static VerticalDirection? verticalDirectionAdapter(String? str) {
    VerticalDirection? _verticalDirection;
    switch (str) {
      case 'down':
        _verticalDirection = VerticalDirection.down;
        break;
      case 'up':
        _verticalDirection = VerticalDirection.up;
        break;
      default:
    }

    return _verticalDirection;
  }

  static TextBaseline? textBaselineAdapter(String? str) {
    TextBaseline? _textBaseline;
    switch (str) {
      case 'alphabetic':
        _textBaseline = TextBaseline.alphabetic;
        break;
      case 'ideographic':
        _textBaseline = TextBaseline.ideographic;
        break;
      default:
    }

    return _textBaseline;
  }

  static Axis? axisAdapter(String? str) {
    Axis? _axis;
    switch (str) {
      case 'horizontal':
        _axis = Axis.horizontal;
        break;
      case 'vertical':
        _axis = Axis.vertical;
        break;
      default:
    }

    return _axis;
  }

  static Clip? clipBehaviorAdapter(String? str) {
    Clip? _clip;
    switch (str) {
      case 'antiAlias':
        _clip = Clip.antiAlias;
        break;
      case 'antiAliasWithSaveLayer':
        _clip = Clip.antiAliasWithSaveLayer;
        break;
      case 'hardEdge':
        _clip = Clip.hardEdge;
        break;
      case 'none':
        _clip = Clip.none;
        break;
      default:
    }

    return _clip;
  }

  static TextStyle? textStyleAdapter(Map<String, dynamic>? style) {
    if (style == null) return null;

    return TextStyle(
        inherit: style['inherit'] ?? true,
        color: colorAdapter(style['color']),
        backgroundColor: colorAdapter(style['background']),
        fontSize: style['fontSize'],
        fontWeight: fontWeightAdapter(style['fontWeight']),
        fontStyle: fontStyleAdapter(style['fontStyle']),
        letterSpacing: style['letterSpacing'],
        wordSpacing: style['wordSpacing'],
        textBaseline: textBaselineAdapter(style['textBaseline']),
        height: style['height'],
        leadingDistribution:
            textLeadingDistributionAdapter(style['leadingDistribution']),
        debugLabel: style['debugLabel'],
        fontFamily: style['fontFamily'],
        fontFamilyFallback: style['fontFamilyFallback']?.cast<String>(),
        package: style['package']);
  }

  static StrutStyle? strutStyleAdapter(Map<String, dynamic>? style) {
    if (style == null) return null;

    return StrutStyle(
        fontFamily: style['fontFamily'],
        fontFamilyFallback: style['fontFamilyFallback']?.cast<String>(),
        fontSize: style['fontSize'],
        height: style['height'],
        leadingDistribution:
            textLeadingDistributionAdapter(style['leadingDistribution']),
        leading: style['leading'],
        fontWeight: fontWeightAdapter(style['fontWeight']),
        fontStyle: fontStyleAdapter(style['fontStyle']),
        forceStrutHeight: style['forceStrutHeight'],
        debugLabel: style['debugLabel'],
        package: style['package']);
  }

  static TextLeadingDistribution? textLeadingDistributionAdapter(String? str) {
    TextLeadingDistribution? _textLeadingDistribution;
    switch (str) {
      case 'proportional':
        _textLeadingDistribution = TextLeadingDistribution.proportional;
        break;
      case 'even':
        _textLeadingDistribution = TextLeadingDistribution.even;
        break;
      default:
    }

    return _textLeadingDistribution;
  }

  static TextInputType? keyboardTypeAdapter(String? str) {
    TextInputType? _textInputType;
    switch (str) {
      case 'datetime':
        _textInputType = TextInputType.datetime;
        break;
      case 'emailAddress':
        _textInputType = TextInputType.emailAddress;
        break;
      case 'multiline':
        _textInputType = TextInputType.multiline;
        break;
      case 'name':
        _textInputType = TextInputType.name;
        break;
      case 'number':
        _textInputType = TextInputType.number;
        break;
      case 'phone':
        _textInputType = TextInputType.phone;
        break;
      case 'streetAddress':
        _textInputType = TextInputType.streetAddress;
        break;
      case 'text':
        _textInputType = TextInputType.text;
        break;
      case 'url':
        _textInputType = TextInputType.url;
        break;
      case 'visiblePassword':
        _textInputType = TextInputType.visiblePassword;
        break;
      default:
    }

    return _textInputType;
  }

  static Offset? offsetAdapter(Map<String, double?>? offset) {
    if (offset == null) return null;

    return Offset(offset['dx'] ?? 0, offset['dy'] ?? 0);
  }

  static Size? sizeAdapter(Map<String, double?>? size) {
    if (size == null) return null;

    return Size(
        size['width'] ?? double.infinity, size['height'] ?? double.infinity);
  }
}
