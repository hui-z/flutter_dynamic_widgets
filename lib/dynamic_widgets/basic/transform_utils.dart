import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TransformUtils {
  static dynamic transform(dynamic origin) {
    if (origin == null) return null;
    if (origin is double) {
      return origin == double.infinity ? -1.0 : origin;
    }
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
      return _transformRoundedRectangleBorder(origin);
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
      return _transformFontWeight(origin);
    }
    if (origin is FontStyle) {
      return _transformFontStyle(origin);
    }
    if (origin is EdgeInsets) {
      return _transformEdgeInset(origin);
    }
    if (origin is MainAxisAlignment) {
      return _transformMainAxisAlignment(origin);
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
      return _transformBorderRadius(origin);
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
    if (origin is TextSpan) {
      return _transformTextSpan(origin);
    }
    if (origin is TextDecoration) {
      return _transformTextDecoration(origin);
    }
    if (origin is BoxDecoration) {
      return _transformBoxDecoration(origin);
    }
    if (origin is LinearGradient) {
      return _transformLinearGradient(origin);
    }
    if (origin is SweepGradient) {
      return _transformSweepGradient(origin);
    }
    if (origin is RadialGradient) {
      return _transformRadialGradient(origin);
    }
    throw UnimplementedError('请实现 ${origin.runtimeType} transform');
  }

  static Map? _transformBoxDecoration(BoxDecoration? boxDecoration) {
    if (boxDecoration == null) return null;
    return {
      'color': transform(boxDecoration.color),
      'borderRadius': transform(boxDecoration.borderRadius as BorderRadius?),
      'gradient': transform(boxDecoration.gradient),
      // 'border': transform(boxDecoration.border as BoxBorder?),
    };
  }

  static Map? _transformLinearGradient(LinearGradient? linearGradient) {
    if (linearGradient == null) return null;
    List<String> colors = [];
    for (var c in linearGradient.colors) {
      colors.add(_transformColor(c) ?? '');
    }
    return {
      'type': 'linear',
      'colors': colors,
      'end': _transformAlignment(linearGradient.end as Alignment?),
      'begin': _transformAlignment(linearGradient.begin as Alignment?)
    };
  }

  static Map? _transformSweepGradient(SweepGradient? sweepGradient) {
    if (sweepGradient == null) return null;
    List<String> colors = [];
    for (var c in sweepGradient.colors) {
      colors.add(_transformColor(c) ?? '');
    }
    return {
      'type': 'sweep',
      'colors': colors,
      'startAngle': transform(sweepGradient.startAngle),
      'endAngle': transform(sweepGradient.endAngle)
    };
  }

  static Map? _transformRadialGradient(RadialGradient? radialGradient) {
    if (radialGradient == null) return null;
    List<String> colors = [];
    for (var c in radialGradient.colors) {
      colors.add(_transformColor(c) ?? '');
    }
    return {
      'type': 'radial',
      'colors': colors,
      'radius': transform(radialGradient.radius)
    };
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
      'minWidth': transform(constraints.minWidth),
      'maxWidth': transform(constraints.maxWidth),
      'minHeight': transform(constraints.minHeight),
      'maxHeight': transform(constraints.maxHeight),
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
      'width': side.width.toDouble(),
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
      'left': inset.left.toDouble(),
      'right': inset.right.toDouble(),
      'top': inset.top.toDouble(),
      'bottom': inset.bottom.toDouble(),
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

  static Map? _transformRoundedRectangleBorder(RoundedRectangleBorder? border) {
    if (border == null) return null;

    return {
      'side': transform(border.side),
      'borderRadius': transform(border.borderRadius as BorderRadius?),
    };
  }

  static Map? _transformBorderRadius(BorderRadius? borderRadius) {
    if (borderRadius == null) return null;

    return {
      'topLeft': borderRadius.topLeft.x.toDouble(),
      'topRight': borderRadius.topRight.x.toDouble(),
      'bottomLeft': borderRadius.bottomLeft.x.toDouble(),
      'bottomRight': borderRadius.bottomRight.x.toDouble(),
    };
  }

  static String? _transformFontWeight(FontWeight? fontWeight) {
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

  static Map? _transformRect(Rect? rect) {
    if (rect == null) {
      return null;
    }
    return {
      'left': rect.left.toDouble(),
      'top': rect.top.toDouble(),
      'right': rect.right.toDouble(),
      'bottom': rect.bottom.toDouble()
    };
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

  static String? _transformMainAxisAlignment(
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

  static Map? _transformTextHeightBehavior(TextHeightBehavior? behavior) {
    if (behavior == null) return null;
    return {
      'applyHeightToFirstAscent': behavior.applyHeightToFirstAscent,
      'applyHeightToLastDescent': behavior.applyHeightToLastDescent,
      'leadingDistribution': transform(behavior.leadingDistribution),
    };
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

  static Map? _transformTextStyle(TextStyle? style) {
    if (style == null) return null;
    return {
      'inherit': style.inherit,
      'color': transform(style.color),
      'backgroundColor': style.backgroundColor?.value.toRadixString(16),
      'fontSize': style.fontSize,
      'fontWeight': transform(style.fontWeight),
      'fontStyle': transform(style.fontStyle),
      'decoration': transform(style.decoration),
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

  static Map? _transformOffset(Offset? offset) {
    if (offset == null) return null;

    return {'dx': offset.dx.toDouble(), 'dy': offset.dy.toDouble()};
  }

  static Map? _transformSize(Size? size) {
    if (size == null) return null;

    return {'width': size.width.toDouble(), 'height': size.height.toDouble()};
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

  static String? _transformMouseCursor(MouseCursor? mouseCursor) {
    if (mouseCursor == null) {
      return null;
    }
    if (mouseCursor == SystemMouseCursors.basic) return 'basic';

    if (mouseCursor == SystemMouseCursors.click) return 'click';

    if (mouseCursor == SystemMouseCursors.forbidden) return 'forbidden';

    if (mouseCursor == SystemMouseCursors.wait) return 'wait';

    if (mouseCursor == SystemMouseCursors.progress) return 'progress';

    if (mouseCursor == SystemMouseCursors.contextMenu) return 'contextMenu';

    if (mouseCursor == SystemMouseCursors.help) return 'help';

    if (mouseCursor == SystemMouseCursors.text) return 'text';

    if (mouseCursor == SystemMouseCursors.verticalText) return 'verticalText';

    if (mouseCursor == SystemMouseCursors.cell) return 'cell';

    if (mouseCursor == SystemMouseCursors.precise) return 'precise';

    if (mouseCursor == SystemMouseCursors.move) return 'move';

    if (mouseCursor == SystemMouseCursors.grab) return 'grab';

    if (mouseCursor == SystemMouseCursors.noDrop) return 'noDrop';

    if (mouseCursor == SystemMouseCursors.alias) return 'alias';

    if (mouseCursor == SystemMouseCursors.copy) return 'copy';

    if (mouseCursor == SystemMouseCursors.disappearing) return 'disappearing';

    if (mouseCursor == SystemMouseCursors.allScroll) return 'allScroll';

    if (mouseCursor == SystemMouseCursors.resizeLeftRight)
      return 'resizeLeftRight';

    if (mouseCursor == SystemMouseCursors.resizeUpDown) return 'resizeUpDown';

    if (mouseCursor == SystemMouseCursors.resizeUpLeftDownRight)
      return 'resizeUpLeftDownRight';

    if (mouseCursor == SystemMouseCursors.resizeUpRightDownLeft)
      return 'resizeUpRightDownLeft';

    if (mouseCursor == SystemMouseCursors.resizeUp) return 'resizeUp';

    if (mouseCursor == SystemMouseCursors.resizeDown) return 'resizeDown';

    if (mouseCursor == SystemMouseCursors.resizeLeft) return 'resizeLeft';

    if (mouseCursor == SystemMouseCursors.resizeRight) return 'resizeRight';

    if (mouseCursor == SystemMouseCursors.resizeUpLeft) return 'resizeUpLeft';

    if (mouseCursor == SystemMouseCursors.resizeUpRight) return 'resizeUpRight';

    if (mouseCursor == SystemMouseCursors.resizeDownLeft)
      return 'resizeDownLeft';

    if (mouseCursor == SystemMouseCursors.resizeDownRight)
      return 'resizeDownRight';

    if (mouseCursor == SystemMouseCursors.resizeColumn) return 'resizeColumn';

    if (mouseCursor == SystemMouseCursors.resizeRow) return 'resizeRow';

    if (mouseCursor == SystemMouseCursors.zoomIn) return 'zoomIn';

    if (mouseCursor == SystemMouseCursors.zoomOut) return 'zoomOut';

    return 'none';
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

  static String? _transformTextDecoration(TextDecoration? decoration) {
    if (decoration == null) return null;

    if (decoration == TextDecoration.none) return 'none';

    if (decoration == TextDecoration.underline) return 'underline';

    if (decoration == TextDecoration.overline) return 'overline';

    if (decoration == TextDecoration.lineThrough) return 'lineThrough';
  }
}
