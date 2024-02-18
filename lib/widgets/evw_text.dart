
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class EVWText extends StatefulWidget {
  final TextStyle? style;

  final StrutStyle? strutStyle;

  final TextAlign? textAlign;

  final Locale? locale;

  final bool? softWrap;

  final TextOverflow? overflow;

  final double? textScaleFactor;

  final int? maxLines;

  final String? semanticsLabel;

  final TextWidthBasis? textWidthBasis;

  final TextHeightBehavior? textHeightBehavior;

  final Color? selectionColor;

  final String data;

  const EVWText(
    String this.data, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : super(key: key);

  @override
  State<EVWText> createState() => _EVWTextState();
}

class _EVWTextState extends State<EVWText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data.tr(context: context),
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      textScaleFactor: widget.textScaleFactor,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      textHeightBehavior: widget.textHeightBehavior,
      selectionColor: widget.selectionColor,
    );
  }
}
