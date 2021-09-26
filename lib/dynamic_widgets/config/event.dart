import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

class EventType {
  static const String onTap = 'onTap';  /// 点击
  static const String onLongPress = 'onLongPress'; /// 长按
  static const String onDoubleTap = 'onDoubleTap'; /// 双击
  static const String onCheck = 'onCheck'; /// 选择框
  static const String onTextChanged = 'onTextChanged'; /// 文本编辑
  static const String onExpansionChanged = 'onExpansionChanged'; /// 展开收缩
  static const String onDeleted = 'onDeleted'; /// 删除
}

class DialogType {
  static const String alert = 'alert'; /// 普通弹出框
  static const String actionSheet = 'actionSheet'; /// 底部弹出框
}

class EventAction {
  static const String push = 'push'; /// 跳转native页面
  static const String request = 'request'; /// 请求操作
  static const String openUrl = 'open_url'; /// 打开webView
  static const String dialog = 'dialog'; /// 弹出框
}


class DialogBuilder {
  late final String? title;
  late final String? content;
  late final DynamicWidgetConfig? contentWidget;
  late final List<DialogAction> options;
  late final DialogAction? bottomSheetCancel;
  late final bool isSheetStyle;

  DialogBuilder(
      {required this.title,
        required this.content,
        this.contentWidget,
        required this.options,
        this.bottomSheetCancel, required this.isSheetStyle});

  DialogBuilder.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    content = json['content'];
    if (json['contentWidget'] != null) {
      contentWidget = DynamicWidgetConfig.fromJson(json['contentWidget']);
    }
    options = [];
    if (json['options'] != null) {
      json['options'].forEach((v) {
        options.add(DialogAction.fromJson(v));
      });
    }
    if (json['bottomSheetCancel'] != null) {
      bottomSheetCancel = DialogAction.fromJson(json['bottomSheetCancel']);
    }
    isSheetStyle = json['isSheetStyle'];
  }
}

class DialogAction {
  late final String? text;
  late final String type;
  late final DynamicWidgetConfig? child;
  late final EventInfo? eventInfo;

  DialogAction(
      {this.text,
        required this.type,
        this.child,
        this.eventInfo});

  DialogAction.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    text = json['text'];
    if (json['child'] != null) {
      child = DynamicWidgetConfig.fromJson(json['contentWidget']);
    }
    if (json['eventInfo'] != null) {
      eventInfo = EventInfo.fromJson(json['eventInfo']);
    }
  }
}

class DialogConfig {
  /// 弹窗类型
  /// 值参考DialogType
  late final String type;

  /// 屏幕是否可关闭
  late final bool barrierDismissible;

  /// 屏幕背景颜色
  late final String? barrierColor;

  late final bool? useSafeArea;
  late final bool? useRootNavigator;

  DialogConfig(
      {required this.type,
        required this.barrierDismissible,
        this.barrierColor,
        this.useRootNavigator,
        this.useSafeArea});

  DialogConfig.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    barrierDismissible = json['barrierDismissible'];
    barrierColor = json['barrierColor'];
    useRootNavigator = json['useRootNavigator'];
    useSafeArea = json['useSafeArea'];
  }
}

class EventInfo {
  /// 事件类型（如点击，双击等）
  /// 值参考EventType
  late final String type;

  /// 事件的响应操作（如请求，弹窗等）
  /// 值参考EventAction
  late final String action;

  /// 跳转native页面的导航
  late final String? page;
  /// 跳转native页面所需携带的参数
  late final Map? arguments;

  /// 请求的方法如get、post
  late final String? method;
  /// 请求的方法路径
  late final String? path;
  /// 请求url携带的参数
  late final Map? queryParameters;
  /// 请求body携带的参数
  late final Map? bodyData;

  /// 请求的地址或webView打开的链接
  late final String? url;

  /// 选择，文本编辑等操作完成后的数据
  late final String? operateData;

  late final DialogConfig? dialog;

  EventInfo(
      {required this.type,
      required this.action,
      this.page,
      this.method,
      this.path,
      this.url,
      this.arguments,
      this.queryParameters,
      this.bodyData,
        this.dialog,
      this.operateData});

  EventInfo.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    action = json['action'];
    page = json['page'];
    method = json['method'];
    path = json['path'];
    url = json['url'];
    arguments = json['arguments'];
    queryParameters = json['queryParameters'];
    bodyData = json['bodyData'];
    operateData = json['operateData'];
    if (json['dialog'] != null) {
      dialog = DialogConfig.fromJson(json['dialog']);
    }
  }
}
