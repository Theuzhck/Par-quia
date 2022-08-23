import 'package:cmp/layers/domain/entities/chapels_entity.dart';
import 'package:flutter/material.dart';

class ParishEntity {
  String parishName;
  String parishPriestName;
  String vicarName;
  double parishLocation;
  List<DateTime> confessionTimes;
  List<DateTime> massTimes;
  List<DateTime> worshipTimes;
  List<TextInputType> parishPhones;
  String parishInstagram;
  String parishFacebook;
  String parishYoutube;
  String parishEmail;
  String parishForay;
  String parishVicariate;
  List<ChapelEntity> parishChapels;
  ParishEntity({
    required this.parishName,
    required this.parishPriestName,
    required this.vicarName,
    required this.parishLocation,
    required this.confessionTimes,
    required this.massTimes,
    required this.worshipTimes,
    required this.parishPhones,
    required this.parishInstagram,
    required this.parishFacebook,
    required this.parishYoutube,
    required this.parishEmail,
    required this.parishForay,
    required this.parishVicariate,
    required this.parishChapels,
  });
}
