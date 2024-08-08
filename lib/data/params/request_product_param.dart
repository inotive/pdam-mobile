class RequestProductParam {
  RequestProductParam(this.id, this.name, this.qty, this.unit);

  String id;
  String name;
  int qty;
  String unit;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qty': qty,
      'unit': unit,
    };
  }

  @override
  String toString() {
    return '''\n    {\n 'id': $id,\n'name': $name,\n'qty': $qty,\n'unit': $unit,\n}''';
  }
}
