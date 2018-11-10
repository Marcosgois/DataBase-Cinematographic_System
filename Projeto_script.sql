use projeto_hollywood;

create table if not exists Sexo( /*BD FILLED*/
	idSexo int not null auto_increment,
    descSexo Varchar(45),
	PRIMARY KEY(idSexo)
);

create table if not exists Filiacao(
	idFiliacao int not null auto_increment,
    nome_pai varchar(45),
    nome_mae varchar(45),
    DN_pai date,
    DN_mae date,
	PRIMARY KEY(idFiliacao)
);

create table if not exists Escolaridade(/*TODO - TO FILL*/
	idEscolaridade int not null auto_increment,
    descEscolaridade varchar(20),
	PRIMARY KEY(idEscolaridade)
);

create table if not exists Telefone(
	idTelefone int not null auto_increment,
    numero Varchar(45),
	PRIMARY KEY(idTelefone)
);

create table if not exists TipoTelefone(/*BD FILLED*/
	idTipoTelefone int not null auto_increment,
    desctipoTelefone varchar(45),
	PRIMARY KEY(idTipoTelefone)
);

create table if not exists Email(
	idEmail int not null auto_increment,
    descEmail varchar(45),
  PRIMARY KEY(idEmail)
);

create table if not exists EstadoCivil(/*BD FILLED*/
	idEstadoCivil int not null auto_increment,
    descEstadoCivil varchar(45),
	PRIMARY KEY(idEstadoCivil)
);

create table if not exists Nacionalidade(/*BD FILLED*/
	idNacionalidade int not null auto_increment,
    descNacionalidade varchar(45),
	PRIMARY KEY(idNacionalidade)
);

/* Aparentemente o mysql já tem uma palavra cache padrão */
create table if not exists Cachee(
	idCachee int not null auto_increment,
    valorCachee int,
    descCache varchar(45),
	PRIMARY KEY(idCachee)
);

create table if not exists Personagem(
	idPersonagem int not null auto_increment,
    nomePersonagem varchar(45),
	PRIMARY KEY(idPersonagem)
);

create table if not exists Pais(
 	idPais int not null auto_increment,
	NomePais varchar(45),
	DDI varchar(45),
	PRIMARY KEY(idPais)
);

create table if not exists UF(
	idUF int not null auto_increment,
	nomeUF varchar(45),
	descUF varchar(45),
	PRIMARY KEY(idUF)
);

create table if not exists Cidade(
	idCidade int not null auto_increment,
	nome varchar(45),
	DDD varchar(45),
	PRIMARY KEY(idCidade)
);

create table if not exists Bairro(
	idBairro int not null auto_increment,
	NomeBairro varchar(45),
	PRIMARY KEY(idBairro)
);

create table if not exists Endereco(
	idEndereco int not null auto_increment,
	nomeEndereco varchar(45),
	numeroEndereco int,
	PRIMARY KEY(idEndereco)
);

create table if not exists TipoEndereco(/*BD FILLED*/
	idTipoEndereco int,
	descEndereco varchar(45),
	PRIMARY KEY(idTipoEndereco)
);


create table if not exists FaturamentoAnoAnterior(
	idFaturamentoAnoAnterior int NOT NULL AUTO_INCREMENT,
    valor int,
	PRIMARY KEY(idFaturamentoAnoAnterior)
);

create table if not exists DonoEstudio(
	idDonoEstudio int not null auto_increment,
    nomeDono Varchar(45),
    DNDono date,
    CPFDono varchar(45),
	IdentidadeDono varchar(45),
	PRIMARY KEY(idDonoEstudio)
);

create table if not exists Estudio(
	idEstudio int NOT NULL auto_increment,
    idDonoEstudio int,
    nomeEstudio Varchar(45),
    dataFundacao date,
	PRIMARY KEY(idEstudio),
    FOREIGN KEY (idDonoEstudio) REFERENCES DonoEstudio(idDonoEstudio)
);

create table if not exists Filme(
	IdFilme int NOT NULL AUTO_INCREMENT,
    idEstudio int,
    nomeFilme Varchar(45),
    mesesProducaoFilme int,
    anoLancamentoFilme Date,
    copyrightNumberFilme int,
    custoFilme Varchar(45),
	PRIMARY KEY(IdFilme),
    FOREIGN KEY (idEstudio) REFERENCES Estudio(idEstudio)
);

create table if not exists Diretor(
	idDiretor int not null auto_increment,
	idSexo int,
    idNacionalidade int,
    idFiliacao int,
    idEmail int,
    idEscolaridade int,
    idTelefone int,
    idEndereco int,
    nomeDiretor varchar(45),
    DNDiretor date,
    CPFDiretor varchar(45),
    IdentidadeDiretor varchar(45),
	PRIMARY KEY(idDiretor),
	FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
    FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
    FOREIGN KEY (idEmail) REFERENCES Email(idEmail),
    FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
    FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
    FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

create table if not exists Ator(
	idAtor int not null auto_increment,
    idSexo int,
    idNacionalidade int,
    idFiliacao int,
    idEmail int,
    idEscolaridade int,
    idTelefone int,
    idEndereco int,
    seguroSocialAtor int,
    NomeAtor varchar(255),
    DNAtor date,
    CPFAtor varchar(45),
    IdentidadeAtor varchar(45),
	PRIMARY KEY(idAtor),
    FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
    FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
    FOREIGN KEY (idEmail) REFERENCES Email(idEmail),
    FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
    FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
    FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
);

create table if not exists TipoFisico(
	idTipoFisico int not null auto_increment,
	descTipoFisico varchar(45),
	PRIMARY KEY(idTipoFisico)
);

/*----------------------- Tabelas associativas----------------*/
create table if not exists Atuar(
	idCachee int,
	idPersonagem int,
	idAtor int,
	idFilme int,
	FOREIGN KEY (idCachee) REFERENCES Cachee(idCachee),
	FOREIGN KEY (idPersonagem) REFERENCES Personagem(idPersonagem),
	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor),
	FOREIGN KEY (idFilme) REFERENCES Filme(idFilme)
);

create table if not exists Dirigir(
	idDiretor int,
	idFilme int,
	FOREIGN KEY (idDiretor) REFERENCES Diretor(idDiretor),
	FOREIGN KEY (idFilme) REFERENCES Filme(idFilme)
);

/*----------------------- Preencher Dados ----------------*/
INSERT INTO Sexo (descSexo) 
Value 	('Masculino'),
        ('Feminino');

INSERT INTO Nacionalidade (descNacionalidade) 
Value 	('Brasileiro'),
        ('Americano'),
        ('Canadense'),
        ('Australiano'),
        ('Chinês'),
        ('Japonês');

INSERT INTO EstadoCivil (descEstadoCivil) 
Value 	('Solteiro'),
        ('Casado'),
        ('Separado'),
        ('Divorciado'),
        ('Viuvo');

INSERT INTO TipoTelefone (descTipoTelefone) 
Value 	('Celular'),
        ('Trabalho'),
        ('Comercial'),
        ('Residencial');
        
        
INSERT INTO Ator (idSexo, idNacionalidade, idFiliacao, idEmail, idEscolaridade, idTelefone, idEndereco, seguroSocialAtor, DNAtor, IdentidadeAtor) 
Value 	('1', '1', '0001', '1', '09/01/1996', '000.000.000-01', '000.000-001'),
/*IdAtor: Auto-Incremento [Não preenche], Sexo: M, idNasc: BR, idFilia: x, edEmail: x, idEsc: 1, idTel: 1, idEnd: 1, SeguroSocial, Nome: Otho, DNAtor: 09/01/1996, CPFAtor: 000.000.000-01, Identidade: 000.000-001
  sexo(1) = masculino
  Nacionalidade(1) = Brasileiro
  idFiliacao(x) = [Ainda precisa preencher para esse ator]
  idEmail(x) = [Ainda precisa preencher para esse ator]
  idEscolaridade(x) = [Ainda precisa preencher para esse ator]
  Precisa preencher 
			idAtor int not null auto_increment,
			idSexo int,
			idNacionalidade int,
			idFiliacao int,
			idEmail int,
			idEscolaridade int,
			idTelefone int,
			idEndereco int,
			seguroSocialAtor int,
			NomeAtor varchar(255),
			DNAtor date,
			CPFAtor varchar(45),
			IdentidadeAtor varchar(45),
			PRIMARY KEY(idAtor),
			FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
			FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
			FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
			FOREIGN KEY (idEmail) REFERENCES Email(idEmail),
			FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
			FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
			FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
			FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
        --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
		create table if not exists Diretor(
		idDiretor int not null auto_increment,
		idSexo int,
		idNacionalidade int,
		idFiliacao int,
		idEmail int,
		idEscolaridade int,
		idTelefone int,
		idEndereco int,
		nomeDiretor varchar(45),
		DNDiretor date,
		CPFDiretor varchar(45),
		IdentidadeDiretor varchar(45),
		PRIMARY KEY(idDiretor),
		FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
		FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
		FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
		FOREIGN KEY (idEmail) REFERENCES Email(idEmail),
		FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
		FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
		FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
		FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco)
		);
        */


