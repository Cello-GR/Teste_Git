CREATE TABLE TB_Funcionario(
    CodFunc NUMBER(4,0) not NULL,
    NomeFunc VARCHAR2(40) not NULL,
    Sexo CHAR(1) CHECK (sexo in('M', 'F')),
    DataAdmissao DATE,
    Salario NUMBER(7,2),
    CONSTRAINT pk_codfunc Primary KEY (CodFunc)
);

CREATE TABLE TB_Depto(
    CodDepto NUMBER(3,0) not NULL,
    NomeDepto VARCHAR2(20) not NULL,
    CONSTRAINT pk_coddepto Primary KEY (CodDepto)
);

CREATE TABLE TB_Projeto(
    CodProjeto NUMBER(3,0) not NULL,
    Descricao VARCHAR2(100) not NULL,
    CONSTRAINT pk_codprojeto Primary KEY (CodProjeto)
);

CREATE TABLE TB_FuncProj(
    Cod_Func NUMBER(4,0) not NULL,
    Cod_Proj NUMBER(3,0) not NULL,
    TempoAlocMes NUMBER(2,0),
    BonusSal NUMBER(5,2),
    CONSTRAINT pk_codfuncproj Primary KEY (Cod_Func, Cod_Proj)
);


/*DEFININDO FKs*/
ALTER TABLE TB_Funcionario add(Cod_Depto NUMBER(3,0) not NULL);
ALTER TABLE TB_Funcionario 
    add(CONSTRAINT fk_coddepto FOREIGN KEY (Cod_Depto)
        REFERENCES TB_Depto(CodDepto));

ALTER TABLE TB_FuncProj
add(CONSTRAINT fk_codfunc FOREIGN KEY (Cod_Func)
    REFERENCES TB_Funcionario (CodFunc));

ALTER TABLE TB_FuncProj
add(CONSTRAINT fk_codproj FOREIGN KEY (Cod_Proj)
    REFERENCES TB_Projeto (CodProjeto));


/*INSERINDO VALORES NAS TABELAS*/
INSERT INTO TB_DEPTO VALUES (100,'TI');
INSERT INTO TB_DEPTO VALUES (200,'RH');
INSERT INTO TB_DEPTO VALUES (300,'CTB');
INSERT INTO TB_DEPTO VALUES (400,'Logistica');

INSERT INTO TB_PROJETO VALUES (111, 'Aplicação WEB para vendas');
INSERT INTO TB_PROJETO VALUES (222, 'Projeto de Reconstrução do RH');
INSERT INTO TB_PROJETO VALUES (333, 'Aplicação WEB de contabilidade');
INSERT INTO TB_PROJETO VALUES (444, 'Aplicativo Android para vendores');
INSERT INTO TB_PROJETO VALUES (555, 'Suporte para Logística');

INSERT INTO TB_FUNCIONARIO VALUES(3000, 'Blair Larsson', 'F', TO_DATE('27-03-2018', 'DD-MM-YYYY'), 4000.00, 300);
INSERT INTO TB_FUNCIONARIO VALUES(3100, 'May ', 'F', TO_DATE('15-01-2018', 'DD-MM-YYYY'), 9000.00, 200);
INSERT INTO TB_FUNCIONARIO VALUES(4200, 'Mitsuri Uzumaki', 'F', TO_DATE('12-05-2020', 'DD-MM-YYYY'), 7800.00, 200);
INSERT INTO TB_FUNCIONARIO VALUES(3500, 'Luiz Machado', 'M', TO_DATE('26-06-2015', 'DD-MM-YYYY'), 7000.00, 300);
INSERT INTO TB_FUNCIONARIO VALUES(4100, 'Eduard Desmond', 'M', TO_DATE('10-09-2019', 'DD-MM-YYYY'), 8500.00, 100);
INSERT INTO TB_FUNCIONARIO VALUES(5300, 'Vanessa Dracula', 'F', TO_DATE('11-06-2018', 'DD-MM-YYYY'), 3050.00, 400);
INSERT INTO TB_FUNCIONARIO VALUES(5400, 'Victoria Desmond', 'F', TO_DATE('15-06-2018', 'DD-MM-YYYY'), 3050.00, 400);
INSERT INTO TB_FUNCIONARIO VALUES(4300, 'Tord Larsson', 'M', TO_DATE('8-01-2019', 'DD-MM-YYYY'), 6000.00, 100);

INSERT INTO TB_FUNCPROJ VALUES(4100,111,2,250.00);
INSERT INTO TB_FUNCPROJ VALUES(3100,222,1,00.00);
INSERT INTO TB_FUNCPROJ VALUES(3500,333,4,200.00);
INSERT INTO TB_FUNCPROJ VALUES(4300,444,3,180.00);
INSERT INTO TB_FUNCPROJ VALUES(5400,555,2,100.00);

alter table tb_funcionario add telefone varchar2(15);
select * from tb_funcionario;

update tb_funcionario 
set telefone = '(15) 3238-1188'
where codfunc = 3100;

select * from tb_funcproj

delete tb_funcionario
where cod_depto = 300;

select nomefunc, salario, salario* 1.1 "Salário aumentado", dataadmissao
from tb_funcionario;

select * from tb_FuncProj
where BonusSal > 0;
