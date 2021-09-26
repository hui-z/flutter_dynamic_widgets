import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 两种样式的输入item
/// 1：icon + textField + rightWidget
/// 2: label + textField + rightWidget
///
/// ## Sample code
///
/// ```dart
///   ListInputItem(
///      icon: HImages.phone,
///     placeholder: "请输入手机号",
///     onChanged: (text) {
///     phone = text;
///     },
///     rightWidget: isPinLogin
///     ? FlatButton(
///     onPressed: _sendPinButtonOnPressed,
///      child: Text(
///     '发送验证码',
///     style: TextStyle(color: HColors.primary),
///     ))
///     : null),
///
///   ListInputItem(
///     title: '过期前',
///     padding: 16.0,
///     textFieldAlign: TextAlign.right,
///     text: '${expirationSetting.notifyDays}',
///     margin: 0.0,
///     dividerRightPadding: 0,
///     dividerLeftPadding: 16.0,
///     rightWidget: Padding(
///     padding: const EdgeInsets.only(right: 16.0),
///     child: Text(
///       '天',
///       style: TextStyle(
///       color: HColors.darkGrey,
///       fontSize: HFontSizes.normal),
///       ),
///     ),
///     textFieldStyle: TextStyle(
///     color: HColors.lightGrey,
///     fontSize: HFontSizes.normal,
///     decorationColor: HColors.mediumGrey),
///   )
/// ```
///
/// <img src="http://me.wozaihui.com/ListInputItem_title.png">
///
/// <img src="http://me.wozaihui.com/ListInputItem_icon.png">
///
class ListInputItem extends StatefulWidget {
  final String? title;
  final String? icon;
  final Widget? customTitle;
  final String? text;
  final String? placeholder;
  final Widget? rightWidget;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onEditingComplete;
  final Divider? divider;

  /// icon或title距父控件左右间距
  final double iconTitlePadding;

  /// 底部横线距父控件的左间距
  final double dividerLeftPadding;

  /// 底部横线距父控件的右间距
  final double dividerRightPadding;

  /// textField和title或icon的间距
  final double texFieldLeftPadding;
  final TextAlign textFieldAlign;
  final TextStyle? textFieldStyle;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle ;

  final bool isHideDivider;
  final bool? enable;

  ListInputItem(
      {Key? key,
      this.title,
      this.icon,
      this.customTitle,
      this.text,
      this.placeholder,
      this.rightWidget,
      this.onChanged,
      this.obscureText = false,
      this.iconTitlePadding = 20.0,
      this.dividerLeftPadding = 10.0,
      this.dividerRightPadding = 10.0,
      this.texFieldLeftPadding = 15.0,
      this.textFieldAlign = TextAlign.left,
      this.textFieldStyle,
      this.hintStyle,
      this.keyboardType,
      this.maxLength,
      this.focusNode,
      this.autofocus = false,
      this.titleStyle,
      this.onEditingComplete,
      this.isHideDivider = false,
      this.divider,
      this.enable})
      : super(key: key);

  @override
  _ListInputItemState createState() => _ListInputItemState();
}

class _ListInputItemState extends State<ListInputItem> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _textEditingController.text = widget.text ?? '';
    _textEditingController.addListener(() {
      if (widget.maxLength != null &&
          _textEditingController.text.length > widget.maxLength!) {
        _textEditingController.text =
            _textEditingController.text.substring(0, widget.maxLength);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ListInputItem oldWidget) {
    final oldOffset = _textEditingController.selection.extentOffset;
    _textEditingController.text = widget.text ?? '';
    _textEditingController.selection =
        TextSelection.fromPosition(TextPosition(offset: oldOffset));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _buildRow()),
        widget.isHideDivider
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.only(
                    left: widget.dividerLeftPadding,
                    right: widget.dividerRightPadding),
                child: widget.divider ?? Divider(height: 0.5),
              ),
      ],
    );
  }

  List<Widget> _buildRow() {
    List<Widget> list = [];
    if (widget.customTitle != null) {
      list.add(widget.customTitle!);
    } else {
      if (widget.icon != null && widget.icon!.isNotEmpty) {
        list.add(Padding(
          padding: EdgeInsets.only(left: widget.iconTitlePadding),
          child: Image.asset(widget.icon!),
        ));
      } else if (widget.title != null && widget.title!.isNotEmpty) {
        list.add(Padding(
          padding: EdgeInsets.only(left: widget.iconTitlePadding),
          child: Text(
            widget.title!,
            style: widget.titleStyle,
          ),
        ));
      }
    }
    list.add(Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: widget.texFieldLeftPadding),
            child: Column(
              children: <Widget>[
                TextField(
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    autofocus: widget.autofocus,
                    keyboardType: widget.keyboardType,
                    controller: _textEditingController,
                    focusNode: widget.focusNode,
                    maxLength: widget.maxLength,
                    decoration: InputDecoration(
                        hintText: widget.placeholder,
                        counterText: '',
                        hintStyle: widget.hintStyle,
                        border: InputBorder.none),
                    obscureText: widget.obscureText,
                    onChanged: (text) {
                      if (widget.onChanged != null) {
                        widget.onChanged!(_textEditingController.text);
                      }
                    },
                    enabled: widget.enable ?? true,
                    onEditingComplete: widget.onEditingComplete ?? () {},
                    textAlign: widget.textFieldAlign,
                    style: widget.textFieldStyle),
              ],
            ))));
    list.add(widget.rightWidget ?? SizedBox());
    return list;
  }
}
