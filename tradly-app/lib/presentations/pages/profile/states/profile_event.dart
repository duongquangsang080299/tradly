import 'package:equatable/equatable.dart';

abstract class ProfileEvt extends Equatable {
  const ProfileEvt();

  @override
  List<Object?> get props => [];
}

class FetchProfileEvt extends ProfileEvt {
  const FetchProfileEvt();
}
