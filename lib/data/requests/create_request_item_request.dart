import 'package:pdam_inventory/data/params/request_product_param.dart';

class CreateRequestItemRequest {
  CreateRequestItemRequest(
    this.requestNumber,
    this.departmentName,
    this.requestDate,
    this.requestName,
    this.requestDescription,
    this.productList,
  );
  String requestNumber;
  String departmentName;
  String requestDate;
  String requestName;
  String requestDescription;
  List<RequestProductParam> productList;
}
