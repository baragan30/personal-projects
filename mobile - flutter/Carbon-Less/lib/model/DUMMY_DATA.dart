import 'package:echofootprint2/model/AppUser.dart';
import 'package:echofootprint2/model/company.dart';
import 'package:echofootprint2/model/voucher.dart';

List<Company> companies = [
  Company(
      id: 0,
      company_name: 'Red Bull',
      material: 'Aluminium',
      current_progress: 11,
      max_progress: 12,
      foodPrint: 289),
  Company(
      id: 1,
      company_name: 'Borsec', //355 ml 152 g C , cat ai pentru 500
      material: 'Pet',
      current_progress: 10,
      max_progress: 14,
      foodPrint: 82),
  Company(
      id: 2,
      company_name: 'Coca Cola',
      material: 'Pet',
      current_progress: 5,
      max_progress: 11,
      foodPrint: 220),
  Company(
      id: 3,
      company_name: 'Pepsi',
      material: 'Pet',
      current_progress: 3,
      max_progress: 9,
      foodPrint: 225),
];

var vouchers = [
  Voucher(id: 0, company: 'Red Bull', details: "get a free Red Bull"),
  Voucher(id: 1, company: 'Borsec', details: "get a free Borsec"),
  Voucher(id: 0, company: 'Red Bull', details: "get a free Red Bull"),
  Voucher(id: 1, company: 'Borsec', details: "get a free Borsec"),
  Voucher(id: 1, company: 'Borsec', details: "get a free Borsec"),
  Voucher(id: 0, company: 'Red Bull', details: "get a free Red Bull"),
  Voucher(id: 2, company: 'Coca Cola', details: "get a free Coca Cola"),
];
User user = User("Alexandru39", 94, 5000, 3000);
