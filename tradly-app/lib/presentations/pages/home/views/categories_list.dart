import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/category_model.dart';
import 'package:tradly_app/presentations/pages/home/states/home_bloc.dart';
import 'package:tradly_app/presentations/pages/home/states/home_state.dart';
import 'package:tradly_app/presentations/widgets/not_found.dart';
import 'package:tradly_app/presentations/widgets/shimmer.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.onCategoryTap,
  });

  final void Function(CategoryModel category) onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status is HomeStatusListLoading) {
          return const ShimmerCategoryGrid();
        } else if (state.status is HomeStatusListSuccess) {
          final categories = state.categories ?? [];
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () => onCategoryTap(category),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(),
                    image: DecorationImage(
                      image: NetworkImage(
                        category.imageUrl ?? '',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withAlpha(128),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: TATitleSmallText(
                      text: category.category ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
            itemCount: categories.length,
          );
        } else if (state.status is HomeStatusListFailure) {
          return NotFoundScreen();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
