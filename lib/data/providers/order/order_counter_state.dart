import 'package:equatable/equatable.dart';

class OrderCounterState extends Equatable {
  final int? orderAmount;
  final int? colorSelected;
  final int? sizeSelected;

  const OrderCounterState({
    this.orderAmount,
    this.colorSelected,
    this.sizeSelected,
  });

  OrderCounterState copyWith({
    int? orderAmount,
    int? colorSelected,
    int? sizeSelected,
  }) {
    return OrderCounterState(
      orderAmount: orderAmount ?? this.orderAmount,
      colorSelected: colorSelected ?? this.colorSelected,
      sizeSelected: sizeSelected ?? this.sizeSelected,
    );
  }

  @override
  List<Object?> get props => [
        orderAmount,
        colorSelected,
        sizeSelected,
      ];
}
