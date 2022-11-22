class UserModel {
  int? idUsuario;
  String? primeiroNome;
  String? sobrenome;

  UserModel({
    this.idUsuario,
    this.primeiroNome,
    this.sobrenome,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['usuario']['idusuario'];
    primeiroNome = json['usuario']['primeiro_nome'];
    sobrenome = json['usuario']['sobrenome'];
  }

  UserModel.listToJson(List list) {
    idUsuario = list[0];
    primeiroNome = list[1];
    sobrenome = list[2];
  }

  List toList(UserModel item) {
    return ['DEFAULT', '\'${item.primeiroNome}\'', '\'${item.sobrenome}\''];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idUsuario'] = idUsuario;
    data['primeiroNome'] = primeiroNome;
    data['sobrenome'] = sobrenome;
    return data;
  }
}
