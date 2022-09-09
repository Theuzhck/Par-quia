class ParishModel {
  int? id;
  String? paroquia;
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

  ParishModel(
      {this.id,
      this.paroquia,
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
      this.youtube});

  ParishModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paroquia = json['paroquia'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paroquia'] = paroquia;
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
    return data;
  }
}
