// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';

List<String> trackIcon = [
  Mdi.chef_hat,
  MaterialSymbols.cooking,
  Mdi.motorbike,
  Healthicons.yes
];

class Process {
  String name;
  Duration duration;

  Process({
    required this.name,
    required this.duration,
  });
}

final List<Process> processes = [
  Process(name: 'Prospect', duration: Duration(seconds: 1)),
  Process(name: 'Tour', duration: Duration(seconds: 5)),
  Process(name: 'Offer', duration: Duration(seconds: 6)),
  Process(name: 'Contract', duration: Duration(seconds: 1)),
];
