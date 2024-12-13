class RequestProductParam {
  RequestProductParam(this.id, this.name, this.qty, this.unit, this.code, this.image);

  int id;
  String name;
  int qty;
  String unit;
  String code;
  String image;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qty': qty,
      'unit': unit,
      'code': code,
      'image': image,
    };
  }

  @override
  String toString() {
    return '''\n    {\n 'id': $id,\n'name': $name,\n'qty': $qty,\n'unit': $unit,\n'code': $code,\n}''';
  }

  RequestProductParam copyWith({
    int? id,
    String? name,
    int? qty,
    String? unit,
    String? code,
    String? image,
  }) =>
      RequestProductParam(
        id ?? this.id,
        name ?? this.name,
        qty ?? this.qty,
        unit ?? this.unit,
        code ?? this.code,
        image ?? this.image,
      );
}
