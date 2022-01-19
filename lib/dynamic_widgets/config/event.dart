import 'package:flutter/material.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/basic/widget.dart';
import 'package:flutter_dynamic_widgets/dynamic_widgets/config/widget_config.dart';

class EventType {
  /// 点击
  static const String onTap = 'onTap';

  /// 长按
  static const String onLongPress = 'onLongPress';

  /// 双击
  static const String onDoubleTap = 'onDoubleTap';

  /// 选择框
  static const String onCheck = 'onCheck';

  /// 文本编辑
  static const String onTextChanged = 'onTextChanged';

  /// 展开收缩
  static const String onExpansionChanged = 'onExpansionChanged';

  /// 删除
  static const String onDeleted = 'onDeleted';
}

class DialogType {
  /// 普通弹出框
  static const String alert = 'alert';

  /// 底部弹出框
  static const String actionSheet = 'actionSheet';
}

class EventAction {
  /// 跳转native页面
  static const String push = 'push';

  /// 请求操作
  static const String request = 'request';

  /// 打开webView
  static const String openUrl = 'open_url';

  /// 弹出框
  static const String dialog = 'dialog';

  /// 图片预览
  static const String photoPreview = 'photo_preview';
}

class DialogBuilder {
  late String? title;
  late String? content;
  late DynamicWidgetConfig? contentWidget;
  late List<DialogAction> options;
  late DialogAction? bottomSheetCancel;

  DialogBuilder(
      {required this.title,
      required this.content,
      this.contentWidget,
      required this.options,
      this.bottomSheetCancel});

  DialogBuilder.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    content = json['content'];
    contentWidget = null;
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
  }
}

class DialogAction {
  late String? text;
  late String type;
  late DynamicWidgetConfig? child;
  late EventInfo? eventInfo;

  DialogAction({this.text, required this.type, this.child, this.eventInfo});

  DialogAction.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    text = json['text'];
    child = null;
    if (json['child'] != null) {
      child = DynamicWidgetConfig.fromJson(json['contentWidget']);
    }
    eventInfo = null;
    if (json['eventInfo'] != null) {
      eventInfo = EventInfo.fromJson(json['eventInfo']);
    }
  }
}

class DialogConfig {
  /// 弹窗类型
  /// 值参考DialogType
  late String type;

  /// 屏幕是否可关闭
  late bool barrierDismissible;

  /// 屏幕背景颜色
  late String? barrierColor;

  /// 使用第三方弹出框
  late bool? useAwesomeDialog;

  late bool? useSafeArea;
  late bool? useRootNavigator;

  late final DialogBuilder? builder;

  DialogConfig(
      {required this.type,
      required this.barrierDismissible,
      this.barrierColor,
      this.useAwesomeDialog,
      this.useRootNavigator,
      this.useSafeArea,
      this.builder});

  DialogConfig.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    barrierDismissible = json['barrierDismissible'];
    useAwesomeDialog = json['useAwesomeDialog'];
    barrierColor = json['barrierColor'];
    useRootNavigator = json['useRootNavigator'];
    useSafeArea = json['useSafeArea'];
    if (json['builder'] != null) {
      builder = DialogBuilder.fromJson(json['builder']);
    }
  }
}

class EventInfo {
  late String messageId;

  /// 事件类型（如点击，双击等）
  /// 值参考EventType
  late String type;

  /// 事件的响应操作（如请求，弹窗等）
  /// 值参考EventAction
  late String action;

  /// 跳转native页面的导航
  late String? page;

  /// 跳转native页面所需携带的参数
  late Map? arguments;

  /// 请求的地址或webView打开的链接
  late String? url;

  /// 选择，文本编辑等操作完成后的数据
  late String? operateData;

  late String? status;

  late DialogConfig? dialog;

  late List<String> imageList;
  late int? defaultImage;

  EventInfo(
      {required this.type,
      this.messageId = '',
      required this.action,
      this.page,
      this.url,
      this.arguments,
      this.imageList = const [],
      this.defaultImage,
      this.dialog,
      this.operateData});

  EventInfo.fromJson(Map<dynamic, dynamic> json) {
    messageId = json['messageId'];
    type = json['type'];
    action = json['action'];
    page = json['page'];
    url = json['url'];
    arguments = json['arguments'];
    operateData = json['operateData'];
    dialog = null;
    if (json['dialog'] != null) {
      dialog = DialogConfig.fromJson(json['dialog']);
    }
    imageList = json['imageList']?.cast<String>() ?? [];
    defaultImage = json['defaultImage'];
    status = json['status'];
  }
}

class EventActionHandle {
  static handleEventAction(
    EventInfo event,
    BuildContext context, {
    Function(String url)? onOpenUrl,
    Function(String messageId, String status, String operateData)? onRequest,
    Function(String? title, Widget? contentWidget)? onAwesomeDialog,
    Function(DialogConfig dialogConfig, Widget? contentWidget)? onCommonDialog,
    Function(int defaultImage, List<String> imageList)? onPhotoPreview,
  }) {
    switch (event.action) {
      case EventAction.push:
        // 跳转到原生页面
        _eventActionPush(context, event.page!, event.arguments);
        break;
      case EventAction.openUrl:
        // 跳转到内置WebView
        if (onOpenUrl != null) {
          if (event.url != null) {
            onOpenUrl(event.url!);
          }
        }
        break;
      case EventAction.request:
        // 单次请求（目前为 统一）
        if (onRequest != null) {
          onRequest(
              event.messageId, event.status ?? '', event.operateData ?? '');
        }
        break;
      case EventAction.dialog:
        // 弹出框
        _eventActionDialog(
            context, event.dialog!, onAwesomeDialog, onCommonDialog);
        break;
      case EventAction.photoPreview:
        // 跳转到图片查看
        if (onPhotoPreview != null) {
          onPhotoPreview(event.defaultImage ?? 0, event.imageList);
        }
        break;
      default:
        break;
    }
  }

  /// 跳转到原生页面
  static _eventActionPush(BuildContext context, String? page, Map? arguments) {
    if (page == null) return;
    Navigator.pushNamed(context, page, arguments: arguments);
  }

  /// 弹出框
  static _eventActionDialog(
    BuildContext context,
    DialogConfig? dialogConfig,
    Function(String? title, Widget? contentWidget)? onAwesomeDialog,
    Function(DialogConfig dialogConfig, Widget? contentWidget)? onCommonDialog,
  ) {
    if (dialogConfig == null) return;
    var builder = dialogConfig.builder;
    var contentWidget = DynamicWidgetBuilder.buildWidget(builder?.contentWidget,
        context: context, event: (eventInfo) {
      handleEventAction(eventInfo, context);
    });
    if (dialogConfig.type == DialogType.alert) {
      if (dialogConfig.useAwesomeDialog == true) {
        // 原本应该是底部弹出框，现在被使用了特殊弹出框，具体待定
        if (onAwesomeDialog != null) {
          // AwesomeDialog
          onAwesomeDialog(builder?.title, contentWidget);
        }
      } else {
        if (onCommonDialog != null) {
          // 系统Dialog
          onCommonDialog(dialogConfig, contentWidget);
        }
      }
    }
  }
}
