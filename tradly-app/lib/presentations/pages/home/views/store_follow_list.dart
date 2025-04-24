import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/store_model.dart';
import 'package:tradly_app/presentations/pages/home/states/home_bloc.dart';
import 'package:tradly_app/presentations/pages/home/states/home_state.dart';
import 'package:tradly_app/presentations/widgets/card.dart';
// import 'package:tradly_app/presentations/widgets/shimmer.dart';

class StoreFollowList extends StatelessWidget {
  const StoreFollowList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status is HomeStatusListLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.stores?.length ?? 0,
            itemBuilder: (context, index) {
              return TACardStoreFollow(
                stores: StoreModel(
                  id: state.stores?[index].id ?? 0,
                  name: state.stores?[index].name ?? '',
                  imageUrl: state.stores?[index].imageUrl ?? '',
                  description: state.stores?[index].description ?? '',
                  address: state.stores?[index].address ?? '',
                  webAddress: state.stores?[index].webAddress ?? '',
                  logoStore: state.stores?[index].logoStore ?? '',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
