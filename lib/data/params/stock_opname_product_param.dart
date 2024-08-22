class StockOpnameProductParam {
  StockOpnameProductParam(this.id, this.qtySystem, this.qtyActual);

  int id;
  int qtySystem;
  int qtyActual;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qty_system': qtySystem,
      'qty_actual': qtyActual,
    };
  }

  @override
  String toString() {
    return '''\n    {\n 'id': $id,\n'qtySystem': $qtySystem,\n'qtyActual': $qtyActual\n}''';
  }
}
