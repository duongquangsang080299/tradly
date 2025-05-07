import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/store_model.dart';
import 'package:tradly_app/presentations/pages/home/states/home_bloc.dart';
import 'package:tradly_app/presentations/pages/home/states/home_state.dart';
import 'package:tradly_app/presentations/widgets/card.dart';

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
              final stores = state.stores?[index];
              return TACardStoreFollow(
                stores: StoreModel(
                  id: stores?.id ?? 0,
                  name: stores?.name ?? '',
                  imageUrl: stores?.imageUrl ?? '',
                  description: stores?.description ?? '',
                  address: stores?.address ?? '',
                  webAddress: stores?.webAddress ?? '',
                  logoStore: stores?.logoStore ?? '',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
