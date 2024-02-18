import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_plus/widgets/text_style_const.dart';

import 'app_theme.dart';

class EVWTextField extends StatefulWidget {
  const EVWTextField({
    this.globalKey,
    this.hintText,
    this.errorText,
    this.errorValidate = false,
    this.enabled = true,
    this.helperText,
    this.onSaved,
    this.style,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.keyboardType = TextInputType.multiline,
    this.text = '',
    this.isTextHas = false,
    this.controller,
    this.inputFormatters,
    this.minLine = 1,
    this.maxLine = 1,
    this.inputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.textMaxLength,
    this.counterText,
    this.onChanged,
    this.hasIcon = false,
    this.isPhoneNumber = false,
    this.isReadOnly = false,
    this.prefixText,
    this.showCursor = true,
    this.color,
    this.initialValue,
    this.prefixIcon,
    this.autoFocus = false,
    this.showEditableInput = false,
    this.contentPadding,
    this.prefixIconConstraints,
    this.hintStyle,
    this.isSearchField = false,
    this.elevation = 0.0,
    this.obscureText = false,
    this.obscureCharacter = "•",
    this.labelText,
  });

  final GlobalKey<FormFieldState>? globalKey;
  final String text;
  final bool isTextHas;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final String? prefixText;
  final String? initialValue;
  final bool errorValidate;
  final bool? enabled;
  final String? helperText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextStyle? style;
  final FocusNode? focusNode;
  final bool showCursor;
  final Color? color;
  final TextEditingController? controller;
  final suffixIcon;
  final suffixIconConstraints;
  final prefixIconConstraints;
  final keyboardType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final minLine;
  final maxLine;
  final TextInputAction inputAction;
  final textMaxLength;
  final counterText;
  final onChanged;
  final bool hasIcon;
  final bool isPhoneNumber;
  final bool isReadOnly;
  final bool autoFocus;
  final bool showEditableInput;
  final EdgeInsets? contentPadding;
  final bool isSearchField;
  final bool obscureText;
  final double elevation;
  final String obscureCharacter;

  @override
  _EVWTextField createState() => _EVWTextField();
}

class _EVWTextField extends State<EVWTextField> {
  @override
  Widget build(BuildContext context) {
    var theme = AdaptiveTheme.of(context).theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.isTextHas,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text,
              style: TextStyleS.s15w600(),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(8),
          elevation: widget.elevation,
          shadowColor: AdaptiveTheme.of(context).theme.disabledColor,
          child: TextFormField(
            key: widget.globalKey,
            initialValue: (widget.initialValue),
            showCursor: widget.showCursor,
            maxLength: widget.textMaxLength,
            readOnly: widget.isReadOnly,
            autofocus: widget.autoFocus,
            focusNode: widget.focusNode,
            style: (widget.style ?? TextStyleS.s14w400()),
            textInputAction: widget.inputAction,
            controller: widget.controller,
            enabled: widget.enabled,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            onSaved: widget.onSaved,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscureCharacter,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                      width: widget.showEditableInput
                          ? 1.5
                          : widget.isSearchField
                              ? 0
                              : 1,
                      color: widget.showEditableInput
                          ? primaryAppColor(context)
                          : widget.isSearchField
                              ? cardColor(context)
                              : Colors.grey.withOpacity(0.3)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: widget.showEditableInput ? 1.5 : 1,
                      color: widget.showEditableInput
                          ? primaryAppColor(context)
                          : Colors.grey
                              .withOpacity((widget.enabled!) ? 1 : 0.3)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixText: widget.prefixText ?? "",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                  child: widget.prefixIcon ??
                      (widget.hasIcon ? const Icon(Icons.call) : null),
                ),
                errorText: widget.errorValidate ? widget.errorText : null,
                errorMaxLines: 2,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.fromLTRB(20.0, 14.0, 0.0, 14.0),
                counterText: widget.counterText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIconConstraints: widget.suffixIconConstraints ??
                    const BoxConstraints(minHeight: 24, minWidth: 20),
                prefixIconConstraints: widget.prefixIconConstraints ??
                    const BoxConstraints(minHeight: 24, minWidth: 20),
                filled: true,
                errorStyle: const TextStyle(color: Colors.red),
                fillColor: widget.color ??
                    (widget.enabled!
                        ? theme.hoverColor
                        : theme.cardColor.withOpacity(0.7)),
                hintStyle: widget.hintStyle ??
                    TextStyleS.s14w400(
                        color: AdaptiveTheme.of(context)
                            .theme
                            .disabledColor
                            .withOpacity(0.25)),
                prefixStyle: widget.hintStyle ??
                    TextStyleS.s14w400(
                        color: AdaptiveTheme.of(context)
                            .theme
                            .disabledColor
                            .withOpacity(0.25)),
                hintText: widget.hintText,
                labelStyle: widget.hintStyle ??
                    TextStyleS.s14w400(
                        color: AdaptiveTheme.of(context)
                            .theme
                            .disabledColor
                            .withOpacity(0.25)),
                helperText: widget.helperText,
                floatingLabelStyle: TextStyleS.s14w400(),
                suffixIcon: widget.suffixIcon,
                labelText: widget.labelText),
          ),
        ),
      ],
    );
  }
}
