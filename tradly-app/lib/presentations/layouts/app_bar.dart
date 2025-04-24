import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';
import 'package:tradly_app/presentations/widgets/assets.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class TaAppBarSize {
  static const double small = kToolbarHeight;
  static const double minimum = 72;
  static const double medium = 126;
  static const double large = 182;
}

enum TaAppBarType {
  home,
  categoryDetail,
  details,
  wishlist,
  custom,
}

enum TaAppBarBottomType {
  none,
  filter,
  search,
  imageBackground,
}

enum TaAppBarShape {
  normal,
  rounded,
}

class TaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaAppBar({
    this.appBarType = TaAppBarType.custom,
    this.automaticallyImplyLeading = true,
    this.toolbarHeight = TaAppBarSize.medium,
    this.title,
    this.leading,
    this.backgroundColor,
    this.subTitle,
    this.trailing,
    this.bottomType = TaAppBarBottomType.none,
    this.shapeType = TaAppBarShape.normal,
    this.searchForm,
    this.filterOptions,
    this.background,
    this.onBackPressed,
    this.elevation = 0,
    this.onPressed,
    this.actions,
    this.centerTitle = true,
    super.key,
  });

  /// Factory constructor for home screen app bar
  factory TaAppBar.home({
    required Widget title,
    required Widget searchForm,
    List<Widget>? actions,
    Color? backgroundColor,
    Widget? trailing,
    bool? centerTitle,
    bool? automaticallyImplyLeading,
  }) {
    return TaAppBar(
      appBarType: TaAppBarType.home,
      title: title,
      backgroundColor: backgroundColor,
      bottomType: TaAppBarBottomType.search,
      searchForm: searchForm,
      trailing: trailing,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      centerTitle: centerTitle ?? true,
    );
  }

  /// Factory constructor for category detail screen app bar
  factory TaAppBar.categoryDetail({
    required String title,
    VoidCallback? onBackPressed,
    Color? backgroundColor,
    TaAppBarBottomType bottomType = TaAppBarBottomType.filter,
    Widget? filterOptions,
    VoidCallback? onPressed,
  }) {
    return TaAppBar(
      appBarType: TaAppBarType.categoryDetail,
      title: TaDisplaySmallText(
        text: title,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: backgroundColor ?? Colors.teal,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed,
      ),
      bottomType: bottomType,
      filterOptions: filterOptions,
      onPressed: onPressed,
    );
  }

  /// Factory constructor for product details screen app bar
  factory TaAppBar.details({
    required Widget background,
    VoidCallback? onBackPressed,
    VoidCallback? onPressed,
    Color? backgroundColor,
    List<Widget>? actions,
    TaAppBarBottomType bottomType = TaAppBarBottomType.imageBackground,
  }) {
    return TaAppBar(
      appBarType: TaAppBarType.details,
      toolbarHeight: TaAppBarSize.large,
      background: background,
      backgroundColor: Colors.teal,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: onBackPressed,
        ),
      ),
      bottomType: bottomType,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: (actions ?? []),
        ),
      ),
    );
  }

  /// Factory constructor for wishlist screen app bar
  factory TaAppBar.wishlist({
    required String title,
    VoidCallback? onBackPressed,
    Color? backgroundColor,
    TaAppBarBottomType bottomType = TaAppBarBottomType.none,
  }) {
    return TaAppBar(
      appBarType: TaAppBarType.wishlist,
      title: TaDisplaySmallText(
        text: title,
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: backgroundColor ?? Colors.teal,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed,
      ),
      bottomType: bottomType,
      toolbarHeight: TaAppBarSize.medium,
    );
  }

  final TaAppBarType appBarType;
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final double toolbarHeight;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool automaticallyImplyLeading;
  final TaAppBarBottomType bottomType;
  final TaAppBarShape shapeType;
  final Widget? searchForm;
  final Widget? filterOptions;
  final Widget? background;
  final VoidCallback? onBackPressed;
  final double elevation;
  final VoidCallback? onPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(toolbarHeight),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: AppBar(
          flexibleSpace: background,
          automaticallyImplyLeading: automaticallyImplyLeading,
          elevation: elevation,
          titleSpacing: 0,
          leadingWidth: 56,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: centerTitle,
          toolbarHeight: TaResponsive.scale(
            context,
            defaultValue: toolbarHeight,
          ),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          leading: leading ??
              (automaticallyImplyLeading && Navigator.canPop(context)
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed:
                          onBackPressed ?? () => Navigator.of(context).pop(),
                    )
                  : null),
          actions: [
            if (trailing != null) trailing!,
          ],
          title: subTitle != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title ?? const SizedBox.shrink(),
                    const SizedBox(height: 4),
                    subTitle!,
                  ],
                )
              : title,
          bottom: _buildBottom(context),
          shape: shapeType == TaAppBarShape.rounded
              ? const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildBottom(BuildContext context) {
    switch (bottomType) {
      case TaAppBarBottomType.search:
        return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: searchForm ?? const SizedBox.shrink(),
          ),
        );

      case TaAppBarBottomType.filter:
        return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: filterOptions ?? _buildDefaultFilterOptions(context),
          ),
        );

      case TaAppBarBottomType.imageBackground:
        return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(height: 120),
        );
      case TaAppBarBottomType.none:
        return PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(height: 20),
        );
    }
  }

  Widget _buildDefaultFilterOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFilterButton(
          context,
          icon: TAAssets.sortList(),
          label: 'Sort by',
          onPressed: () {},
        ),
        _buildFilterButton(
          context,
          icon: Icon(
            Icons.location_on,
            size: 16,
          ),
          label: 'Location',
          onPressed: () {},
        ),
        _buildFilterButton(
          context,
          icon: TAAssets.category(),
          label: 'Category',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFilterButton(
    BuildContext context, {
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: context.colorScheme.onPrimary,
            width: 1,
          ),
        ),
      ),
    );
  }
}
