import 'adapt_utils.dart';
import 'transform_utils.dart';

class DynamicWidgetUtils {
  DynamicWidgetUtils._();

  static dynamic transform(dynamic origin) {
    if (origin == null) return null;
    return TransformUtils.transform(origin);
  }

  static T? adapt<T>(dynamic origin) {
    return AdaptUtils.adapt<T>(origin);
  }

  static double? adaptDouble(double? d) {
    return AdaptUtils.doubleAdapt(d);
  }
}
