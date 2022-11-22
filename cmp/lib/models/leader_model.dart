import 'package:cmp/models/parish_model.dart';

class LeaderModel {
  int? idLider;
  DateTime? dataInicio;
  String? status;
  String? tempoPermanencia;
  int? idIgreja;
  String? nomeIgreja;

  LeaderModel({
    this.idLider,
    this.dataInicio,
    this.status,
    this.tempoPermanencia,
    this.idIgreja,
    this.nomeIgreja,
  });

  LeaderModel.fromJson(Map<String, dynamic> json) {
    idLider = json['lider']['idlider'];
    dataInicio = json['lider']['dataInicio'];
    status = json['lider']['status'];
    tempoPermanencia = json['lider']['tempoPermanencia'];
    idIgreja = json['lider']['idIgreja'];
    nomeIgreja = json['lider']['nomeIgreja'];
  }

  LeaderModel.listToJson(List list) {
    idLider = list[0];
    dataInicio = list[1];
    status = list[2];
    tempoPermanencia = list[3];
    idIgreja = list[4];
    nomeIgreja = list[5];
  }

  List toList(LeaderModel item) {
    return [
      'DEFAULT',
      '\'${item.dataInicio}\'',
      '\'${item.status}\'',
      '\'${item.tempoPermanencia}\'',
      '\'${item.idIgreja}\'',
      '\'${item.nomeIgreja}\''
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idlider'] = idLider;
    data['dataInicio'] = dataInicio;
    data['status'] = status;
    data['tempoPermanencia'] = tempoPermanencia;
    data['idIgreja'] = idIgreja;
    data['nomeIgreja'] = nomeIgreja;
    return data;
  }
}
