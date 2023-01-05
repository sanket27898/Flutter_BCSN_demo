import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/common/resources/dimen.dart';
import 'package:flutter_bcsn_demo/common/resources/styles.dart';

class CustomDropdown<T> extends StatefulWidget {
  final GlobalKey? key;
  final List<DropdownMenuItem<T>>? customItems;
  final List<String>? items;
  TextStyle? style;
  Widget? hint;
  String? hintText;
  TextStyle? hintTextStyle;
  Widget? disabledHint;
  T? value;
  Function? onChanged;
  Function? onMenuStateChange;
  Widget? icon;
  Color? iconEnabledColor;
  Color? iconDisabledColor;
  Color? barrierColor;
  Color? focusColor;
  double? buttonHeight;
  double? buttonWidth;
  double itemHeight;
  double iconSize;
  EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final int dropdownElevation;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownWidth;
  final double? dropdownMaxHeight;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final Color? selectedItemHighlightColor;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Widget? customButton;
  final List<double>? customItemsHeights;
  final bool openWithLongPress;
  final bool dropdownOverButton;
  final bool dropdownFullScreen;
  final bool autofocus;
  final bool barrierDismissible;
  final bool isExpanded;
  final bool isDense;
  final Widget? iconOnClick;
  final AlignmentGeometry alignment;

  CustomDropdown({
    this.key,
    this.items,
    this.customItems,
    this.style,
    this.hint,
    this.hintText,
    this.hintTextStyle,
    this.disabledHint,
    this.value,
    this.onChanged,
    this.onMenuStateChange,
    this.icon,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.barrierColor,
    this.focusColor,
    this.buttonHeight,
    this.buttonPadding,
    this.buttonWidth,
    this.itemHeight = kMinInteractiveDimension,
    this.iconSize = 24,
    this.buttonDecoration,
    this.buttonElevation,
    this.dropdownElevation = 8,
    this.itemPadding,
    this.dropdownWidth,
    this.dropdownMaxHeight,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.selectedItemHighlightColor,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.customButton,
    this.customItemsHeights,
    this.openWithLongPress = false,
    this.dropdownOverButton = false,
    this.dropdownFullScreen = false,
    this.isExpanded = false,
    this.autofocus = false,
    this.isDense = false,
    this.barrierDismissible = true,
    this.iconOnClick,
    this.alignment = AlignmentDirectional.centerStart,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      key: widget.key,
      child: DropdownButton2<T>(
        isExpanded: widget.isExpanded,
        hint: widget.hint ??
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.hintText ?? "",
                    style: widget.hintTextStyle ?? TextStyles.normal,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
        items: widget.customItems ??
            widget.items
                ?.map((item) => DropdownMenuItem<T>(
                      value: item as T,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
        value: widget.value,
        focusColor: widget.focusColor,
        onChanged: (value) => widget.onChanged!(value),
        onMenuStateChange: (bValue) => widget.onMenuStateChange!(bValue),
        icon: widget.icon,
        iconSize: widget.iconSize,
        iconEnabledColor: widget.iconEnabledColor ?? Colors.black,
        iconDisabledColor: widget.iconDisabledColor ?? Colors.grey,
        buttonHeight: widget.buttonHeight ?? Spacing.jumbo50,
        buttonWidth: widget.buttonWidth ?? Spacing.jumbo200,
        buttonPadding: widget.buttonPadding ??
            const EdgeInsets.only(
                left: Spacing.normal14, right: Spacing.normal14),
        buttonDecoration: widget.buttonDecoration,
        buttonElevation: widget.buttonElevation ?? 2,
        itemHeight: widget.itemHeight,
        itemPadding: widget.itemPadding ??
            const EdgeInsets.only(
                left: Spacing.normal14, right: Spacing.normal14),
        dropdownMaxHeight: widget.dropdownMaxHeight ?? Spacing.jumbo200,
        dropdownWidth: widget.dropdownWidth ?? Spacing.jumbo200,
        dropdownPadding: widget.dropdownPadding,
        dropdownDecoration: widget.dropdownDecoration ??
            const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(RadiusConst.circularRadius10),
                  bottomLeft: Radius.circular(RadiusConst.circularRadius10)),
              color: Colors.white,
            ),
        dropdownElevation: widget.dropdownElevation,
        scrollbarRadius: widget.scrollbarRadius ??
            const Radius.circular(RadiusConst.circularRadius40),
        scrollbarThickness: widget.scrollbarThickness ?? Spacing.space6,
        scrollbarAlwaysShow: widget.scrollbarAlwaysShow ?? false,
        offset: widget.offset ?? const Offset(0, 0),
        iconOnClick: widget.iconOnClick,
        dropdownFullScreen: widget.dropdownFullScreen,
        openWithLongPress: widget.openWithLongPress,
        dropdownOverButton: widget.dropdownOverButton,
        customItemsHeights: widget.customItemsHeights,
        customButton: widget.customButton,
        selectedItemHighlightColor: widget.selectedItemHighlightColor,
        barrierDismissible: widget.barrierDismissible,
        style: widget.style,
        alignment: widget.alignment,
        autofocus: widget.autofocus,
        disabledHint: widget.disabledHint,
        isDense: widget.isDense,
        barrierColor: widget.barrierColor,
        buttonHighlightColor: Colors.transparent,
        buttonSplashColor: Colors.transparent,

      ),
    );
  }
}
