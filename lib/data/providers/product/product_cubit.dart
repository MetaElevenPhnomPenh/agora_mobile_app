/// product_cubit
import 'package:agora/export.dart';

typedef ProductState = BaseBlocState<ProductResponse>;

class ProductCubit extends BaseBlocCubit<ProductResponse> {
  final ProductRepository repository;

  ProductCubit(this.repository);

  @override
  Future<BaseResponse<ProductResponse>> responseData([String? id, data, subData, bool isNetwork = true]) {
    // TODO: implement responseData
    throw UnimplementedError();
  }
}
