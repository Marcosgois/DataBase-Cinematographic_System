use projeto_BD_hollywood;

create table if not exists FaturamentoAnoAnterior(
	idFaturamentoAnoAnterior int NOT NULL AUTO_INCREMENT,
    valor int
);

create table if not exists Estudio(
	idEstudio int NOT NULL auto_increment,
    nomeEstudio Varchar(45),
    dataFundacao date
);

create table if not exists Filme(
	IdFilmes int NOT NULL AUTO_INCREMENT,
    nomeFilmes Varchar(45),
    mesesProducaoFilmes int,
    anoLancamentoFilme Date,
    copyrightNumberFilme int,
    custoFilme Varchar(45)
);

create table if not exists Sexo(
	idSexo int not null auto_increment,
    descSexo Varchar(45)
);

create table if not exists DonoEstudio(
	idDonoEstudio int not null auto_increment,
    nomeDono Varchar(45),
    DNDono date,
    CPFDono varchar(45),
	IdentidadeDono varchar(45)
);

create table if not exists Filiacao(
	idFiliacao int not null auto_increment,
    nome_pai varchar(45),
    nome_mae varchar(45),
    DN_pai date,
    DN_mae date
);

create table if not exists Escolaridade(
	idEscolaridade int not null auto_increment,
    descEscolaridade varchar(20)
);

create table if not exists Telefone(
	idTelefone int not null auto_increment,
    numero Varchar(45)
);

create table if not exists TipoTelefone(
	idTipoTelefone int not null auto_increment,
    desctipoTelefone varchar(45)
);

create table if not exists Ator(
	idAtor int not null auto_increment,
    seguroSocialAtor int,
    DNAtor date,
    CPFAtor varchar(45),
    IdentidadeAtor varchar(45)
);

create table if not exists Email(
	idEmail int not null auto_increment,
    descEmail varchar(45)
    
);

create table if not exists EstadoCivil(
	idEstadoCivil int not null auto_increment,
    descEstadoCivil varchar(45)
);

create table if not exists Nacionalidade(
	idNacionalidade int not null auto_increment,
    descNacionalidade varchar(45)
);

/* Aparentemente o mysql já tem uma palavra cache padrão */
create table if not exists Cachee(
	idCache int not null auto_increment,
    valorCache int,
    descCache varchar(45)
);

create table if not exists Diretor(
	idDiretor int not null auto_increment,
    nomeDiretor varchar(45),
    DNDiretor date,
    CPFDiretor varchar(45),
    IdentidadeDiretor varchar(45)
);

create table if not exists Personagem(
	idPersonagem int not null auto_increment,
    nomePersonagem varchar(45)
);

create table if not exists Pais(
 	idPais int not null auto_increment,
	NomePais varchar(45),
	DDI varchar(45)
);

create table if not exists UF(
	idUF int not null auto_increment,
	nomeUF varchar(45),
	descUF varchar(45)
);

create table if not exists Cidade(
	idCidade int not null auto_increment,
	nome varchar(45),
	DDD varchar(45)
);

create table if not exists Bairro(
	idBairro int not null auto_increment,
	NomeBairro varchar(45)
);

create table if not exists Endereco(
	idEndereco int not null auto_increment,
	nomeEndereco varchar(45),
	numeroEndereco int
);

create table if not exists TipoEndereco(
	idTipoEndereco int,
	descEndereco varchar(45)
);
