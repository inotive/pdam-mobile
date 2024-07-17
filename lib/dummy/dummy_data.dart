import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
import 'package:pdam_inventory/persentations/resources/route_app.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

List<NotificationDummyModel> notifications = [
  NotificationDummyModel(
    id: 1,
    code: 'PR00001',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 0,
  ),
  NotificationDummyModel(
    id: 2,
    code: 'PR00002',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 0,
  ),
  NotificationDummyModel(
    id: 3,
    code: 'PR00003',
    desc: 'Disetujui',
    date: '04 Juli 2024 12:21:52',
    isRead: 0,
  ),
  NotificationDummyModel(
    id: 4,
    code: 'PR00004',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 1,
  ),
  NotificationDummyModel(
    id: 5,
    code: 'PR00005',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 1,
  ),
  NotificationDummyModel(
    id: 6,
    code: 'PR00006',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 1,
  ),
  NotificationDummyModel(
    id: 7,
    code: 'PR00007',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 1,
  ),
  NotificationDummyModel(
    id: 8,
    code: 'PR00008',
    desc: 'Sedang menunggu persetujuan kamu',
    date: '04 Juli 2024 12:21:52',
    isRead: 1,
  ),
];

List<FeatureDummyModel> features = [
  FeatureDummyModel(
    id: 1,
    title: StringApp.historyStock,
    icon: ImageApp.historyStock,
    routes: Routes.historyStock,
  ),
  FeatureDummyModel(
    id: 2,
    title: StringApp.product,
    icon: ImageApp.product,
    routes: Routes.product,
  ),
  FeatureDummyModel(
    id: 3,
    title: StringApp.purchaseItem,
    icon: ImageApp.purchaseItem,
    routes: Routes.purchaseItem,
  ),
  FeatureDummyModel(
    id: 4,
    title: StringApp.stockOpname,
    icon: ImageApp.stockOpname,
    routes: Routes.stockOpname,
  ),
  FeatureDummyModel(
    id: 4,
    title: StringApp.requestedItem,
    icon: ImageApp.requestItem,
    routes: Routes.requestedItem,
  ),
  FeatureDummyModel(
    id: 5,
    title: StringApp.acceptedItem,
    icon: ImageApp.acceptedItem,
    routes: Routes.acceptedItem,
  ),
];

List<StatusModel> statuses = [
  StatusModel(
    id: 1,
    text: 'Semua',
    isActive: true,
  ),
  StatusModel(
    id: 2,
    text: 'Barang Masuk',
    isActive: false,
  ),
  StatusModel(
    id: 3,
    text: 'Barang Keluar',
    isActive: false,
  ),
];

List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: 'Equal Tee Coupler hdpe 75mm',
    stock: 2451,
    addedStock: 214,
    date: '04 Jul 2024',
    type: 'Pembelian',
    status: 'Barang Masuk',
    image:
        'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
  ),
  ProductModel(
    id: 2,
    name: 'Reducing Coupler hdpe 63mm',
    stock: 2201,
    addedStock: 100,
    date: '03 Jul 2024',
    type: 'Transfer Barang',
    status: 'Barang Masuk',
    image:
        'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
  ),
  ProductModel(
    id: 3,
    name: 'Equal Tee Coupler hdpe 75mm',
    stock: 2451,
    addedStock: 54,
    date: '01 Jul 2024',
    type: 'Rusak',
    status: 'Barang Keluar',
    image:
        'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
  ),
  ProductModel(
    id: 4,
    name: 'Equal Tee Coupler hdpe 75mm',
    stock: 2201,
    addedStock: 180,
    date: '03 Jul 2024',
    type: 'Pembelian',
    status: 'Barang Masuk',
    image:
        'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
  ),
  ProductModel(
    id: 5,
    name: 'Reducing Coupler hdpe 110mm-90mm',
    stock: 2201,
    addedStock: 100,
    date: '03 Jul 2024',
    type: 'Hilang',
    status: 'Barang Keluar',
    image:
        'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
  ),
  ProductModel(
    id: 6,
    name: 'Reducing Coupler hdpe 63mm',
    stock: 2201,
    addedStock: 100,
    date: '03 Jul 2024',
    type: 'Transfer Barang',
    status: 'Barang Keluar',
    image:
        'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
  ),
  ProductModel(
    id: 7,
    name: 'Equal Tee Coupler hdpe 75mm',
    stock: 2201,
    addedStock: 180,
    date: '03 Jul 2024',
    type: 'Pembelian',
    status: 'Barang Masuk',
    image:
        'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
  ),
  ProductModel(
    id: 8,
    name: 'Equal Tee Coupler hdpe 75mm',
    stock: 2201,
    addedStock: 180,
    date: '03 Jul 2024',
    type: 'Pembelian',
    status: 'Barang Masuk',
    image:
        'https://s3-alpha-sig.figma.com/img/5fd9/329c/e57c8cd2f9f43cfbe953c40b4918e1dd?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=py~Lx2eiRv-lxA0QIudhUAYglg8of2PNz4sxgj8w09YGCLT2VfoWvcJWP6I3XdIdkCr76v4stUBDa~ZUSxN90DHZazjPPgm137YSgZUzMepNaDgfcbgq~Oj5N4HUPwdd17TFHsOaIR-PQprYQOsf2RrDhq7~eFXzCEMsHDGv9UdLQabeluMR27eomvBXKCUNy-63q2yL3F074H04lShdzQqrBMPBqhDlQ9tc5q8c87v8bO3-x8CU3dpvkI2pkYpZ~kcYEdwshCQTsP-4M0k21gA6hxUXXQ9D12Gmq2-kL0FpFlbq4ZaPBXrOkUDZllyruEDCMnzavLYXY7p9fnJdIw__',
  ),
  ProductModel(
    id: 9,
    name: 'Reducing Coupler hdpe 110mm-90mm',
    stock: 2201,
    addedStock: 100,
    date: '03 Jul 2024',
    type: 'Hilang',
    status: 'Barang Keluar',
    image:
        'https://s3-alpha-sig.figma.com/img/492e/aef3/023115226ab55879588194128edabbc1?Expires=1721001600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OnXPf31kgmeL~gM8cTP9dL8PnLe4oQCbdX0jMbpDosf1oqFDqv58bdrROmGmjQ8UbQQJtg2Vxx7qRU8jrZmpe7UyqzxNsXWzra44GZgC3yHUN3C1U~2fspWALUJGpSsFURhwUZAxrmAcw2knUZbxes21PEm2GoCT0WGlZUsjYaIN4nZvGsWRTJyv2mH9kF6XkoGCQR7jimrN9fVq9UBVccvjhtqM4lB0a57PceczQKpa9r6YlBjPhZXN6Rsza9ZlCrlcWgwhoO9WfFdbhbQzqcK-qYjBLcm5lOnygRyoWaimV7sKrR~abaMVz2qFQY9GIZ0RYtK9XamKOOfqOgrzaw__',
  ),
];

List<String> opnameDropdowns = [
  'OPO-091289237812',
  'OPO-129ASA123K12',
  'OPO-9871263QWQ71',
  'OPO-9871263QWQ72',
  'OPO-9871263QWQ74',
];
