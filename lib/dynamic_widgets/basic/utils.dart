import 'package:flutter/material.dart';

class DynamicWidgetUtils {
  DynamicWidgetUtils._();

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

  static String? transformAlignment(Alignment? alignment) {
    if (alignment == Alignment.center) {
      return "center";
    }
    if (alignment == Alignment.bottomRight) {
      return "bottomRight";
    }
    if (alignment == Alignment.bottomCenter) {
      return "bottomCenter";
    }
    if (alignment == Alignment.bottomLeft) {
      return "bottomLeft";
    }
    if (alignment == Alignment.centerLeft) {
      return "centerLeft";
    }
    if (alignment == Alignment.centerRight) {
      return "centerRight";
    }
    if (alignment == Alignment.topCenter) {
      return "topCenter";
    }
    if (alignment == Alignment.topLeft) {
      return "topLeft";
    }
    if (alignment == Alignment.topRight) {
      return "topRight";
    }
    if (alignment == Alignment.bottomRight) {
      return "bottomRight";
    }

    return null;
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

  static String? transformTextAlign(TextAlign? textAlign) {
    String? rt;
    if (textAlign == TextAlign.left) {
      rt = "left";
    }
    if (textAlign == TextAlign.right) {
      rt = "right";
    }
    if (textAlign == TextAlign.center) {
      rt = "center";
    }
    if (textAlign == TextAlign.justify) {
      rt = "justify";
    }
    if (textAlign == TextAlign.start) {
      rt = "start";
    }
    if (textAlign == TextAlign.end) {
      rt = "end";
    }
    return rt;
  }

  ///adapt dsl color to the flutter color ff123456
  static Color? colorAdapter(String? colorString) {
    Color? color;
    if (colorString != null) {
      int? v = int.tryParse('0x' + colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }

  static String? transformColor(Color? color) {
    return color?.value.toRadixString(16);
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

  static Map<String, double?>? transformBoxConstraints(
      BoxConstraints? constraints) {
    if (constraints == null) return null;
    return {
      'minWidth': constraints.maxWidth,
      'maxWidth': constraints.maxWidth,
      'minHeight': constraints.minHeight,
      'maxHeight': constraints.maxHeight,
    };
  }

  static RoundedRectangleBorder? roundedRectangleBorderAdapter(
      Map<String, dynamic>? border) {
    if (border == null) return null;

    return RoundedRectangleBorder(
        side: borderSideAdapter(border['side']) ?? BorderSide.none,
        borderRadius:
            borderRadiusAdapter(border['borderRadius']) ?? BorderRadius.zero);
  }

  static Map<String, dynamic>? transformRoundedRectangleBorder(
      RoundedRectangleBorder? border) {
    if (border == null) return null;

    return {
      'side': transformBorderSide(border.side),
      'borderRadius': transformBorderRadius(border.borderRadius as BorderRadius?),
    };
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

  static Map<String, int?>? transformDuration(Duration? duration) {
    if (duration == null) return null;
    return {
      'days': duration.inDays,
      'hours': duration.inHours,
      'minutes': duration.inMinutes,
      'seconds': duration.inSeconds,
      'milliseconds': duration.inMilliseconds,
      'microseconds': duration.inMicroseconds,
    };
  }

  static BorderSide? borderSideAdapter(Map<String, dynamic>? side) {
    if (side == null) return null;

    return BorderSide(
        color: colorAdapter(side['color']) ?? const Color(0xFF000000),
        width: side['width'] ?? 1.0,
        style: borderStyleAdapter(side['style']) ?? BorderStyle.solid);
  }

  static Map<String, dynamic>? transformBorderSide(BorderSide? side) {
    if (side == null) return null;

    return {
      'color': transformColor(side.color),
      'width': side.width,
      'style': transformBorderStyle(side.style)
    };
  }

  static BorderRadius? borderRadiusAdapter(Map<String, double?>? borderRadius) {
    if (borderRadius == null) return null;

    return BorderRadius.only(
        topLeft: radiusAdapter(borderRadius['topLeft']) ?? Radius.zero,
        topRight: radiusAdapter(borderRadius['topRight']) ?? Radius.zero,
        bottomLeft: radiusAdapter(borderRadius['bottomLeft']) ?? Radius.zero,
        bottomRight: radiusAdapter(borderRadius['bottomRight']) ?? Radius.zero);
  }

  static Map<String, double?>? transformBorderRadius(BorderRadius? borderRadius) {
    if (borderRadius == null) return null;

    return {
      'topLeft': borderRadius.topLeft.x,
      'topRight': borderRadius.topRight.x,
      'bottomLeft': borderRadius.bottomLeft.x,
      'bottomRight': borderRadius.bottomRight.x,
    };
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

  static String? transformBorderStyle(BorderStyle? style) {
    if (style == null) return null;

    String? borderStyleStr;
    switch (style) {
      case BorderStyle.none:
        borderStyleStr = 'none';
        break;
      case BorderStyle.solid:
        borderStyleStr = 'solid';
        break;
      default:
    }
    return borderStyleStr;
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

  static String? transformFontWeight(FontWeight? fontWeight) {
    String? rt;
    if (fontWeight == FontWeight.w100) {
      rt = "w100";
    }
    if (fontWeight == FontWeight.w200) {
      rt = "w200";
    }
    if (fontWeight == FontWeight.w300) {
      rt = "w300";
    }
    if (fontWeight == FontWeight.w400) {
      rt = "w400";
    }
    if (fontWeight == FontWeight.w500) {
      rt = "w500";
    }
    if (fontWeight == FontWeight.w600) {
      rt = "w600";
    }
    if (fontWeight == FontWeight.w700) {
      rt = "w700";
    }
    if (fontWeight == FontWeight.w800) {
      rt = "w800";
    }
    if (fontWeight == FontWeight.w900) {
      rt = "w900";
    }
    return rt;
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

  static String? transformFontStyle(FontStyle? fontStyle) {
    String? fontStyleStr;
    switch (fontStyle) {
      case FontStyle.normal:
        fontStyleStr = 'normal';
        break;
      case FontStyle.italic:
        fontStyleStr = 'italic';
        break;
      default:
    }

    return fontStyleStr;
  }

  static EdgeInsets? edgeInsetAdapter(Map<dynamic, dynamic>? inset) {
    if (inset == null) {
      return null;
    }

    return EdgeInsets.fromLTRB(
        inset['left']?.toDouble() ?? 0.0,
        inset['top']?.toDouble() ?? 0.0,
        inset['right']?.toDouble() ?? 0.0,
        inset['bottom'].toDouble() ?? 0.0);
  }

  static Map<dynamic, dynamic>? transformEdgeInset(EdgeInsets? inset) {
    if (inset == null) {
      return null;
    }
    return {
      'left': inset.left,
      'right': inset.right,
      'top': inset.top,
      'bottom': inset.bottom,
    };
  }

  static Rect? rectAdapter(Map<dynamic, dynamic>? rect) {
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

  static String? transformMainAxisAlignment(MainAxisAlignment? mainAxisAlignment) {
    String? rt;
    if (mainAxisAlignment == MainAxisAlignment.end) {
      rt = "end";
    } else if (mainAxisAlignment == MainAxisAlignment.center) {
      rt = "center";
    } else if (mainAxisAlignment == MainAxisAlignment.spaceBetween) {
      rt = "spaceBetween";
    } else if (mainAxisAlignment == MainAxisAlignment.spaceAround) {
      rt = "spaceAround";
    } else if (mainAxisAlignment == MainAxisAlignment.spaceEvenly) {
      rt = "spaceEvenly";
    }
    return rt;
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

  static String? transformMainAxisSize(MainAxisSize? mainAxisSize) {
    String? _mainAxisSizeStr;
    switch (mainAxisSize) {
      case MainAxisSize.max:
        _mainAxisSizeStr = 'max';
        break;
      case MainAxisSize.min:
        _mainAxisSizeStr = 'min';
        break;
      default:
    }

    return _mainAxisSizeStr;
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

  static String? transformCrossAxisAlignment(CrossAxisAlignment? crossAxisAlignment) {
    String? rt;
    if (crossAxisAlignment == CrossAxisAlignment.start) {
      rt = "start";
    }
    if (crossAxisAlignment == CrossAxisAlignment.end) {
      rt = "end";
    }
    if (crossAxisAlignment == CrossAxisAlignment.center) {
      rt = "center";
    }
    if (crossAxisAlignment == CrossAxisAlignment.stretch) {
      rt = "stretch";
    }
    if (crossAxisAlignment == CrossAxisAlignment.baseline) {
      rt = "baseline";
    }

    return rt;
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

  static String? transformTextDirection(TextDirection? _textDirection) {
    String? _textDirectionStr;
    switch (_textDirection) {
      case TextDirection.ltr:
        _textDirectionStr = 'ltr';
        break;
      case TextDirection.rtl:
        _textDirectionStr = 'rtl';
        break;
      default:
    }
    return _textDirectionStr;
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

  static String? transformTextOverflow(TextOverflow? textOverflow) {
    String? _textOverflowStr;
    switch (textOverflow) {
      case TextOverflow.clip:
        _textOverflowStr = 'clip';
        break;
      case TextOverflow.fade:
        _textOverflowStr = 'fade';
        break;
      case TextOverflow.ellipsis:
        _textOverflowStr = 'ellipsis';
        break;
      case TextOverflow.visible:
        _textOverflowStr = 'visible';
        break;
      default:
    }
    return _textOverflowStr;
  }

  static TextHeightBehavior? textHeightBehaviorAdapter(
      Map<dynamic, dynamic>? behavior) {
    if (behavior == null) return null;

    return TextHeightBehavior(
        applyHeightToFirstAscent: behavior['applyHeightToFirstAscent'] ?? true,
        applyHeightToLastDescent: behavior['applyHeightToLastDescent'] ?? true,
        leadingDistribution:
            textLeadingDistributionAdapter(behavior['leadingDistribution']) ??
                TextLeadingDistribution.proportional);
  }

  static Map<dynamic, dynamic>? transformTextHeightBehavior(
      TextHeightBehavior? behavior) {
    if (behavior == null) return null;
    return {
      'applyHeightToFirstAscent': behavior.applyHeightToFirstAscent,
      'applyHeightToLastDescent': behavior.applyHeightToLastDescent,
      'leadingDistribution': transformTextLeadingDistribution(behavior.leadingDistribution),
    };
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

  static String? transformVerticalDirection(VerticalDirection? _verticalDirection) {
    String? _verticalDirectionStr;
    switch (_verticalDirection) {
      case VerticalDirection.down:
        _verticalDirectionStr = 'down';
        break;
      case VerticalDirection.up:
        _verticalDirectionStr = 'up';
        break;
      default:
    }

    return _verticalDirectionStr;
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

  static String? transformTextBaseline(TextBaseline? textBaseline) {
    String? _textBaselineStr;
    switch (textBaseline) {
      case TextBaseline.alphabetic:
        _textBaselineStr = 'alphabetic';
        break;
      case TextBaseline.ideographic:
        _textBaselineStr = 'ideographic';
        break;
      default:
    }

    return _textBaselineStr;
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

  static String? transformClipBehavior(Clip? clip) {
    String? _clipStr;
    switch (clip) {
      case  Clip.antiAlias:
        _clipStr = 'antiAlias';
        break;
      case Clip.antiAliasWithSaveLayer:
        _clipStr = 'antiAliasWithSaveLayer';
        break;
      case Clip.hardEdge:
        _clipStr = 'hardEdge';
        break;
      case Clip.none:
        _clipStr = 'none';
        break;
      default:
    }

    return _clipStr;
  }

  static TextStyle? textStyleAdapter(Map<dynamic, dynamic>? style) {
    if (style == null) return null;

    return TextStyle(
        inherit: style['inherit'] ?? true,
        color: colorAdapter(style['color']),
        backgroundColor: colorAdapter(style['backgroundColor']),
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

  static Map? transformTextStyle(TextStyle? style) {
    if (style == null) return null;
    return {
      'inherit': style.inherit,
      'color': transformColor(style.color),
      'backgroundColor': style.backgroundColor?.value.toRadixString(16),
      'fontSize': style.fontSize,
      'fontWeight': transformFontWeight(style.fontWeight),
      'fontStyle': transformFontStyle(style.fontStyle),
      'letterSpacing': style.letterSpacing,
      'wordSpacing': style.wordSpacing,
      'textBaseline': transformTextBaseline(style.textBaseline),
      'height': style.height,
      'leadingDistribution': transformTextLeadingDistribution(style.leadingDistribution),
      'debugLabel': style.debugLabel,
      'fontFamily': style.fontFamily,
      'fontFamilyFallback': style.fontFamilyFallback,
    };
  }

  static StrutStyle? strutStyleAdapter(Map<dynamic, dynamic>? style) {
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

  static Map<dynamic, dynamic>? transformStrutStyle(StrutStyle? style) {
    if (style == null) return null;
    
    return {
      'fontFamily': style.fontFamily,
      'fontFamilyFallback': style.fontFamilyFallback,
      'fontSize': style.fontSize,
      'height': style.height,
      'leadingDistribution': transformTextLeadingDistribution(style.leadingDistribution),
      'leading': style.leading,
      'fontWeight': transformFontWeight(style.fontWeight),
      'fontStyle': transformFontStyle(style.fontStyle),
      'forceStrutHeight': style.forceStrutHeight,
      'debugLabel': style.debugLabel,
    };
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

  static String?  transformTextLeadingDistribution(TextLeadingDistribution? textLeadingDistribution) {
    String?  _textLeadingDistributionStr;
    switch (textLeadingDistribution) {
      case TextLeadingDistribution.proportional:
        _textLeadingDistributionStr = 'proportional';
        break;
      case TextLeadingDistribution.even:
        _textLeadingDistributionStr = 'even';
        break;
      default:
    }

    return _textLeadingDistributionStr;
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

  static Offset? offsetAdapter(Map<dynamic, double?>? offset) {
    if (offset == null) return null;

    return Offset(offset['dx'] ?? 0, offset['dy'] ?? 0);
  }

  static Size? sizeAdapter(Map<String, double?>? size) {
    if (size == null) return null;

    return Size(
        size['width'] ?? double.infinity, size['height'] ?? double.infinity);
  }

  static int hexToInt(String? hex) {
    if(hex==null || hex.isEmpty) return 0;
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
        throw new FormatException("Invalid hexadecimal value");
      }
    }
    return val;
  }

  static IconData? iconDataAdapter(Map<dynamic, dynamic>? icon) {
    if (icon == null) return null;
    var cp = hexToInt(icon['codePoint']);
    return IconData(cp, fontFamily: icon['fontFamily'],
        matchTextDirection: icon['matchTextDirection'] ?? false);
  }

  static Map<String, dynamic>? transformIconData(IconData? icon) {
    if (icon == null) return null;
    return {
      'codePoint': icon.codePoint.toRadixString(16),
      'fontFamily': icon.fontFamily,
      'matchTextDirection': icon.matchTextDirection
    };
  }
}
