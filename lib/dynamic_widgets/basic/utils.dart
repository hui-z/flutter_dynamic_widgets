import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/custom_widget/check_list.dart';

class DynamicWidgetUtils {
  DynamicWidgetUtils._();

  static dynamic transform(dynamic origin) {
    if (origin == null) return null;
    if (origin is Alignment) {
      return _transformAlignment(origin);
    }
    if (origin is TextAlign) {
      return _transformTextAlign(origin);
    }
    if (origin is Color) {
      return _transformColor(origin);
    }
    if (origin is BoxConstraints) {
      return _transformBoxConstraints(origin);
    }
    if (origin is RoundedRectangleBorder) {
      return transformRoundedRectangleBorder(origin);
    }
    if (origin is Duration) {
      return _transformDuration(origin);
    }
    if (origin is BorderSide) {
      return _transformBorderSide(origin);
    }
    if (origin is BorderStyle) {
      return _transformBorderStyle(origin);
    }
    if (origin is FontWeight) {
      return transformFontWeight(origin);
    }
    if (origin is FontStyle) {
      return _transformFontStyle(origin);
    }
    if (origin is EdgeInsets) {
      return _transformEdgeInset(origin);
    }
    if (origin is MainAxisAlignment) {
      return transformMainAxisAlignment(origin);
    }
    if (origin is MainAxisSize) {
      return _transformMainAxisSize(origin);
    }
    if (origin is CrossAxisAlignment) {
      return _transformCrossAxisAlignment(origin);
    }
    if (origin is TextDirection) {
      return _transformTextDirection(origin);
    }
    if (origin is TextOverflow) {
      return _transformTextOverflow(origin);
    }
    if (origin is VerticalDirection) {
      return _transformVerticalDirection(origin);
    }
    if (origin is TextHeightBehavior) {
      return _transformTextHeightBehavior(origin);
    }
    if (origin is TextBaseline) {
      return _transformTextBaseline(origin);
    }
    if (origin is Clip) {
      return _transformClipBehavior(origin);
    }
    if (origin is TextStyle) {
      return _transformTextStyle(origin);
    }
    if (origin is StrutStyle) {
      return _transformStrutStyle(origin);
    }
    if (origin is TextLeadingDistribution) {
      return _transformTextLeadingDistribution(origin);
    }
    if (origin is IconData) {
      return _transformIconData(origin);
    }
    if (origin is FilterQuality) {
      return _transformFilterQuality(origin);
    }
    if (origin is BlendMode) {
      return _transformBlendMode(origin);
    }
    if (origin is Rect) {
      return _transformRect(origin);
    }
    if (origin is BoxFit) {
      return _transformBoxFit(origin);
    }
    if (origin is ImageRepeat) {
      return _transformImageRepeat(origin);
    }
    if (origin is BorderRadius) {
      return transformBorderRadius(origin);
    }
    if (origin is TextInputType) {
      return _transformInputType(origin);
    }
    if (origin is StackFit) {
      return _transformStackFit(origin);
    }
    if (origin is WrapAlignment) {
      return _transformWrapAlignment(origin);
    }
    if (origin is WrapCrossAlignment) {
      return _transformWrapCrossAlignment(origin);
    }
    if (origin is Axis) {
      return _transformAxis(origin);
    }
    if (origin is Offset) {
      return _transformOffset(origin);
    }
    if (origin is Size) {
      return _transformSize(origin);
    }
    if (origin is DragStartBehavior) {
      return _transformDragStartBehavior(origin);
    }
    if (origin is ScrollViewKeyboardDismissBehavior) {
      return _transformScrollViewKeyboardDismissBehavior(origin);
    }
    if (origin is MouseCursor) {
      return _transformMouseCursor(origin);
    }
    if (origin is Curve) {
      return _transformCurve(origin);
    }
    if(origin is TextSpan){
      return _transformTextSpan(origin);
    }
    throw UnimplementedError('请实现 ${origin.runtimeType} transform');
  }

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
        return durationAdapter(origin as Map?) as T?;
      case BorderSide:
        return borderSideAdapter(origin as Map?) as T?;
      case BorderStyle:
        return borderStyleAdapter(origin as String?) as T?;
      case FontWeight:
        return fontWeightAdapter(origin as String?) as T?;
      case FontStyle:
        return fontStyleAdapter(origin as String?) as T?;
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
        return borderRadiusAdapter(origin as Map?) as T?;
      case Radius:
        return radiusAdapter(origin as double?) as T?;
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
        return _scrollViewKeyboardDismissBehaviorAdapter(
            origin as String?) as T?;
      case MouseCursor:
        return _mouseCursorAdapter(origin as String?) as T?;
      case Curve:
        return _curveAdapter(origin as String?) as T?;
      case TextSpan:
        return _textSpanAdapter(origin as Map?) as T?;
    }
    throw UnimplementedError('请实现 $T 的adapt方法');
  }

  static ScrollViewKeyboardDismissBehavior? _scrollViewKeyboardDismissBehaviorAdapter(
      String? str) {
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

  static String? _transformScrollViewKeyboardDismissBehavior(
      ScrollViewKeyboardDismissBehavior? behavior) {
    if (behavior == null) return null;

    String? scrollViewKeyboardDismissBehaviorStr;
    switch (behavior) {
      case ScrollViewKeyboardDismissBehavior.manual:
        scrollViewKeyboardDismissBehaviorStr = 'down';
        break;
      case ScrollViewKeyboardDismissBehavior.onDrag:
        scrollViewKeyboardDismissBehaviorStr = 'start';
        break;
      default:
    }
    return scrollViewKeyboardDismissBehaviorStr;
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

  static String? _transformDragStartBehavior(DragStartBehavior? behavior) {
    if (behavior == null) return null;

    String? dragStartBehaviorStr;
    switch (behavior) {
      case DragStartBehavior.down:
        dragStartBehaviorStr = 'down';
        break;
      case DragStartBehavior.start:
        dragStartBehaviorStr = 'start';
        break;
      default:
    }
    return dragStartBehaviorStr;
  }

  static String? _transformColor(Color? color) {
    return color?.value.toRadixString(16);
  }

  static Map? _transformBoxConstraints(BoxConstraints? constraints) {
    if (constraints == null) return null;
    return {
      'minWidth': constraints.minWidth,
      'maxWidth': constraints.maxWidth,
      'minHeight': constraints.minHeight,
      'maxHeight': constraints.maxHeight,
    };
  }

  static Map? _transformDuration(Duration? duration) {
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

  static Map? _transformBorderSide(BorderSide? side) {
    if (side == null) return null;

    return {
      'color': transform(side.color),
      'width': side.width,
      'style': transform(side.style)
    };
  }

  static String? _transformBorderStyle(BorderStyle? style) {
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

  static String? _transformFontStyle(FontStyle? fontStyle) {
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

  static Map? _transformEdgeInset(EdgeInsets? inset) {
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

  static String? _transformMainAxisSize(MainAxisSize? mainAxisSize) {
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

  static String? _transformTextDirection(TextDirection? _textDirection) {
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

  static String? _transformTextOverflow(TextOverflow? textOverflow) {
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

  static String? _transformTextBaseline(TextBaseline? textBaseline) {
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

  static String? _transformAlignment(Alignment? alignment) {
    if (alignment == Alignment.center) {
      return 'center';
    }
    if (alignment == Alignment.bottomRight) {
      return 'bottomRight';
    }
    if (alignment == Alignment.bottomCenter) {
      return 'bottomCenter';
    }
    if (alignment == Alignment.bottomLeft) {
      return 'bottomLeft';
    }
    if (alignment == Alignment.centerLeft) {
      return 'centerLeft';
    }
    if (alignment == Alignment.centerRight) {
      return 'centerRight';
    }
    if (alignment == Alignment.topCenter) {
      return 'topCenter';
    }
    if (alignment == Alignment.topLeft) {
      return 'topLeft';
    }
    if (alignment == Alignment.topRight) {
      return 'topRight';
    }
    if (alignment == Alignment.bottomRight) {
      return 'bottomRight';
    }

    return null;
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

  static String? _transformTextAlign(TextAlign? textAlign) {
    String? rt;
    if (textAlign == TextAlign.left) {
      rt = 'left';
    }
    if (textAlign == TextAlign.right) {
      rt = 'right';
    }
    if (textAlign == TextAlign.center) {
      rt = 'center';
    }
    if (textAlign == TextAlign.justify) {
      rt = 'justify';
    }
    if (textAlign == TextAlign.start) {
      rt = 'start';
    }
    if (textAlign == TextAlign.end) {
      rt = 'end';
    }
    return rt;
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
          minWidth: constraints['minWidth']?.toDouble() ?? 0.0,
          maxWidth: constraints['maxWidth']?.toDouble() ?? double.infinity,
          minHeight: constraints['minHeight']?.toDouble() ?? 0.0,
          maxHeight: constraints['maxHeight']?.toDouble() ?? double.infinity);
    }

    return boxConstraints;
  }

  static RoundedRectangleBorder? _roundedRectangleBorderAdapter(Map? border) {
    if (border == null) return null;

    return RoundedRectangleBorder(
        side: adapt(border['side']) ?? BorderSide.none,
        borderRadius: adapt(border['borderRadius']) ?? BorderRadius.zero);
  }

  static Map? transformRoundedRectangleBorder(RoundedRectangleBorder? border) {
    if (border == null) return null;

    return {
      'side': transform(border.side),
      'borderRadius': transform(border.borderRadius as BorderRadius?),
    };
  }

  static Duration? durationAdapter(Map? duration) {
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

  static BorderSide? borderSideAdapter(Map? side) {
    if (side == null) return null;

    return BorderSide(
        color: adapt(side['color']) ?? const Color(0xFF000000),
        width: side['width'] ?? 1.0,
        style: adapt(side['style']) ?? BorderStyle.solid);
  }

  static BorderRadius? borderRadiusAdapter(Map? borderRadius) {
    if (borderRadius == null) return null;

    return BorderRadius.only(
        topLeft: adapt(borderRadius['topLeft']?.toDouble()) ?? Radius.zero,
        topRight: adapt(borderRadius['topRight']?.toDouble()) ?? Radius.zero,
        bottomLeft: adapt(borderRadius['bottomLeft']?.toDouble()) ??
            Radius.zero,
        bottomRight: adapt(borderRadius['bottomRight']?.toDouble()) ??
            Radius.zero);
  }

  static Map? transformBorderRadius(BorderRadius? borderRadius) {
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
      rt = 'w100';
    }
    if (fontWeight == FontWeight.w200) {
      rt = 'w200';
    }
    if (fontWeight == FontWeight.w300) {
      rt = 'w300';
    }
    if (fontWeight == FontWeight.w400) {
      rt = 'w400';
    }
    if (fontWeight == FontWeight.w500) {
      rt = 'w500';
    }
    if (fontWeight == FontWeight.w600) {
      rt = 'w600';
    }
    if (fontWeight == FontWeight.w700) {
      rt = 'w700';
    }
    if (fontWeight == FontWeight.w800) {
      rt = 'w800';
    }
    if (fontWeight == FontWeight.w900) {
      rt = 'w900';
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

  static Map? _transformRect(Rect? rect) {
    if (rect == null) {
      return null;
    }
    return {
      'left': rect.left,
      'top': rect.top,
      'right': rect.right,
      'bottom': rect.bottom
    };
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

  static String? _transformInputType(TextInputType? inputType) {
    String? inputTypeStr;
    if (inputType == TextInputType.datetime) {
      inputTypeStr = 'datetime';
    } else if (inputType == TextInputType.emailAddress) {
      inputTypeStr = 'emailAddress';
    } else if (inputType == TextInputType.number) {
      inputTypeStr = 'number';
    } else if (inputType == TextInputType.phone) {
      inputTypeStr = 'phone';
    } else if (inputType == TextInputType.multiline) {
      inputTypeStr = 'multiline';
    } else if (inputType == TextInputType.text) {
      inputTypeStr = 'text';
    } else if (inputType == TextInputType.url) {
      inputTypeStr = 'url';
    } else if (inputType == TextInputType.visiblePassword) {
      inputTypeStr = 'visiblePassword';
    }
    return inputTypeStr;
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

  static String? _transformBoxFit(BoxFit? boxFit) {
    if (boxFit == BoxFit.fill) {
      return 'fill';
    }
    if (boxFit == BoxFit.cover) {
      return 'cover';
    }
    if (boxFit == BoxFit.fitWidth) {
      return 'fitWidth';
    }
    if (boxFit == BoxFit.fitHeight) {
      return 'fitHeight';
    }
    if (boxFit == BoxFit.none) {
      return 'none';
    }
    if (boxFit == BoxFit.scaleDown) {
      return 'scaleDown';
    }
    return null;
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

  static String? _transformStackFit(StackFit? boxFit) {
    String? _boxFitStr;
    switch (boxFit) {
      case StackFit.loose:
        _boxFitStr = 'loose';
        break;
      case StackFit.expand:
        _boxFitStr = 'expand';
        break;
      case StackFit.passthrough:
        _boxFitStr = 'passthrough';
        break;

      default:
    }

    return _boxFitStr;
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

  static String? _transformImageRepeat(ImageRepeat imageRepeat) {
    if (imageRepeat == ImageRepeat.repeat) {
      return 'repeat';
    }
    if (imageRepeat == ImageRepeat.repeatX) {
      return 'repeatX';
    }
    if (imageRepeat == ImageRepeat.repeatY) {
      return 'repeatY';
    }
    return null;
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

  static String? transformMainAxisAlignment(
      MainAxisAlignment? mainAxisAlignment) {
    String? rt;
    if (mainAxisAlignment == MainAxisAlignment.end) {
      rt = 'end';
    } else if (mainAxisAlignment == MainAxisAlignment.center) {
      rt = 'center';
    } else if (mainAxisAlignment == MainAxisAlignment.spaceBetween) {
      rt = 'spaceBetween';
    } else if (mainAxisAlignment == MainAxisAlignment.spaceAround) {
      rt = 'spaceAround';
    } else if (mainAxisAlignment == MainAxisAlignment.spaceEvenly) {
      rt = 'spaceEvenly';
    }
    return rt;
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

  static String? _transformCrossAxisAlignment(
      CrossAxisAlignment? crossAxisAlignment) {
    String? rt;
    if (crossAxisAlignment == CrossAxisAlignment.start) {
      rt = 'start';
    }
    if (crossAxisAlignment == CrossAxisAlignment.end) {
      rt = 'end';
    }
    if (crossAxisAlignment == CrossAxisAlignment.center) {
      rt = 'center';
    }
    if (crossAxisAlignment == CrossAxisAlignment.stretch) {
      rt = 'stretch';
    }
    if (crossAxisAlignment == CrossAxisAlignment.baseline) {
      rt = 'baseline';
    }

    return rt;
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

  static String? _transformWrapAlignment(WrapAlignment? wrapAlignment) {
    String? _wrapAlignmentStr;
    switch (wrapAlignment) {
      case WrapAlignment.center:
        _wrapAlignmentStr = 'center';
        break;
      case WrapAlignment.end:
        _wrapAlignmentStr = 'end';
        break;
      case WrapAlignment.spaceAround:
        _wrapAlignmentStr = 'spaceAround';
        break;
      case WrapAlignment.spaceBetween:
        _wrapAlignmentStr = 'spaceBetween';
        break;
      case WrapAlignment.spaceEvenly:
        _wrapAlignmentStr = 'spaceEvenly';
        break;
      case WrapAlignment.start:
        _wrapAlignmentStr = 'start';
        break;
      default:
    }

    return _wrapAlignmentStr;
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

  static String? _transformWrapCrossAlignment(
      WrapCrossAlignment? wrapCrossAlignment) {
    String? _wrapCrossAlignmentStr;
    switch (wrapCrossAlignment) {
      case WrapCrossAlignment.center:
        _wrapCrossAlignmentStr = 'center';
        break;
      case WrapCrossAlignment.end:
        _wrapCrossAlignmentStr = 'end';
        break;
      case WrapCrossAlignment.start:
        _wrapCrossAlignmentStr = 'start';
        break;
      default:
    }

    return _wrapCrossAlignmentStr;
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

  static Map? _transformTextHeightBehavior(TextHeightBehavior? behavior) {
    if (behavior == null) return null;
    return {
      'applyHeightToFirstAscent': behavior.applyHeightToFirstAscent,
      'applyHeightToLastDescent': behavior.applyHeightToLastDescent,
      'leadingDistribution':
      transform(behavior.leadingDistribution),
    };
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

  static String? _transformVerticalDirection(
      VerticalDirection? _verticalDirection) {
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

  static String? _transformAxis(Axis? axis) {
    String? _axisStr;
    switch (axis) {
      case Axis.horizontal:
        _axisStr = 'horizontal';
        break;
      case Axis.vertical:
        _axisStr = 'vertical';
        break;
      default:
    }

    return _axisStr;
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

  static String? _transformClipBehavior(Clip? clip) {
    String? _clipStr;
    switch (clip) {
      case Clip.antiAlias:
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

  static TextStyle? _textStyleAdapter(Map? style) {
    if (style == null) return null;

    return TextStyle(
        inherit: style['inherit'] ?? true,
        color: adapt(style['color']),
        backgroundColor: adapt(style['backgroundColor']),
        fontSize: style['fontSize'],
        fontWeight: adapt(style['fontWeight']),
        fontStyle: adapt(style['fontStyle']),
        letterSpacing: style['letterSpacing'],
        wordSpacing: style['wordSpacing'],
        textBaseline: adapt(style['textBaseline']),
        height: style['height'],
        leadingDistribution: adapt(style['leadingDistribution']),
        debugLabel: style['debugLabel'],
        fontFamily: style['fontFamily'],
        fontFamilyFallback: style['fontFamilyFallback']?.cast<String>(),
        package: style['package']);
  }

  static Map? _transformTextStyle(TextStyle? style) {
    if (style == null) return null;
    return {
      'inherit': style.inherit,
      'color': transform(style.color),
      'backgroundColor': style.backgroundColor?.value.toRadixString(16),
      'fontSize': style.fontSize,
      'fontWeight': transform(style.fontWeight),
      'fontStyle': transform(style.fontStyle),
      'letterSpacing': style.letterSpacing,
      'wordSpacing': style.wordSpacing,
      'textBaseline': transform(style.textBaseline),
      'height': style.height,
      'leadingDistribution': transform(style.leadingDistribution),
      'debugLabel': style.debugLabel,
      'fontFamily': style.fontFamily,
      'fontFamilyFallback': style.fontFamilyFallback,
    };
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

  static Map? _transformStrutStyle(StrutStyle? style) {
    if (style == null) return null;

    return {
      'fontFamily': style.fontFamily,
      'fontFamilyFallback': style.fontFamilyFallback,
      'fontSize': style.fontSize,
      'height': style.height,
      'leadingDistribution': transform(style.leadingDistribution),
      'leading': style.leading,
      'fontWeight': transform(style.fontWeight),
      'fontStyle': transform(style.fontStyle),
      'forceStrutHeight': style.forceStrutHeight,
      'debugLabel': style.debugLabel,
    };
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

  static String? _transformTextLeadingDistribution(
      TextLeadingDistribution? textLeadingDistribution) {
    String? _textLeadingDistributionStr;
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

  static Offset? _offsetAdapter(Map? offset) {
    if (offset == null) return null;

    return Offset(offset['dx']?.toDouble() ?? 0, offset['dy']?.toDouble() ?? 0);
  }

  static Map? _transformOffset(Offset? offset) {
    if (offset == null) return null;

    return {
      'dx': offset.dx,
      'dy': offset.dy
    };
  }

  static Size? _sizeAdapter(Map? size) {
    if (size == null) return null;

    return Size(
        size['width']?.toDouble() ?? double.infinity,
        size['height']?.toDouble() ?? double.infinity);
  }

  static Map? _transformSize(Size? size) {
    if (size == null) return null;

    return {
      'width': size.width,
      'height': size.height
    };
  }

  static int hexToInt(String? hex) {
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
    var cp = hexToInt(icon['codePoint']);
    return IconData(cp,
        fontFamily: icon['fontFamily'],
        matchTextDirection: icon['matchTextDirection'] ?? false);
  }

  static BlendMode? _blendModeAdapter(String? blendModeString) {
    if (blendModeString == null || blendModeString
        .trim()
        .length == 0) {
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

  static String? _transformBlendMode(BlendMode? blendMode) {
    if (blendMode == null) {
      return null;
    }
    String rt = 'srcIn';
    if (blendMode == BlendMode.clear) {
      rt = 'clear';
    }
    if (blendMode == BlendMode.src) {
      rt = 'src';
    }
    if (blendMode == BlendMode.dst) {
      rt = 'dst';
    }
    if (blendMode == BlendMode.srcOver) {
      rt = 'srcOver';
    }
    if (blendMode == BlendMode.dstOver) {
      rt = 'dstOver';
    }
    if (blendMode == BlendMode.srcIn) {
      rt = 'srcIn';
    }
    if (blendMode == BlendMode.dstIn) {
      rt = 'dstIn';
    }
    if (blendMode == BlendMode.srcOut) {
      rt = 'srcOut';
    }
    if (blendMode == BlendMode.dstOut) {
      rt = 'dstOut';
    }
    if (blendMode == BlendMode.srcATop) {
      rt = 'srcATop';
    }
    if (blendMode == BlendMode.dstATop) {
      rt = 'dstATop';
    }
    if (blendMode == BlendMode.xor) {
      rt = 'xor';
    }
    if (blendMode == BlendMode.plus) {
      rt = 'plus';
    }
    if (blendMode == BlendMode.modulate) {
      rt = 'modulate';
    }
    if (blendMode == BlendMode.screen) {
      rt = 'screen';
    }
    if (blendMode == BlendMode.overlay) {
      rt = 'overlay';
    }
    if (blendMode == BlendMode.darken) {
      rt = 'darken';
    }
    if (blendMode == BlendMode.lighten) {
      rt = 'lighten';
    }
    if (blendMode == BlendMode.colorDodge) {
      rt = 'colorDodge';
    }
    if (blendMode == BlendMode.colorBurn) {
      rt = 'colorBurn';
    }
    if (blendMode == BlendMode.hardLight) {
      rt = 'hardLight';
    }
    if (blendMode == BlendMode.softLight) {
      rt = 'softLight';
    }
    if (blendMode == BlendMode.difference) {
      rt = 'difference';
    }
    if (blendMode == BlendMode.exclusion) {
      rt = 'exclusion';
    }
    if (blendMode == BlendMode.multiply) {
      rt = 'multiply';
    }
    if (blendMode == BlendMode.hue) {
      rt = 'hue';
    }
    if (blendMode == BlendMode.saturation) {
      rt = 'saturation';
    }
    if (blendMode == BlendMode.color) {
      rt = 'color';
    }
    if (blendMode == BlendMode.luminosity) {
      rt = 'luminosity';
    }

    return rt;
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

  static String? _transformFilterQuality(FilterQuality? filterQuality) {
    if (filterQuality == null) return null;
    if (filterQuality == FilterQuality.none) {
      return "none";
    }
    if (filterQuality == FilterQuality.low) {
      return "low";
    }
    if (filterQuality == FilterQuality.medium) {
      return "medium";
    }
    if (filterQuality == FilterQuality.high) {
      return "high";
    }
    return null;
  }

  static Map? _transformIconData(IconData? icon) {
    if (icon == null) return null;
    return {
      'codePoint': icon.codePoint.toRadixString(16),
      'fontFamily': icon.fontFamily,
      'matchTextDirection': icon.matchTextDirection
    };
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

  static String? _transformMouseCursor(MouseCursor? mouseCursor) {
    if (mouseCursor == null) {
      return null;
    }
    if (mouseCursor == SystemMouseCursors.basic)
      return 'basic';

    if (mouseCursor == SystemMouseCursors.click)
      return 'click';

    if (mouseCursor == SystemMouseCursors.forbidden)
      return 'forbidden';

    if (mouseCursor == SystemMouseCursors.wait)
      return 'wait';

    if (mouseCursor == SystemMouseCursors.progress)
      return 'progress';

    if (mouseCursor == SystemMouseCursors.contextMenu)
      return 'contextMenu';

    if (mouseCursor == SystemMouseCursors.help)
      return 'help';

    if (mouseCursor == SystemMouseCursors.text)
      return 'text';

    if (mouseCursor == SystemMouseCursors.verticalText)
      return 'verticalText';

    if (mouseCursor == SystemMouseCursors.cell)
      return 'cell';

    if (mouseCursor == SystemMouseCursors.precise)
      return 'precise';

    if (mouseCursor == SystemMouseCursors.move)
      return 'move';

    if (mouseCursor == SystemMouseCursors.grab)
      return 'grab';

    if (mouseCursor == SystemMouseCursors.noDrop)
      return 'noDrop';

    if (mouseCursor == SystemMouseCursors.alias)
      return 'alias';

    if (mouseCursor == SystemMouseCursors.copy)
      return 'copy';

    if (mouseCursor == SystemMouseCursors.disappearing)
      return 'disappearing';

    if (mouseCursor == SystemMouseCursors.allScroll)
      return 'allScroll';

    if (mouseCursor == SystemMouseCursors.resizeLeftRight)
      return 'resizeLeftRight';

    if (mouseCursor == SystemMouseCursors.resizeUpDown)
      return 'resizeUpDown';

    if (mouseCursor == SystemMouseCursors.resizeUpLeftDownRight)
      return 'resizeUpLeftDownRight';

    if (mouseCursor == SystemMouseCursors.resizeUpRightDownLeft)
      return 'resizeUpRightDownLeft';

    if (mouseCursor == SystemMouseCursors.resizeUp)
      return 'resizeUp';

    if (mouseCursor == SystemMouseCursors.resizeDown)
      return 'resizeDown';

    if (mouseCursor == SystemMouseCursors.resizeLeft)
      return 'resizeLeft';

    if (mouseCursor == SystemMouseCursors.resizeRight)
      return 'resizeRight';

    if (mouseCursor == SystemMouseCursors.resizeUpLeft)
      return 'resizeUpLeft';

    if (mouseCursor == SystemMouseCursors.resizeUpRight)
      return 'resizeUpRight';

    if (mouseCursor == SystemMouseCursors.resizeDownLeft)
      return 'resizeDownLeft';

    if (mouseCursor == SystemMouseCursors.resizeDownRight)
      return 'resizeDownRight';

    if (mouseCursor == SystemMouseCursors.resizeColumn)
      return 'resizeColumn';

    if (mouseCursor == SystemMouseCursors.resizeRow)
      return 'resizeRow';

    if (mouseCursor == SystemMouseCursors.zoomIn)
      return 'zoomIn';

    if (mouseCursor == SystemMouseCursors.zoomOut)
      return 'zoomOut';

    return 'none';
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

  static String? _transformCurve(Curve? curve) {
    if (curve == null) {
      return null;
    }

    if (curve == Curves.linear) return 'linear';

    if (curve == Curves.decelerate) return 'decelerate';

    if (curve == Curves.fastLinearToSlowEaseIn) return 'fastLinearToSlowEaseIn';

    if (curve == Curves.ease) return 'ease';

    if (curve == Curves.easeIn) return 'easeIn';

    if (curve == Curves.easeInToLinear) return 'easeInToLinear';

    if (curve == Curves.easeInSine) return 'easeInSine';

    if (curve == Curves.easeInQuad) return 'easeInQuad';

    if (curve == Curves.easeInCubic) return 'easeInCubic';

    if (curve == Curves.easeInQuart) return 'easeInQuart';

    if (curve == Curves.easeInQuint) return 'easeInQuint';

    if (curve == Curves.easeInExpo) return 'easeInExpo';

    if (curve == Curves.easeInCirc) return 'easeInCirc';

    if (curve == Curves.easeInBack) return 'easeInBack';

    if (curve == Curves.easeOut) return 'easeOut';

    if (curve == Curves.linearToEaseOut) return 'linearToEaseOut';

    if (curve == Curves.easeOutSine) return 'easeOutSine';

    if (curve == Curves.easeOutQuad) return 'easeOutQuad';

    if (curve == Curves.easeOutCubic) return 'easeOutCubic';

    if (curve == Curves.easeOutQuart) return 'easeOutQuart';

    if (curve == Curves.easeOutQuint) return 'easeOutQuint';

    if (curve == Curves.easeOutExpo) return 'easeOutExpo';

    if (curve == Curves.easeOutCirc) return 'easeOutCirc';

    if (curve == Curves.easeOutBack) return 'easeOutBack';

    if (curve == Curves.easeInOut) return 'easeInOut';

    if (curve == Curves.easeInOutSine) return 'easeInOutSine';

    if (curve == Curves.easeInOutQuad) return 'easeInOutQuad';

    if (curve == Curves.easeInOutCubic) return 'easeInOutCubic';

    if (curve == Curves.easeInOutQuart) return 'easeInOutQuart';

    if (curve == Curves.easeInOutQuint) return 'easeInOutQuint';

    if (curve == Curves.easeInOutExpo) return 'easeInOutExpo';

    if (curve == Curves.easeInOutCirc) return 'easeInOutCirc';

    if (curve == Curves.easeInOutBack) return 'easeInOutBack';

    if (curve == Curves.fastOutSlowIn) return 'fastOutSlowIn';

    if (curve == Curves.slowMiddle) return 'slowMiddle';

    if (curve == Curves.bounceIn) return 'bounceIn';

    if (curve == Curves.bounceOut) return 'bounceOut';

    if (curve == Curves.bounceInOut) return 'bounceInOut';

    if (curve == Curves.elasticIn) return 'elasticIn';

    if (curve == Curves.elasticOut) return 'elasticOut';

    if (curve == Curves.elasticInOut) return 'elasticInOut';
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

  static Map? _transformTextSpan(TextSpan? textSpan) {
    if (textSpan == null) return null;
    var cs = textSpan.children;
    List<Map> cts = [];
    // 检查可能有点问题，等测试的时候验证一波
    if (cs != null && cs is List) {
      for (var c in cs) {
        var ts = _transformTextSpan(c as TextSpan?);
        if (ts != null) {
          cts.add(ts);
        }
      }
    }
    return {
      'text': textSpan.text,
      'children': cts,
      'style': textSpan.style,
    };
  }
}