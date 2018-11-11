create database projeto_hollywood;

use projeto_hollywood;

create table if not exists Sexo( /*BD FILLED*/
	idSexo int not null auto_increment,
    descSexo Varchar(45),
	PRIMARY KEY(idSexo)
);

create table if not exists TipoEndereco(/*BD FILLED*/
	idTipoEndereco int,
	descEndereco varchar(45),
	PRIMARY KEY(idTipoEndereco)
);

create table if not exists EstadoCivil(/*BD FILLED*/
	idEstadoCivil int not null auto_increment,
    descEstadoCivil varchar(45),
	PRIMARY KEY(idEstadoCivil)
);


/* Aparentemente o mysql já tem uma palavra cache padrão */
create table if not exists Cachee(/**/
	idCachee int not null auto_increment,
    valorCachee int,
    descCache varchar(45),
	PRIMARY KEY(idCachee)
);

create table if not exists FaturamentoAnoAnterior(/**/
	idFaturamentoAnoAnterior int NOT NULL AUTO_INCREMENT,
    valor int,
	PRIMARY KEY(idFaturamentoAnoAnterior)
);

create table if not exists Personagem(/**/
	idPersonagem int not null auto_increment,
    nomePersonagem varchar(45),
	PRIMARY KEY(idPersonagem)
);

create table if not exists Pais(/**/
 	idPais int not null auto_increment,
	NomePais varchar(45),
	DDI varchar(45),
	PRIMARY KEY(idPais)
);

create table if not exists Nacionalidade(/*BD FILLED*/
	idNacionalidade int not null auto_increment,
    descNacionalidade varchar(45),
	PRIMARY KEY(idNacionalidade)
);

create table if not exists TipoFisico(/**/
	idTipoFisico int not null auto_increment,
	descTipoFisico varchar(45),
	PRIMARY KEY(idTipoFisico)
);

create table if not exists Filiacao(/**/
	idFiliacao int not null auto_increment,
    nome_pai varchar(45),
    nome_mae varchar(45),
    DN_pai date,
    DN_mae date,
	PRIMARY KEY(idFiliacao)
);

create table if not exists Escolaridade(/*TODO - TO FILL*/
	idEscolaridade int not null auto_increment,
    descEscolaridade varchar(45),
	PRIMARY KEY(idEscolaridade)
);


create table if not exists TipoTelefone(/*BD FILLED*/
	idTipoTelefone int not null auto_increment,
    desctipoTelefone varchar(45),
	PRIMARY KEY(idTipoTelefone)
);

create table if not exists Diretor(/**/
	idDiretor int not null auto_increment,
	idSexo int,
    idNacionalidade int,
    idFiliacao int,
    idEscolaridade int,
    idEstadoCivil int,
    nomeDiretor varchar(45),
    DNDiretor date,
    CPFDiretor varchar(45),
    IdentidadeDiretor varchar(45),
	PRIMARY KEY(idDiretor),
	FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
    FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
    FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade),
	FOREIGN KEY (idEstadoCivil) REFERENCES EstadoCivil(idEstadoCivil)
);

create table if not exists Ator(/**/
	idAtor int not null auto_increment,
    idSexo int,
    idNacionalidade int,
    idFiliacao int,
    idEscolaridade int,
	idEstadoCivil int,
    seguroSocialAtor varchar(255),
    NomeAtor varchar(255),
    DNAtor date,
    CPFAtor varchar(45),
    IdentidadeAtor varchar(45),
	PRIMARY KEY(idAtor),
    FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY (idEstadoCivil) REFERENCES EstadoCivil(idEstadoCivil),
	FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
    FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
    FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade)
);

create table if not exists DonoEstudio(/**/
	idDonoEstudio int not null auto_increment,
	idSexo int,
    idNacionalidade int,
    idFiliacao int,
    idEscolaridade int,
	idEstadoCivil int,
    nomeDono Varchar(45),
    DNDono date,
    CPFDono varchar(45),
	IdentidadeDono varchar(45),
	PRIMARY KEY(idDonoEstudio),
	FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo),
	FOREIGN KEY (idEstadoCivil) REFERENCES EstadoCivil(idEstadoCivil),
	FOREIGN KEY (idNacionalidade) REFERENCES Nacionalidade(idNacionalidade),
    FOREIGN KEY (idFiliacao) REFERENCES Filiacao(idFiliacao),
    FOREIGN KEY (idEscolaridade) REFERENCES Escolaridade(idEscolaridade)
);

create table if not exists Telefone(/**/
	idTelefone int not null auto_increment,
	idDiretor int,
	idAtor int,
	idTipoTelefone int,
	idDonoEstudio int,
    numero Varchar(45),
	PRIMARY KEY(idTelefone),
	FOREIGN KEY (idDiretor) REFERENCES Diretor(idDiretor),
	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor),
	FOREIGN KEY (idTipoTelefone) REFERENCES TipoTelefone(idTipoTelefone),
	FOREIGN KEY (idDonoEstudio) REFERENCES DonoEstudio(idDonoEstudio)
);

create table if not exists Email(/**/
	idEmail int not null auto_increment,
	idAtor int,
	idDiretor int,
	idDonoEstudio int,
    descEmail varchar(45),
	PRIMARY KEY(idEmail),
  	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor),
  	FOREIGN KEY (idDiretor) REFERENCES Diretor(idDiretor),
	FOREIGN KEY (idDonoEstudio) REFERENCES DonoEstudio(idDonoEstudio)
);

create table if not exists UF(/**/
	idUF int not null auto_increment,
	idPais int,
	nomeUF varchar(45),
	descUF varchar(45),
	PRIMARY KEY(idUF),
	FOREIGN KEY (idPais) REFERENCES Pais(idPais)
);

create table if not exists Cidade(/**/
	idCidade int not null auto_increment,
	idUF int,
	nome varchar(45),
	DDD varchar(45),
	PRIMARY KEY(idCidade),
	FOREIGN KEY (idUF) REFERENCES UF(idUF)
);

create table if not exists Bairro(/**/
	idBairro int not null auto_increment,
	idCidade int,
	NomeBairro varchar(45),
	PRIMARY KEY(idBairro),
	FOREIGN KEY (idCidade) REFERENCES Cidade(idCidade)
);

create table if not exists Endereco(/**/
	idEndereco int not null auto_increment,
	idAtor int,
	idDiretor int,
	idDonoEstudio int,
	idBairro int,
	idTipoEndereco int,
	nomeEndereco varchar(45),
	numeroEndereco int,
	PRIMARY KEY(idEndereco),
	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor),
	FOREIGN KEY (idDiretor) REFERENCES Diretor(idDiretor),
	FOREIGN KEY (idDonoEstudio) REFERENCES DonoEstudio(idDonoEstudio),
	FOREIGN KEY (idBairro) REFERENCES Bairro(idBairro),
	FOREIGN KEY (idTipoEndereco) REFERENCES TipoEndereco(idTipoEndereco)
);

create table if not exists Estudio(/**/
	idEstudio int NOT NULL auto_increment,
    idDonoEstudio int,
	idFaturamentoAnoAnterior int,
    nomeEstudio Varchar(45),
    dataFundacao date,
	PRIMARY KEY(idEstudio),
    FOREIGN KEY (idDonoEstudio) REFERENCES DonoEstudio(idDonoEstudio),
	FOREIGN KEY (idFaturamentoAnoAnterior) REFERENCES FaturamentoAnoAnterior(idFaturamentoAnoAnterior)
);

create table if not exists Filme(/**/
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

/*----------------------- Tabelas associativas----------------*/
create table if not exists Atuar(/**/
	idCachee int,
	idPersonagem int,
	idAtor int,
	idFilme int,
	FOREIGN KEY (idCachee) REFERENCES Cachee(idCachee),
	FOREIGN KEY (idPersonagem) REFERENCES Personagem(idPersonagem),
	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor),
	FOREIGN KEY (idFilme) REFERENCES Filme(idFilme)
);

create table if not exists Dirigir(/**/
	idDiretor int,
	idFilme int,
	FOREIGN KEY (idDiretor) REFERENCES Diretor(idDiretor),
	FOREIGN KEY (idFilme) REFERENCES Filme(idFilme)
);

create table if not exists Perfil(/**/
	idTipoFisico int,
	idAtor int,
	FOREIGN KEY (idTipoFisico) REFERENCES TipoFisico(idTipoFisico),
	FOREIGN KEY (idAtor) REFERENCES Ator(idAtor)
);

/*----------------------- Preencher Dados ----------------*/
INSERT INTO Sexo (descSexo) 
Value 	('Masculino'),						/*1*/
        ('Feminino');						/*2*/
        
INSERT INTO Escolaridade(descEscolaridade) 
Value	('Ensino Fundamental incompleto'),	/*1*/
		('Ensino Fundamental completo'),	/*2*/
		('Ensino Medio incompleto'),		/*3*/
		('Ensino Medio completo'),			/*4*/
		('Ensino Superior incompleto'),		/*5*/
		('Ensino Superior completo'),		/*6*/
		('Pós-Graduação');					/*7*/
        
INSERT INTO Filiacao (nome_pai,nome_mae,DN_pai,DN_mae) 
Value 	('William Alvin Pitt',
        'Jane Etta Pitt',
        '1941-12-08',
        '1940-07-24'),						/*1*/
        
        ('Johannes Waltz',
        'Elisabeth Urbancic',
        '1922-04-11',
        '1925-08-13'),						/*2*/
        
        ('Josef Fassbender',
        'Adele Fassbender',
        '1946-02-12',
        '1944-11-23'),						/*3*/
        
        ('Sheldon Roth',
		'Cora Roth',
        '1938-02-12',
        '1940-04-10'),						/*4*/

		('Donald Furcillo',
		'June Frances Nicholson',
        '1909-06-08',
        '1918-02-15'),						/*5*/

		('Robert Richardson Duvall',
		'Bobbie Ruth Crawford',
        '1900-06-15',
        '1907-12-28'),						/*6*/

		('George Dicaprio',
		'Irmelin Indenbirken',
        '1943-11-30',
        '1943-02-14'),						/*7*/

		('Chips Hardy',
		'1950-01-23',
        'Elizabeth Anne Hardy',
        '1954-02-13'),						/*8*/

		('Edward Mower Norton Jr.',
		'1948-08-18',
        'Lydia Robinson norton',
        '1952-08-05');						/*9*/

INSERT INTO Nacionalidade (descNacionalidade) 
Value 	('Brasileiro'),						/*1*/
        ('Americano'),						/*2*/
        ('Canadense'),						/*3*/
        ('Australiano'),					/*4*/
        ('Chinês'),							/*5*/
        ('Japonês'),						/*6*/
        ('Austriaco'),						/*7*/
        ('Alemão'),							/*8*/
		('Britânico');						/*9*/

INSERT INTO EstadoCivil (descEstadoCivil) 
Value 	('Solteiro'),						/*1*/
        ('Casado'),							/*2*/
        ('Separado'),						/*3*/
        ('Divorciado'),						/*4*/
        ('Viuvo');							/*5*/

INSERT INTO TipoTelefone (descTipoTelefone) 
Value 	('Celular'),						/*1*/
        ('Trabalho'),						/*2*/
        ('Comercial'),						/*3*/
        ('Residencial');					/*4*/
        
INSERT INTO Ator (	idSexo,
					idNacionalidade,
					idFiliacao,
					idEscolaridade,
					idEstadoCivil,
					seguroSocialAtor,
					NomeAtor,
					DNAtor,
					CPFAtor,
					IdentidadeAtor) 
Value 	(1,
		 2,
         1,
         5,
         4,
        '436-98-8973',
        'Brad Pitt',
        '1963-12-18',
        '398-412-843-32',
        '9.834.775'),						/*1*/		
        
        (1,
		 7,
         2,
         6,
         2,
        '287-32-4287',
        'Christoph Waltz',
        '1956-10-04',
        '923-432-429-24',
        '8.452.429'),						/*2*/
        
		(1,
		 8,
         3,
         6,
         2,
        '532-48-3243',
        'Michael Fassbender',
        '1977-04-02',
        '219-458-237-23',
        '4.572.789'),						/*3*/			
        
		(1,
		 2,
         4,
         6,
         3,
        '238-53-7943',
        'Eli Roth',
        '1972-04-18',
        '798-342-570-32',
        '2.340.987'),						/*4*/			/* Inglorius Basterds*/
        
		(1,
		 2,
         5,
         4,
         3,
        '733-13-9847',
        'Jack Nicholson',
        '1937-04-22',
        '398-741-238-74',
        '1.293.046'),						/*5*/			


		(2,
		 2,
         6,
         4,
         6,
        '733-13-9847',
        'Shelley Duvall',
        '1949-07-07',
        '134-703-289-47',
        '2.374.146'),						/*6*/			/*The Shining*/

		(1,
		 2,
         7,
         4,
         1,
        '192-73-8463',
        'Leonardo DiCaprio',
        '1974-11-11',
        '274-192-380-74',
        '4.676.593'),						/*7*/

		(1,
		 9,
         8,
         2,
         1,
        '238-04-9725',
        'Tom Hardy',
        '1977-08-15',
        '328-049-744-35',
        '2.748.432'),						/*8*/			/* Inception */

		(1,
		 2,
         10,
         6,
         2,
        '573-24-9854',
        'Edward Norton',
        '1969-08-18',
        '280-560-874-34',
        '3.875.53');						/*9*/			/* Fight Club */
        
        
 /*       
INSERT INTO Ator (idSexo, idNacionalidade, idFiliacao, idEmail, idEscolaridade, idTelefone, idEndereco, seguroSocialAtor, DNAtor, IdentidadeAtor) 
Value 	('1', '1', '0001', '1', '09/01/1996', '000.000.000-01', '000.000-001'),*/
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



