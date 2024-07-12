// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'pagination_base_response.g.dart';

@JsonSerializable()
class PaginationBaseResponse {
  @JsonKey(name: 'links')
  LinksResponse? links;
  @JsonKey(name: 'status')
  StatusPaginationResponse? status;
  @JsonKey(name: "meta")
  MetaPaginationResponse? meta;
}

@JsonSerializable()
class LinksResponse {
  LinksResponse(this.first, this.last, this.next, this.prev);

  @JsonKey(name: 'first')
  String? first;
  @JsonKey(name: 'last')
  String? last;
  @JsonKey(name: 'prev')
  String? prev;
  @JsonKey(name: 'next')
  String? next;

  factory LinksResponse.fromJson(Map<String, dynamic> json) => _$LinksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinksResponseToJson(this);
}

@JsonSerializable()
class StatusPaginationResponse {
  StatusPaginationResponse(this.code, this.message);

  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "message")
  String? message;

  factory StatusPaginationResponse.fromJson(Map<String, dynamic> json) => _$StatusPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatusPaginationResponseToJson(this);
}

@JsonSerializable()
class LinkItemResponse {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "active")
  bool? active;

  LinkItemResponse(this.url, this.label, this.active);

  factory LinkItemResponse.fromJson(Map<String, dynamic> json) => _$LinkItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinkItemResponseToJson(this);
}

@JsonSerializable()
class MetaPaginationResponse {
  MetaPaginationResponse(
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  );

  @JsonKey(name: "current_page")
  int? currentPage;
  @JsonKey(name: "from")
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  @JsonKey(name: "links")
  List<LinkItemResponse>? links;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  @JsonKey(name: "to")
  int? to;
  @JsonKey(name: "total")
  int? total;

  factory MetaPaginationResponse.fromJson(Map<String, dynamic> json) => _$MetaPaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaPaginationResponseToJson(this);
}
