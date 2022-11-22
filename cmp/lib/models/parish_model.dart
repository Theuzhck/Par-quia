class ParishModel {
  int? idIgreja;
  String? nome;
  String? arquidiocese;
  String? vicariato;
  String? forania;
  String? paroco;
  String? vigario;
  String? endereco;
  String? telefone;
  String? email;
  String? instagram;
  String? facebook;
  String? youtube;
  String? secretaria;

  ParishModel(
      {this.idIgreja,
      this.nome,
      this.arquidiocese,
      this.vicariato,
      this.forania,
      this.paroco,
      this.vigario,
      this.endereco,
      this.telefone,
      this.email,
      this.instagram,
      this.facebook,
      this.youtube,
      this.secretaria});

  ParishModel.fromJson(Map<String, dynamic> json) {
    idIgreja = json['igreja']['idigreja'];
    nome = json['igreja']['nome'];
    arquidiocese = json['arquidiocese'];
    vicariato = json['vicariato'];
    forania = json['forania'];
    paroco = json['paroco'];
    vigario = json['vigario'];
    endereco = json['endereco'];
    telefone = json['telefone'];
    email = json['email'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    secretaria = json['igreja']['secretaria'];
  }

  ParishModel.listToJson(List list) {
    idIgreja = list[0];
    nome = list[1];
    secretaria = list[2];
  }

  List toList(ParishModel item) {
    return [
      'DEFAULT',
      '\'${item.nome}\'',
      item.secretaria == '' || item.secretaria == null
          ? 'NULL'
          : '\'${item.secretaria}\'',
      '\'${item.nome}\''
    ];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idIgreja'] = idIgreja;
    data['paroquia'] = nome;
    data['arquidiocese'] = arquidiocese;
    data['vicariato'] = vicariato;
    data['forania'] = forania;
    data['paroco'] = paroco;
    data['vigario'] = vigario;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    data['email'] = email;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['youtube'] = youtube;
    data['secretaria'] = secretaria;
    return data;
  }
}
