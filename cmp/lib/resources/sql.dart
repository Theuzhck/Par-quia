abstract class SQLStrings {
  static const dbVersion = 1;

  // CREATE SCHEMA // CREATE DOMAIN tipo_evento as VARCHAR (7) NOT NULL;
  static const usuarioTableName = 'catalogo.usuario';
  static const telefoneUserTableName = 'catalogo.telefone_user';
  static const igrejaTableName = 'catalogo.igreja';
  static const liderTableName = 'catalogo.lider';
  static const telefoneIgrejaTableName = 'catalogo.telefone_ig';
  static const projetoTableName = 'catalogo.projeto';
  static const avaliaTableName = 'catalogo.avalia';
  static const eventoTableName = 'catalogo.evento';
  static const missaTableName = 'catalogo.missa';
  static const confissaoTableName = 'catalogo.confissao';
  static const geolocalizaTableName = 'catalogo.geolocaliza';
  static const enderecoTableName = 'catalogo.endereco';
  static const select = 'SELECT * FROM';
  static const update = 'UPDATE';
  static const delete = 'DELETE FROM';
  static const insert = 'INSERT INTO';

  static const tables = [
    usuarioTableName,
    telefoneUserTableName,
    igrejaTableName,
    liderTableName,
    telefoneIgrejaTableName,
    projetoTableName,
    avaliaTableName,
    eventoTableName,
    missaTableName,
    confissaoTableName,
    geolocalizaTableName,
    enderecoTableName,
  ];

  static const createTablesSQL = [
    """
CREATE TABLE IF NOT EXISTS $usuarioTableName
(
  idUsuario SERIAL NOT NULL UNIQUE,
  primeiro_nome VARCHAR (45) NOT NULL,
  sobrenome VARCHAR (45) NOT NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (idUsuario)
);""",
    """

CREATE TABLE IF NOT EXISTS $telefoneUserTableName
(
  idUsuario INT NOT NULL,
  telefone BIGINT NOT NULL,
  CONSTRAINT pk_telefone PRIMARY KEY (telefone),
  CONSTRAINT fk_idUsuario FOREIGN KEY (idUsuario)
  REFERENCES usuario (idUsuario)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);""",
    """

CREATE TABLE IF NOT EXISTS $igrejaTableName
(
  idIgreja SERIAL NOT NULL UNIQUE,
  nome VARCHAR (45) NOT NULL,
  secretaria VARCHAR (45),
  matriz VARCHAR (45) NOT NULL,
  CONSTRAINT pk_igreja PRIMARY KEY (idIgreja, nome)
);""",
    """

CREATE TABLE IF NOT EXISTS $liderTableName
(
  idLider INT NOT NULL,
  data_inicio DATE NOT NULL,
  status VARCHAR(7) NOT NULL,
  tempo_permanencia VARCHAR (45) NOT NULL,
  idIgreja INT NOT NULL,
  igreja_nome VARCHAR (45) NOT NULL,
  CONSTRAINT pk_lider PRIMARY KEY (idLider),
  CONSTRAINT fk_lider_usuario FOREIGN KEY (idLider) REFERENCES $usuarioTableName (idUsuario)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  CONSTRAINT fk_lider_igreja FOREIGN KEY (idIgreja, igreja_nome) REFERENCES $igrejaTableName (idIgreja, nome)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
);""",
    """

CREATE TABLE IF NOT EXISTS $telefoneIgrejaTableName
(
  idIgreja INT NOT NULL,
  telefone_ig BIGINT NOT NULL,
  CONSTRAINT pk_telefone_ig PRIMARY KEY (telefone_ig),
  CONSTRAINT fk_telefone_ig FOREIGN KEY (idIgreja) REFERENCES $igrejaTableName (idIgreja)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
);""",
    """

CREATE TABLE IF NOT EXISTS $projetoTableName
(
  idLider INT NOT NULL,
  voluntario INT NOT NULL,
  cod_proj INT NOT NULL,
  proj_nome VARCHAR(45) NOT NULL UNIQUE,
  descricao TEXT DEFAULT 'pequena descrição',
  CONSTRAINT pk_projeto PRIMARY KEY (cod_proj),
  CONSTRAINT fk_projeto_lider FOREIGN KEY (idlider) REFERENCES $liderTableName (idLider)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  CONSTRAINT fk_projeto_volun FOREIGN KEY (voluntario) REFERENCES $usuarioTableName (idUsuario)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
);""",
    """


CREATE TABLE IF NOT EXISTS $avaliaTableName
(
  idAvalia INT NOT NULL,
  avaliador INT NOT NULL,
  lider_avaliado INT NOT NULL,
  comentario TEXT DEFAULT 'descreva sua avaliacao',
  CONSTRAINT pk_avalia PRIMARY KEY (idAvalia),
  CONSTRAINT fk_avaliador FOREIGN KEY (avaliador) REFERENCES $usuarioTableName (idUsuario)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  CONSTRAINT fk_lider_avaliado FOREIGN KEY (lider_avaliado) REFERENCES $liderTableName (idLider)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
);""",
    """

CREATE TABLE IF NOT EXISTS $eventoTableName
(
  idIgreja INT NOT NULL,
  cod_Evento tipo_evento UNIQUE,
  diaSemana VARCHAR(45) NOT NULL,
  CONSTRAINT pk_evento PRIMARY KEY (cod_Evento),
  CONSTRAINT fk_evento FOREIGN KEY (idIgreja) REFERENCES $igrejaTableName (idIgreja)
  ON UPDATE CASCADE
  ON DELETE CASCADE  
);""",
    """


CREATE TABLE IF NOT EXISTS $missaTableName
(
  cod_Missa tipo_evento UNIQUE,
  nome VARCHAR (45),
  hora_inicio TIME with TIME ZONE,
  hora_fim TIME with TIME ZONE,
  CONSTRAINT pk_Missa PRIMARY KEY (cod_Missa)
);""",
    """


CREATE TABLE IF NOT EXISTS $confissaoTableName
(
  cod_Confissao tipo_evento UNIQUE,
  hora_inicio TIME with TIME ZONE,
  hora_fim TIME with TIME ZONE,
  CONSTRAINT pk_Confissao PRIMARY KEY (cod_Confissao)
);""",
    """

CREATE TABLE IF NOT EXISTS $geolocalizaTableName
(
  idIgreja INT NOT NULL,
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  CONSTRAINT pk_geolocaliza PRIMARY KEY (latitude, longitude),
  CONSTRAINT fk_geolocaliza_igreja FOREIGN KEY (idIgreja) REFERENCES $igrejaTableName (idIgreja)
);""",
    """

CREATE TABLE IF NOT EXISTS $enderecoTableName
(
  cep VARCHAR(8) NOT NULL,
  idIgreja INT NOT NULL,
  igreja_nome VARCHAR (45) NOT NULL,
  latitude REAL,
  longitude REAL,
  rua VARCHAR (45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  uf VARCHAR (2) NOT NULL,
  CONSTRAINT pk_endereco PRIMARY KEY (cep),
  CONSTRAINT fk_endereco_igreja FOREIGN KEY (idIgreja, igreja_nome) REFERENCES $igrejaTableName (idIgreja, nome)
  ON UPDATE CASCADE
  ON DELETE NO ACTION,
  CONSTRAINT fk_endereco_geo FOREIGN KEY (latitude, longitude) REFERENCES $geolocalizaTableName (latitude, longitude)
  ON UPDATE CASCADE
  ON DELETE NO ACTION
);""",
    """


INSERT INTO $usuarioTableName VALUES (1,'Gabriel','Leite Ribeiro');""",
    """

INSERT INTO $telefoneUserTableName VALUES (1, 79998270297);""",
    """

INSERT INTO $igrejaTableName VALUES (1, 'Igreja Sagrado Coração de Jesus', NULL, 'Igreja Matriz do Sagrado Coração de Jesus');""",
    """

INSERT INTO $liderTableName VALUES (1, '2022-11-24', 'ativo', '2 meses a partir do inicio', 1, 'Igreja Sagrado Coração de Jesus');""",
    """

INSERT INTO $telefoneIgrejaTableName VALUES (1, 7930270215);""",
    """

INSERT INTO $projetoTableName VALUES (1, 1, 1001, 'projeto solidario', '');""",
    """

INSERT INTO $avaliaTableName VALUES (101, 1, 1, 'achei fraco o discurso');""",
    """

INSERT INTO $eventoTableName VALUES (1, 'CON1000', 'quinta-feira');""",
    """
INSERT INTO $eventoTableName VALUES (1, 'MIS1000', 'quarta-feira');""",
    """

INSERT INTO $missaTableName VALUES ('MIS1000', 'Missa de Setimo Dia', '19:00:00', '21:30:00');""",
    """

INSERT INTO $confissaoTableName VALUES ('CON1000', '15:00:00', '16:30:00');""",
    """

INSERT INTO $geolocalizaTableName VALUES (1, -10.934200, -37.059700);""",
    """

INSERT INTO $enderecoTableName VALUES ('49020450', 1, 'Igreja Sagrado Coração de Jesus',-10.934200, -37.059700, 'Av. Pedro Paes Azevedo', 'Grageru', 'Aracaju', 'SE');""",
  ];
}

//       """


// /*
// Isso aqui é para o Query SQL
// set search_path to 

// SELECT i.nome, diasemana, cod_missa, m.hora_inicio, m.hora_fim
// FROM $eventoTableName e JOIN $igrejaTableName i USING (idIgreja)
// 	LEFT JOIN $missaTableName m ON (e.cod_Evento = m.cod_Missa)
// 	LEFT JOIN $confissaoTableName c ON (e.cod_Evento = c.cod_Confissao)
// WHERE cod_missa IS NOT NULL;

// SELECT i.nome, diasemana, cod_confissao, c.hora_inicio, c.hora_fim
// FROM $eventoTableName e JOIN $igrejaTableName i USING (idIgreja)
// 	LEFT JOIN $missaTableName m ON (e.cod_Evento = m.cod_Missa)
// 	LEFT JOIN $confissaoTableName c ON (e.cod_Evento = c.cod_Confissao)
// WHERE cod_confissao IS NOT NULL;

// SELECT *
// FROM $usuarioTableName u JOIN $telefoneUserTableName t1 USING (idUsuario)
// 	JOIN $liderTableName l ON (idUsuario = l.idlider);

// WITH endereco_cep_format as (
//   SELECT (substring(cep,1,2) || '.' ||
//           substring(cep,3,3) || '-' ||
//           substring(cep,6) )as cep,	idIgreja, igreja_nome, latitude, longitude, rua, bairro, cidade, uf
//   FROM $enderecoTableName
// )

// SELECT *
// FROM endereco_cep_format
// */"""
