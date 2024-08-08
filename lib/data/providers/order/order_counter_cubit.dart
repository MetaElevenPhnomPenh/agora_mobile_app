import 'package:bloc/bloc.dart';

import '../../../export.dart';

class OrderCounterCubit extends Cubit<OrderCounterState> {
  OrderCounterCubit() : super(const OrderCounterState());

  void increment() {
    emit(
      state.copyWith(
        orderAmount: (state.orderAmount ?? 0) + 1,
      ),
    );
  }

  void decrement() {
    if ((state.orderAmount ?? 0) > 0)
      emit(
        state.copyWith(
          orderAmount: (state.orderAmount ?? 0) - 1,
        ),
      );
  }

  void selectColor(int color) {
    emit(
      state.copyWith(
        colorSelected: color,
      ),
    );
  }

  void selectSize(int size) {
    emit(
      state.copyWith(
        sizeSelected: size,
      ),
    );
  }

  void reset() => emit(
        state.copyWith(
          orderAmount: 0,
          sizeSelected: -1,
          colorSelected: -1,
        ),
      );
}
