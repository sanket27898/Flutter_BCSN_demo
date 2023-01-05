import 'package:flutter/material.dart';
import 'package:flutter_bcsn_demo/common/resources/colors.dart';
import 'package:flutter_bcsn_demo/common/resources/dimen.dart';
import 'package:flutter_bcsn_demo/common/resources/styles.dart';
import 'package:flutter_bcsn_demo/common/widget/common_widget.dart';

class CommonAppBar extends StatelessWidget {
  Widget? leading;
  Widget? title;
  Widget? optional;
  CommonAppBar({Key? key, this.leading, this.title, this.optional})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.jumbo50,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
      decoration: const BoxDecoration(gradient: BCSNColors.appBarGradient),
      child: Row(
        children: [
          ///todo: replace leading with SVG
          leading ??
              Container(
                width: Spacing.jumbo28,
                height: Spacing.jumbo28,
                padding: const EdgeInsets.only(
                    left: Spacing.xSmall,
                    right: Spacing.xxSmall5,
                    top: Spacing.xxSmall5,
                    bottom: Spacing.xxSmall5),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(RadiusConst.circularRadius8),
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: Spacing.size15,
                  color: BCSNColors.whiteColor,
                ),
              ),
          spacingHorizontalLarge,
          title ??
              Expanded(
                child: Text(
                  "Swap",
                  style:
                      TextStyles.xxLarge.copyWith(color: BCSNColors.whiteColor),
                ),
              ),
          spacingHorizontalLarge,
          optional ??
              Container(
                height: Spacing.jumbo28,
                width: Spacing.jumbo28,
                decoration: const BoxDecoration(
                  color: BCSNColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.bookmark_outline,
                  color: BCSNColors.hintColor,
                ),
              )
        ],
      ),
    );
  }
}
