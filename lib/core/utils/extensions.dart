import 'package:flutter/cupertino.dart';

extension WidgetPaddingExtension on Widget {
  Widget padAll({required double value}) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget padSymmetric({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: this,
    );
  }

  Widget padOnly({double? top, double? bottom, double? left, double? right}) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: this,
    );
  }
}

extension WidgetMarginExtension on Widget {
  Widget marginAll({required double value}) {
    return Container(margin: EdgeInsets.all(value), child: this);
  }

  Widget marginSymmetric({double? horizontal, double? vertical}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: this,
    );
  }

  Widget marginOnly({double? top, double? bottom, double? left, double? right}) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: this,
    );
  }
}
