import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AdaptUtils {
  static T? adapt<T>(dynamic origin) {
    switch (T) {
      case Alignment:
        return _alignmentAdapter(origin as String?) as T?;
      case TextAlign:
        return _textAlignAdapter(origin as String?) as T?;
      case Color:
        return _colorAdapter(origin as String?) as T?;
      case BoxConstraints:
        return _boxConstraintsAdapter(origin as Map?) as T?;
      case RoundedRectangleBorder:
        return _roundedRectangleBorderAdapter(origin as Map?) as T?;
      case Duration:
        return _durationAdapter(origin as Map?) as T?;
      case BorderSide:
        return _borderSideAdapter(origin as Map?) as T?;
      case BorderStyle:
        return _borderStyleAdapter(origin as String?) as T?;
      case BoxBorder:
        return _boxBorderAdapter(origin as Map?) as T?;
      case FontWeight:
        return _fontWeightAdapter(origin as String?) as T?;
      case FontStyle:
        return _fontStyleAdapter(origin as String?) as T?;
      case EdgeInsets:
        return _edgeInsetsAdapter(origin as Map?) as T?;
      case MainAxisAlignment:
        return _mainAxisAlignmentAdapter(origin as String?) as T?;
      case MainAxisSize:
        return _mainAxisSizeAdapter(origin as String?) as T?;
      case CrossAxisAlignment:
        return _crossAxisAlignmentAdapter(origin as String?) as T?;
      case TextDirection:
        return _textDirectionAdapter(origin as String?) as T?;
      case TextOverflow:
        return _textOverflowAdapter(origin as String?) as T?;
      case VerticalDirection:
        return _verticalDirectionAdapter(origin as String?) as T?;
      case TextHeightBehavior:
        return _textHeightBehaviorAdapter(origin as Map?) as T?;
      case TextBaseline:
        return _textBaselineAdapter(origin as String?) as T?;
      case Clip:
        return _clipBehaviorAdapter(origin as String?) as T?;
      case TextStyle:
        return _textStyleAdapter(origin as Map?) as T?;
      case StrutStyle:
        return _strutStyleAdapter(origin as Map?) as T?;
      case TextLeadingDistribution:
        return _textLeadingDistributionAdapter(origin as String?) as T?;
      case IconData:
        return _iconDataAdapter(origin as Map?) as T?;
      case FilterQuality:
        return _filterQualityAdapter(origin as String?) as T?;
      case BlendMode:
        return _blendModeAdapter(origin as String?) as T?;
      case Rect:
        return _rectAdapter(origin as Map?) as T?;
      case BoxFit:
        return _boxFitAdapter(origin as String?) as T?;
      case ImageRepeat:
        return _imageRepeatAdapter(origin as String?) as T?;
      case BorderRadius:
        return _borderRadiusAdapter(origin as Map?) as T?;
      case Radius:
        return _radiusAdapter(origin as double?) as T?;
      case TextInputType:
        return _inputTypeAdapter(origin as String?) as T?;
      case StackFit:
        return _stackFitAdapter(origin as String?) as T?;
      case WrapAlignment:
        return _wrapAlignmentAdapter(origin as String?) as T?;
      case WrapCrossAlignment:
        return _wrapCrossAlignmentAdapter(origin as String?) as T?;
      case Axis:
        return _axisAdapter(origin as String?) as T?;
      case Offset:
        return _offsetAdapter(origin as Map?) as T?;
      case Size:
        return _sizeAdapter(origin as Map?) as T?;
      case DragStartBehavior:
        return _dragStartBehaviorAdapter(origin as String?) as T?;
      case ScrollViewKeyboardDismissBehavior:
        return _scrollViewKeyboardDismissBehaviorAdapter(origin as String?)
            as T?;
      case MouseCursor:
        return _mouseCursorAdapter(origin as String?) as T?;
      case Curve:
        return _curveAdapter(origin as String?) as T?;
      case TextSpan:
        return _textSpanAdapter(origin as Map?) as T?;
      case TextDecoration:
        return _textDecorationAdapter(origin as String?) as T?;
      case BoxDecoration:
        return _boxDecorationAdapter(origin as Map?) as T?;
      case Gradient:
        return _boxGradientAdapter(origin as Map) as T?;
    }
    throw UnimplementedError('请实现 $T 的adapt方法');
  }

  static double? doubleAdapt(double? d) {
    return d == -1.0 ? double.infinity : d;
  }

  static BoxDecoration? _boxDecorationAdapter(Map? decorationMap) {
    if (decorationMap == null) return null;

    return BoxDecoration(
      color: adapt<Color>(decorationMap['color']),
      borderRadius: adapt<BorderRadius>(decorationMap['borderRadius']),
      border: adapt<BoxBorder>(decorationMap['border']),
      gradient: adapt<Gradient>(decorationMap['gradient']),
    );
  }

  static ScrollViewKeyboardDismissBehavior?
      _scrollViewKeyboardDismissBehaviorAdapter(String? str) {
    if (str == null) return null;

    ScrollViewKeyboardDismissBehavior? dragStartBehaviorStr;
    switch (str) {
      case 'manual':
        dragStartBehaviorStr = ScrollViewKeyboardDismissBehavior.manual;
        break;
      case 'onDrag':
        dragStartBehaviorStr = ScrollViewKeyboardDismissBehavior.onDrag;
        break;
      default:
    }
    return dragStartBehaviorStr;
  }

  static DragStartBehavior? _dragStartBehaviorAdapter(String? str) {
    if (str == null) return null;

    DragStartBehavior? dragStartBehavior;
    switch (str) {
      case 'down':
        dragStartBehavior = DragStartBehavior.down;
        break;
      case 'start':
        dragStartBehavior = DragStartBehavior.start;
        break;
      default:
    }
    return dragStartBehavior;
  }

  static Alignment? _alignmentAdapter(String? alignmentString) {
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

  static TextAlign? _textAlignAdapter(String? alignmentString) {
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

  ///adapt dsl color to the flutter color ff123456
  static Color? _colorAdapter(String? colorString) {
    Color? color;
    if (colorString != null) {
      int? v = int.tryParse('0x' + colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }

  static BoxConstraints? _boxConstraintsAdapter(Map? constraints) {
    BoxConstraints? boxConstraints;
    if (constraints != null) {
      boxConstraints = BoxConstraints(
          minWidth: doubleAdapt(constraints['minWidth']?.toDouble()) ?? 0.0,
          maxWidth: doubleAdapt(constraints['maxWidth']?.toDouble()) ?? 0.0,
          minHeight: doubleAdapt(constraints['minHeight']?.toDouble()) ?? 0.0,
          maxHeight: doubleAdapt(constraints['maxHeight']?.toDouble()) ?? 0.0);
    }

    return boxConstraints;
  }

  static RoundedRectangleBorder? _roundedRectangleBorderAdapter(Map? border) {
    if (border == null) return null;

    return RoundedRectangleBorder(
        side: adapt(border['side']) ?? BorderSide.none,
        borderRadius:
            adapt<BorderRadius>(border['borderRadius']) ?? BorderRadius.zero);
  }

  static Duration? _durationAdapter(Map? duration) {
    if (duration == null) return null;
    return Duration(
      days: duration['days']?.toInt() ?? 0,
      hours: duration['hours']?.toInt() ?? 0,
      minutes: duration['minutes']?.toInt() ?? 0,
      seconds: duration['seconds']?.toInt() ?? 0,
      milliseconds: duration['milliseconds']?.toInt() ?? 0,
      microseconds: duration['microseconds']?.toInt() ?? 0,
    );
  }

  static BorderSide? _borderSideAdapter(Map? side) {
    if (side == null) return null;

    return BorderSide(
        color: adapt(side['color']) ?? const Color(0xFF000000),
        width: side['width']?.toDouble() ?? 1.0,
        style: adapt(side['style']) ?? BorderStyle.solid);
  }

  static BorderRadius? _borderRadiusAdapter(Map? borderRadius) {
    if (borderRadius == null) return null;

    return BorderRadius.only(
        topLeft: adapt(borderRadius['topLeft']?.toDouble()) ?? Radius.zero,
        topRight: adapt(borderRadius['topRight']?.toDouble()) ?? Radius.zero,
        bottomLeft:
            adapt(borderRadius['bottomLeft']?.toDouble()) ?? Radius.zero,
        bottomRight:
            adapt(borderRadius['bottomRight']?.toDouble()) ?? Radius.zero);
  }

  static BoxBorder? _boxBorderAdapter(Map? boxBorder) {
    if (boxBorder == null) return null;

    return Border.all(
        color: adapt(boxBorder['color']) ?? const Color(0xFF000000),
        width: boxBorder['width']?.toDouble() ?? 1.0,
        style: adapt(boxBorder['style']) ?? BorderStyle.solid);
  }

  static Gradient? _boxGradientAdapter(Map? gradient) {
    if (gradient == null) return null;

    List<Color> colors = [];
    for (String c in gradient['colors']) {
      colors.add(adapt<Color>(c) ?? Colors.white);
    }
    if (gradient['type'] == 'linear') {
      return LinearGradient(
        colors: colors,
        begin: adapt<Alignment>(gradient['begin']) ?? Alignment.centerLeft,
        end: adapt<Alignment>(gradient['end']) ?? Alignment.centerRight,
      );
    } else if (gradient['type'] == 'radial') {
      return RadialGradient(
          radius: gradient['radius']?.toDouble() ?? 0.5, colors: colors);
    } else if (gradient['type'] == 'sweep') {
      return SweepGradient(
          startAngle: gradient['startAngle']?.toDouble() ?? 0.0,
          endAngle: gradient['endAngle']?.toDouble() ?? 3.0,
          colors: colors);
    }
    return LinearGradient(colors: colors);
  }

  static Radius? _radiusAdapter(double? radius) {
    if (radius == null) return null;

    return Radius.circular(radius);
  }

  static BorderStyle? _borderStyleAdapter(String? style) {
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

  static FontWeight? _fontWeightAdapter(String? fontWeightString) {
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

  static FontStyle? _fontStyleAdapter(String? fontStyleString) {
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

  static EdgeInsets? _edgeInsetsAdapter(Map? inset) {
    if (inset == null) {
      return null;
    }

    return EdgeInsets.fromLTRB(
        inset['left']?.toDouble() ?? 0.0,
        inset['top']?.toDouble() ?? 0.0,
        inset['right']?.toDouble() ?? 0.0,
        inset['bottom'].toDouble() ?? 0.0);
  }

  static Rect? _rectAdapter(Map? rect) {
    if (rect == null) {
      return null;
    }

    return Rect.fromLTRB(
        rect['left']?.toDouble() ?? 0.0,
        rect['top']?.toDouble() ?? 0.0,
        rect['right']?.toDouble() ?? 0.0,
        rect['bottom'].toDouble() ?? 0.0);
  }

  static TextInputType? _inputTypeAdapter(String? inputTypeString) {
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

  static BoxFit? _boxFitAdapter(String? str) {
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

  static StackFit? _stackFitAdapter(String? str) {
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

  static ImageRepeat? _imageRepeatAdapter(String? str) {
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

  static MainAxisAlignment? _mainAxisAlignmentAdapter(String? str) {
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

  static MainAxisSize? _mainAxisSizeAdapter(String? str) {
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

  static CrossAxisAlignment? _crossAxisAlignmentAdapter(String? str) {
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

  static WrapAlignment? _wrapAlignmentAdapter(String? str) {
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

  static WrapCrossAlignment? _wrapCrossAlignmentAdapter(String? str) {
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

  static TextDirection? _textDirectionAdapter(String? str) {
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

  static TextOverflow? _textOverflowAdapter(String? str) {
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

  static TextHeightBehavior? _textHeightBehaviorAdapter(Map? behavior) {
    if (behavior == null) return null;

    return TextHeightBehavior(
        applyHeightToFirstAscent: behavior['applyHeightToFirstAscent'] ?? true,
        applyHeightToLastDescent: behavior['applyHeightToLastDescent'] ?? true,
        leadingDistribution:
            adapt<TextLeadingDistribution>(behavior['leadingDistribution']) ??
                TextLeadingDistribution.proportional);
  }

  static VerticalDirection? _verticalDirectionAdapter(String? str) {
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

  static TextBaseline? _textBaselineAdapter(String? str) {
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

  static Axis? _axisAdapter(String? str) {
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

  static Clip? _clipBehaviorAdapter(String? str) {
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

  static TextStyle? _textStyleAdapter(Map? style) {
    if (style == null) return null;

    return TextStyle(
        inherit: style['inherit'] ?? true,
        color: adapt(style['color']),
        backgroundColor: adapt(style['backgroundColor']),
        fontSize: style['fontSize']?.toDouble(),
        fontWeight: adapt(style['fontWeight']),
        fontStyle: adapt(style['fontStyle']),
        decoration: adapt(style['decoration']),
        letterSpacing: style['letterSpacing']?.toDouble(),
        wordSpacing: style['wordSpacing']?.toDouble(),
        textBaseline: adapt(style['textBaseline']),
        height: style['height']?.toDouble(),
        leadingDistribution: adapt(style['leadingDistribution']),
        debugLabel: style['debugLabel'],
        fontFamily: style['fontFamily'],
        fontFamilyFallback: style['fontFamilyFallback']?.cast<String>(),
        package: style['package']);
  }

  static StrutStyle? _strutStyleAdapter(Map? style) {
    if (style == null) return null;

    return StrutStyle(
        fontFamily: style['fontFamily'],
        fontFamilyFallback: style['fontFamilyFallback']?.cast<String>(),
        fontSize: style['fontSize'],
        height: style['height'],
        leadingDistribution: adapt(style['leadingDistribution']),
        leading: style['leading'],
        fontWeight: adapt(style['fontWeight']),
        fontStyle: adapt(style['fontStyle']),
        forceStrutHeight: style['forceStrutHeight'],
        debugLabel: style['debugLabel'],
        package: style['package']);
  }

  static TextLeadingDistribution? _textLeadingDistributionAdapter(String? str) {
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

  static Offset? _offsetAdapter(Map? offset) {
    if (offset == null) return null;

    return Offset(offset['dx']?.toDouble() ?? 0, offset['dy']?.toDouble() ?? 0);
  }

  static Size? _sizeAdapter(Map? size) {
    if (size == null) return null;

    return Size(size['width']?.toDouble() ?? double.infinity,
        size['height']?.toDouble() ?? double.infinity);
  }

  static int _hexAdapter(String? hex) {
    if (hex == null || hex.isEmpty) return 0;
    if (hex.startsWith('0x')) {
      hex = hex.replaceFirst('0x', '');
    }
    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException('Invalid hexadecimal value');
      }
    }
    return val;
  }

  static IconData? _iconDataAdapter(Map? icon) {
    if (icon == null) return null;
    var cp = _hexAdapter(icon['codePoint']);
    var fm = icon['fontFamily'] ?? 'MaterialIcons';
    var md = icon['matchTextDirection'] ?? false;
    return IconData(cp, fontFamily: fm, matchTextDirection: md);
  }

  static BlendMode? _blendModeAdapter(String? blendModeString) {
    if (blendModeString == null || blendModeString.trim().length == 0) {
      return null;
    }

    switch (blendModeString.trim()) {
      case 'clear':
        return BlendMode.clear;
      case 'src':
        return BlendMode.src;
      case 'dst':
        return BlendMode.dst;
      case 'srcOver':
        return BlendMode.srcOver;
      case 'dstOver':
        return BlendMode.dstOver;
      case 'srcIn':
        return BlendMode.srcIn;
      case 'dstIn':
        return BlendMode.dstIn;
      case 'srcOut':
        return BlendMode.srcOut;
      case 'dstOut':
        return BlendMode.dstOut;
      case 'srcATop':
        return BlendMode.srcATop;
      case 'dstATop':
        return BlendMode.dstATop;
      case 'xor':
        return BlendMode.xor;
      case 'plus':
        return BlendMode.plus;
      case 'modulate':
        return BlendMode.modulate;
      case 'screen':
        return BlendMode.screen;
      case 'overlay':
        return BlendMode.overlay;
      case 'darken':
        return BlendMode.darken;
      case 'lighten':
        return BlendMode.lighten;
      case 'colorDodge':
        return BlendMode.colorDodge;
      case 'colorBurn':
        return BlendMode.colorBurn;
      case 'hardLight':
        return BlendMode.hardLight;
      case 'softLight':
        return BlendMode.softLight;
      case 'difference':
        return BlendMode.difference;
      case 'exclusion':
        return BlendMode.exclusion;
      case 'multiply':
        return BlendMode.multiply;
      case 'hue':
        return BlendMode.hue;
      case 'saturation':
        return BlendMode.saturation;
      case 'color':
        return BlendMode.color;
      case 'luminosity':
        return BlendMode.luminosity;

      default:
        return BlendMode.srcIn;
    }
  }

  static FilterQuality? _filterQualityAdapter(String? filterQualityString) {
    if (filterQualityString == null) {
      return null;
    }
    switch (filterQualityString) {
      case 'none':
        return FilterQuality.none;
      case 'low':
        return FilterQuality.low;
      case 'medium':
        return FilterQuality.medium;
      case 'high':
        return FilterQuality.high;
      default:
        return FilterQuality.low;
    }
  }

  static MouseCursor? _mouseCursorAdapter(String? mouseCursor) {
    if (mouseCursor != null) {
      switch (mouseCursor) {
        case 'basic':
          return SystemMouseCursors.basic;
        case 'click':
          return SystemMouseCursors.click;
        case 'forbidden':
          return SystemMouseCursors.forbidden;
        case 'wait':
          return SystemMouseCursors.wait;
        case 'progress':
          return SystemMouseCursors.progress;
        case 'contextMenu':
          return SystemMouseCursors.contextMenu;
        case 'help':
          return SystemMouseCursors.help;
        case 'text':
          return SystemMouseCursors.text;
        case 'verticalText':
          return SystemMouseCursors.verticalText;
        case 'cell':
          return SystemMouseCursors.cell;
        case 'precise':
          return SystemMouseCursors.precise;
        case 'move':
          return SystemMouseCursors.move;
        case 'grab':
          return SystemMouseCursors.grab;
        case 'noDrop':
          return SystemMouseCursors.noDrop;
        case 'alias':
          return SystemMouseCursors.alias;
        case 'copy':
          return SystemMouseCursors.copy;
        case 'disappearing':
          return SystemMouseCursors.disappearing;
        case 'allScroll':
          return SystemMouseCursors.allScroll;
        case 'resizeLeftRight':
          return SystemMouseCursors.resizeLeftRight;
        case 'resizeUpDown':
          return SystemMouseCursors.resizeUpDown;
        case 'resizeUpLeftDownRight':
          return SystemMouseCursors.resizeUpLeftDownRight;
        case 'resizeUpRightDownLeft':
          return SystemMouseCursors.resizeUpRightDownLeft;
        case 'resizeUp':
          return SystemMouseCursors.resizeUp;
        case 'resizeDown':
          return SystemMouseCursors.resizeDown;
        case 'resizeLeft':
          return SystemMouseCursors.resizeLeft;
        case 'resizeRight':
          return SystemMouseCursors.resizeRight;
        case 'resizeUpLeft':
          return SystemMouseCursors.resizeUpLeft;
        case 'resizeUpRight':
          return SystemMouseCursors.resizeUpRight;
        case 'resizeDownLeft':
          return SystemMouseCursors.resizeDownLeft;
        case 'resizeDownRight':
          return SystemMouseCursors.resizeDownRight;
        case 'resizeColumn':
          return SystemMouseCursors.resizeColumn;
        case 'resizeRow':
          return SystemMouseCursors.resizeRow;
        case 'zoomIn':
          return SystemMouseCursors.zoomIn;
        case 'zoomOut':
          return SystemMouseCursors.zoomOut;
        default:
          return SystemMouseCursors.none;
      }
    }
    return SystemMouseCursors.none;
  }

  static Curve? _curveAdapter(String? curve) {
    if (curve != null) {
      switch (curve) {
        case 'linear':
          return Curves.linear;
        case 'decelerate':
          return Curves.decelerate;
        case 'fastLinearToSlowEaseIn':
          return Curves.fastLinearToSlowEaseIn;
        case 'ease':
          return Curves.ease;
        case 'easeIn':
          return Curves.easeIn;
        case 'easeInToLinear':
          return Curves.easeInToLinear;
        case 'easeInSine':
          return Curves.easeInSine;
        case 'easeInQuad':
          return Curves.easeInQuad;
        case 'easeInCubic':
          return Curves.easeInCubic;
        case 'easeInQuart':
          return Curves.easeInQuart;
        case 'easeInQuint':
          return Curves.easeInQuint;
        case 'easeInExpo':
          return Curves.easeInExpo;
        case 'easeInCirc':
          return Curves.easeInCirc;
        case 'easeInBack':
          return Curves.easeInBack;
        case 'easeOut':
          return Curves.easeOut;
        case 'linearToEaseOut':
          return Curves.linearToEaseOut;
        case 'easeOutSine':
          return Curves.easeOutSine;
        case 'easeOutQuad':
          return Curves.easeOutQuad;
        case 'easeOutCubic':
          return Curves.easeOutCubic;
        case 'easeOutQuart':
          return Curves.easeOutQuart;
        case 'easeOutQuint':
          return Curves.easeOutQuint;
        case 'easeOutExpo':
          return Curves.easeOutExpo;
        case 'easeOutCirc':
          return Curves.easeOutCirc;
        case 'easeOutBack':
          return Curves.easeOutBack;
        case 'easeInOut':
          return Curves.easeInOut;
        case 'easeInOutSine':
          return Curves.easeInOutSine;
        case 'easeInOutQuad':
          return Curves.easeInOutQuad;
        case 'easeInOutCubic':
          return Curves.easeInOutCubic;
        case 'easeInOutQuart':
          return Curves.easeInOutQuart;
        case 'easeInOutQuint':
          return Curves.easeInOutQuint;
        case 'easeInOutExpo':
          return Curves.easeInOutExpo;
        case 'easeInOutCirc':
          return Curves.easeInOutCirc;
        case 'easeInOutBack':
          return Curves.easeInOutBack;
        case 'fastOutSlowIn':
          return Curves.fastOutSlowIn;
        case 'slowMiddle':
          return Curves.slowMiddle;
        case 'bounceIn':
          return Curves.bounceIn;
        case 'bounceOut':
          return Curves.bounceOut;
        case 'bounceInOut':
          return Curves.bounceInOut;
        case 'elasticIn':
          return Curves.elasticIn;
        case 'elasticOut':
          return Curves.elasticOut;
        case 'elasticInOut':
          return Curves.elasticInOut;
      }
      return null;
    }
  }

  static TextSpan? _textSpanAdapter(Map? map) {
    if (map == null) return null;
    var cs = map['children'];
    List<InlineSpan> cts = [];
    // 检查可能有点问题，等测试的时候验证一波
    if (cs != null && cs is List) {
      for (var c in cs) {
        var ts = _textSpanAdapter(c);
        if (ts != null) {
          cts.add(ts);
        }
      }
    }
    return TextSpan(
      text: map['text'],
      children: cts,
      style: adapt<TextStyle>(map['style']),
    );
  }

  static TextDecoration? _textDecorationAdapter(String? decoration) {
    if (decoration == null) return null;
    switch (decoration) {
      case 'none':
        return TextDecoration.none;
      case 'underline':
        return TextDecoration.underline;
      case 'overline':
        return TextDecoration.overline;
      case 'lineThrough':
        return TextDecoration.lineThrough;
    }
  }
}
