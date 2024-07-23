// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:pdam_inventory/data/responses/pagination_base_response.dart';
part 'stock_opname_response.g.dart';

@JsonSerializable()
class StockOpnameResponse extends PaginationBaseResponse {
  StockOpnameResponse(this.data);

  @JsonKey(name: 'data')
  List<StockOpnameDataResponse> data;

  factory StockOpnameResponse.fromJson(Map<String, dynamic> json) => _$StockOpnameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameResponseToJson(this);
}

@JsonSerializable()
class StockOpnameDataResponse {
  StockOpnameDataResponse(
    this.id,
    this.warehouseId,
    this.opnameNumber,
    this.date,
    this.description,
    this.status,
    this.productCount,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.finishedDate,
  );

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'warehouse_id')
  String? warehouseId;
  @JsonKey(name: 'opname_number')
  String? opnameNumber;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'product_count')
  String? productCount;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'updated_by')
  String? updatedBy;
  @JsonKey(name: 'deleted_by')
  String? deletedBy;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'finished_date')
  String? finishedDate;

  factory StockOpnameDataResponse.fromJson(Map<String, dynamic> json) => _$StockOpnameDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StockOpnameDataResponseToJson(this);
}
