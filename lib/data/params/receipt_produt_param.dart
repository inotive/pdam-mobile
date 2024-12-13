class ReceiptProductParam {
  ReceiptProductParam(this.id, this.qty);

  int id;
  int qty;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qty': qty,
    };
  }

  @override
  String toString() {
    return '''\n    {\n 'id': $id,\n'qty': $qty,\n}''';
  }

  ReceiptProductParam copyWith({
    int? id,
    int? qty,
  }) =>
      ReceiptProductParam(id ?? this.id, qty ?? this.qty);
}
