/// product_service


////////////////// Interface

abstract class ProductInterface {
  //Future<BaseResponse<String>> method();
}

////////////////// Repository

class ProductRepository implements ProductInterface {
  final ProductService _service = ProductService();
}

////////////////// Service

class ProductService implements ProductInterface {}
