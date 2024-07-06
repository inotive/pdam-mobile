import 'package:pdam_inventory/dummy/dummy_model.dart';
import 'package:pdam_inventory/persentations/resources/asset_app.dart';
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
    routes: '',
  ),
  FeatureDummyModel(
    id: 2,
    title: StringApp.product,
    icon: ImageApp.product,
    routes: '',
  ),
  FeatureDummyModel(
    id: 3,
    title: StringApp.purchaseItem,
    icon: ImageApp.purchaseItem,
    routes: '',
  ),
  FeatureDummyModel(
    id: 4,
    title: StringApp.stockOpname,
    icon: ImageApp.stockOpname,
    routes: '',
  ),
  FeatureDummyModel(
    id: 4,
    title: StringApp.requestedItem,
    icon: ImageApp.requestItem,
    routes: '',
  ),
];
