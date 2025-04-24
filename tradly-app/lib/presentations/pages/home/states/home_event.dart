import 'package:equatable/equatable.dart';

sealed class HomeEvt extends Equatable {
  const HomeEvt();

  @override
  List<Object> get props => [];
}

final class HomeInitializeEvt extends HomeEvt {
  const HomeInitializeEvt({
    required this.productId,
  });

  final int productId;

  @override
  List<Object> get props => [productId];
}
