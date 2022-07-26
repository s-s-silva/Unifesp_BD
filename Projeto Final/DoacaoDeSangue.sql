Create Database ProjetoFinal;

CREATE TABLE doador(cod integer, nome char(30), cpf char(11), endereco char(40),
PRIMARY KEY(cod))Engine=iNNODB;

CREATE TABLE caracteristicas (codDoador integer, idade integer, peso integer,  genero char(1), doador char(1),
PRiMARY KEY(codDoador),
Foreign Key (codDoador) references doador (cod))Engine=iNNODB;


CREATE TABLE sangue (codDoador integer, tipo char(4), anemico char(1),  receptores char(30),
PRiMARY KEY(codDoador),
Foreign Key (codDoador) references doador (cod)
) Engine=iNNODB;

--  Só entra na tabelas se doador = 's'
CREATE TABLE historicodoacao (codDoador integer, doacoesrealizadas integer, ultimadoacao date,  mascdoacao60dias char(1),
PRiMARY KEY(codDoador),
Foreign Key (codDoador) references doador (cod)
) Engine=iNNODB;


CREATE TABLE triagem (codDoador integer, idade integer, peso integer, vacinagripe48h char(1), vacinavirus4sem char (1), covid30dias char(1),
mascdoacao60dias char (1), femdoacao90dias char(1), tatuagem12meses char(1), antiinflamatorio48h char(1),
antibiotico2sem char(1), anestesia7dias char(1), coronavac2dias char(1), vacinacovid7dias char(1), apto char(1),
PRiMARY KEY(codDoador),
Foreign Key (codDoador) references doador (cod)
) Engine=iNNODB;


CREATE TABLE vacinacao (codDoador integer, vacinagripe48h char(1), vacinavirus4sem char(1), coronavac2dias char(1),
vacinacovid7dias char(1),
PRiMARY KEY(codDoador),
Foreign Key (codDoador) references doador (cod)
) Engine=iNNODB;

CREATE TABLE hospital(codhospital integer, nome char(30), endereco char(40),
PRiMARY KEY(codhospital)
) Engine=iNNODB;

CREATE TABLE convenio(codconvenio integer, nome char(30), plano char(40),
PRiMARY KEY(codconvenio)
) Engine=iNNODB;


CREATE TABLE enfermeiro(cod integer, codHospital integer, nome char(30), idade integer, cpf char(11), endereco char(40), genero char(1),
PRiMARY KEY (cod),
Foreign Key (codHospital) references hospital (codhospital)
) Engine=iNNODB;


CREATE TABLE doacao (cod integer , codDoador integer, codHospital integer, codEnfermeiro integer, apto char(1), 
data date, sala integer, andar integer, horário time,
PRIMARY KEY(cod),
Foreign Key (codDoador) references doador (cod), 
Foreign Key (codHospital) references hospital (codhospital), 
Foreign Key (codEnfermeiro) references enfermeiro (cod) 
) Engine=iNNODB;


CREATE TABLE doacaohospital (codDoacao integer, codHospital integer,
PRIMARY KEY (codDoacao),
FOREIGN KEY (codHospital) REFERENCES hospital (codHospital),
Foreign Key (codDoacao) references doacao (cod)
) ENGINE = iNNODB;


CREATE TABLE convenioDoador (codConvenio integer, codDoador integer,
PRIMARY KEY (codDoador),
FOREIGN KEY (codDoador) REFERENCES doador (cod),
FOREIGN KEY (codConvenio) REFERENCES convenio (codConvenio)
) ENGINE = iNNODB;

CREATE TABLE hospitalConvenio ( codHospital integer, codConvenio integer,
PRIMARY KEY (codHospital),
FOREIGN KEY (codHospital) REFERENCES hospital (codHospital),
FOREIGN KEY (codConvenio) REFERENCES convenio (codConvenio)
) ENGINE = iNNODB;


CREATE TABLE hospitalEnfermeiro (codEnfermeiro integer, codHospital integer,
PRIMARY KEY (codEnfermeiro),
FOREIGN KEY (codEnfermeiro) REFERENCES enfermeiro (cod),
FOREIGN KEY (codHospital) REFERENCES hospital (codhospital)
) ENGINE = iNNODB;

iNSERT INTO doador VALUES (1,'Carlos', '15877896325', 'Avenida Almirante, 12');
iNSERT INTO doador VALUES (2,'Paula', '78963225845', 'Alameda Uruguai, 663');
iNSERT INTO doador VALUES (3, 'Daniel', '25978465123', 'Rua Ourives, 132');
iNSERT INTO doador VALUES (4, 'Jose', '14491288763' , 'Alameda Ouro Preto, 279');
iNSERT INTO doador VALUES (5, 'William', '85477896520', 'Praca Nossa Senhora, 89');
iNSERT INTO doador VALUES (6, 'Daniela', '04536988759', 'Rua Pedro Almeida, 56');
iNSERT INTO doador VALUES (7, 'Gabriel', '20155676488', 'Alameda Campos Claros, 885');
iNSERT INTO doador VALUES (8, 'Sofia', '13566985478', 'Avenida Marte, 869');
iNSERT INTO doador VALUES (9, 'Rafaela', '55695102765', 'Praca dos Povos, 85');
iNSERT INTO doador VALUES (10, 'Estevan', '89654188879', 'Avenida Dostoievsky, 995');

SELECT * FROM doador;

-- codDoador integer, idade integer, peso integer,  genero char(1)
INSERT INTO caracteristicas VALUES (1, 18, 80, 'm', 's'); 
INSERT INTO caracteristicas VALUES (2, 60, 75, 'f','n');
INSERT INTO caracteristicas VALUES (3, 22, 150, 'm','s');
INSERT INTO caracteristicas VALUES (4,35,48,'m','n');
INSERT INTO caracteristicas VALUES (5,100, 70,'m','s');
INSERT INTO caracteristicas VALUES (6,16,60,'f','n');
INSERT INTO caracteristicas VALUES (7,32,68,'m', 's');
INSERT INTO caracteristicas VALUES (8,49,56,'f','n');
INSERT INTO caracteristicas VALUES (9, 22, 60,'f','s');
INSERT INTO caracteristicas VALUES (10,20, 80,'m','n');
-- CASOS: codDoador 3: obesidade, 5: 100 anos, 6: 16 anos

SELECT * FROM caracteristicas;

INSERT INTO historicodoacao VALUES (1,1,'2020-05-20','s');
INSERT INTO historicodoacao VALUES (3,6, '2021-05-20','s');
INSERT INTO historicodoacao VALUES (5,2, '2021-05-20','s');
INSERT INTO historicodoacao VALUES (7,3, '2022-02-08','n');
INSERT INTO historicodoacao VALUES (9,1, '2016-05-16','s');

SELECT * FROM historicodoacao;

INSERT INTO sangue VALUES (1,'O-', 'N', 'A+,A-,B+,B-,AB+,AB-,O+,O-');
iNSERT INTO sangue VALUES (2,'A+', 'S', 'A+,AB+,');
iNSERT INTO sangue VALUES (3,'B-', 'N', 'B+,AB+');
iNSERT INTO sangue VALUES (4,'AB-', 'S', 'AB+,AB-');
iNSERT INTO sangue VALUES (5,'A+', 'N', 'A+,AB+');
iNSERT INTO sangue VALUES (6,'A-', 'N', 'A+,A-,AB+,AB-');
iNSERT INTO sangue VALUES (7,'B+', 'N', 'B+,B-,AB+,AB-');
iNSERT INTO sangue VALUES (8,'AB+', 'N', 'AB+');
iNSERT INTO sangue VALUES (9,'O+', 'N', 'A+,A-,B+,B-,AB+,Ab-,O+');
iNSERT INTO sangue VALUES (10,'O-', 'S', 'A+,A-,B+,B-,AB+,Ab-,O+,O-');

SELECT * FROM sangue;


INSERT INTO triagem VALUES (1, 18 , 80 , 'S', 'S', 'N','N','N','S','N','N','N','N','N', 'S');
iNSERT INTO triagem VALUES (2, 60 , 75 , 'N', 'N', 'N','S','N','N','N','N','N','N','S', 'S');
iNSERT INTO triagem VALUES (3, 22 , 150 , 'N', 'N', 'N','N','S','N','N','N','N','N','N', 'S');
iNSERT INTO triagem VALUES (4, 35 , 48 , 'N', 'N', 'S','N','N','N','S','N','S','N','N', 'S');
iNSERT INTO triagem VALUES (5, 100 , 70 , 'N', 'N', 'S','N','N','S','N','N','N','N','N', 'S');
iNSERT INTO triagem VALUES (6, 16 , 60 , 'N', 'N', 'N','N','S','N','N','N','N','S','S', 'S');
iNSERT INTO triagem VALUES (7, 32 , 68 , 'N', 'N', 'N','S','N','N','N','N','N','N','N', 'N');
iNSERT INTO triagem VALUES (8, 49 , 56 , 'N', 'N', 'N','N','N','S','N','N','N','N','N', 'N');
iNSERT INTO triagem VALUES (9, 22 , 60 , 'N', 'N', 'S','N','N','N','N','N','N','N','S', 'N');
iNSERT INTO triagem VALUES (10, 20 , 80 , 'N', 'N', 'N','S','N','S','N','N','N','N','N', 'N');

SELECT * FROM triagem;

iNSERT INTO hospital VALUES (1,'Hospital Santa Maria', 'Avenida Paraiso, 500');
iNSERT INTO hospital VALUES (2,'Hospital Santo Agostinho', 'Avenida Vergueiro, 857');
iNSERT INTO hospital VALUES (3,'Hospital Prime Care', 'Rua Antonio Fonseca, 632');
iNSERT INTO hospital VALUES (4,'Hospital Green Valley', 'Avenida America, 223');
iNSERT INTO hospital VALUES (5,'Hospital Celula Aurora', 'Avenida Paes de Barros, 563');
iNSERT INTO hospital VALUES (6,'Hospital Alma Mater', 'Avenida Baltazar Carrasco, 350');
iNSERT INTO hospital VALUES (7,'Hospital Santana', 'Avenida Cruzeiro do Sul, 128');
iNSERT INTO hospital VALUES (8,'Hospital Paulista', 'Rua Dr. Diogo de Faria, 780');
iNSERT INTO hospital VALUES (9,'Hospital Centro Saude', 'Avenida do Estado, s/n');
iNSERT INTO hospital VALUES (10,'Hospital do Povo', 'Avenida das Juntas Provisorias, 500');
iNSERT INTO hospital VALUES (11,'Hospital Publico Central', 'Avenida Santos Dumont, 980');

SELECT * FROM hospital;

iNSERT INTO convenio VALUES (1,'Amil', 'Amil Plus');
iNSERT INTO convenio VALUES (2,'Unimed', 'Unimed Gold');
iNSERT INTO convenio VALUES (3,'Sulamerica', 'Sula Mais');
iNSERT INTO convenio VALUES (4,'Notre Dame', 'Notre Dame Plus');
iNSERT INTO convenio VALUES (5,'Assim Saude', 'Assim Gold');
iNSERT INTO convenio VALUES (6,'Bradesco Saude', 'Bradesco  Black');
iNSERT INTO convenio VALUES (7,'São Francisco Saude', 'SF Mais');
iNSERT INTO convenio VALUES (8,'Porto Seguro Saude', 'Amil Plus');
iNSERT INTO convenio VALUES (9,'Allianz Saude', 'Amil Plus');
iNSERT INTO convenio VALUES (10,'Brasil Convenios', 'Brasil Mais');

SELECT * FROM convenio;

iNSERT INTO enfermeiro VALUES (1, 1, 'Paulo', 25, '12599845217', 'Avenida Marcos Rodrigues, 27' ,'M');
iNSERT INTO enfermeiro VALUES (2, 1, 'Leila', 36, '12358974169', 'Alameda Pedro de Carvalho, 885' ,'F');
iNSERT INTO enfermeiro VALUES (3, 2, 'Daniela', 22, '98745625878', 'Avenida Tiago de Freitas, 96' ,'F');
iNSERT INTO enfermeiro VALUES (4, 2 , 'Marta', 33, '78565425314', 'Avenida Sabrina Santos, 125' ,'F');
iNSERT INTO enfermeiro VALUES (5, 3 , 'Pedro', 56, '56987452147', 'Rua Pereira Rodrigues, 71' ,'M');
iNSERT INTO enfermeiro VALUES (6, 3 , 'Daiana', 42, '45698741267', 'Avenida Marcos Cristovan, 352' ,'F');
iNSERT INTO enfermeiro VALUES (7, 4 , 'Regina', 26, '78532102590', 'Avenida Georgina Santana, 451' ,'F');
iNSERT INTO enfermeiro VALUES (8, 4 , 'Oscar', 31, '54785232166', 'Rua do Bem Estar, 16' ,'M');
iNSERT INTO enfermeiro VALUES (9, 4 , 'Gabriel', 30, '12368798517', 'Avenida da Paz, 521' ,'M');
iNSERT INTO enfermeiro VALUES (10, 5 , 'Giovanna', 35, '02589745247', 'Rua Armenia , 39' ,'F');
iNSERT INTO enfermeiro VALUES (11, 5 , 'Giulia', 26, '18974567997', 'Rua Bela Souza, 47' ,'F');
iNSERT INTO enfermeiro VALUES (12, 6 , 'Artur', 38, '64785213789', 'Avenida Ana Martins, 55' ,'M');
iNSERT INTO enfermeiro VALUES (13, 6 , 'Carlos', 45, '98563210247', 'Rua Tenor Monsanto, 122' ,'M');
iNSERT INTO enfermeiro VALUES (14, 7 , 'Ricardo', 52, '11998866554', 'Rua Wesley de Melo, 224' ,'M');
iNSERT INTO enfermeiro VALUES (15, 7 , 'Talita', 29, '73869544789', 'Rua Marli Soares, 71' ,'F');
iNSERT INTO enfermeiro VALUES (16, 7 , 'Marcos', 42, '78595135788', 'Avenida Carla Bras, 355' ,'M');
iNSERT INTO enfermeiro VALUES (17, 8 , 'Heloisa', 40, '74114728856', 'Rua Joana Montenegro, 344' ,'F');
iNSERT INTO enfermeiro VALUES (18, 8 , 'Milton', 39, '78964525811', 'Avenida Frida Khalo, 144' ,'M');
iNSERT INTO enfermeiro VALUES (19, 9 , 'Carla', 24, '15915715325', 'Rua Rodrigo Martins, 255' ,'F');
iNSERT INTO enfermeiro VALUES (20 , 9 , 'Ana Clara', 28, '08544658977', 'Avenida Carlos Sá, 33' ,'F');
iNSERT INTO enfermeiro VALUES (21, 10 , 'Joao Paulo', 29, '77365200212', 'Avenida Oscar Niemeier, 64' ,'M');
iNSERT INTO enfermeiro VALUES (22, 10 , 'Igor', 32, '45632158988', 'Rua Robson de Freitas, 154' ,'M');

SELECT * FROM enfermeiro;

INSERT INTO doacao VALUES(1, 1, 2, 4, 'S', '2022-02-14', 1, 3, '08:00:00');
INSERT INTO doacao VALUES(2, 2, 6, 13, 'S', '2022-03-01', 2, 2, '15:30:00');
INSERT INTO doacao VALUES(3, 3, 5, 11, 'S', '2022-04-14', 4, 3, '08:10:00');
INSERT INTO doacao VALUES(4, 4, 7, 15, 'S', '2022-05-14', 16, 1, '09:20:00');
INSERT INTO doacao VALUES(5, 5, 2, 3, 'S', '2022-02-12', 5, 2, '10:00:00');
INSERT INTO doacao VALUES(6, 6, 4, 9, 'S', '2022-02-11', 2, 3, '11:00:00');
INSERT INTO doacao VALUES(7, 7, 1, 2, 'S', '2022-03-12', 1, 2, '12:15:00');
INSERT INTO doacao VALUES(8, 8, 9, 20, 'S', '2022-04-14', 7, 3, '16:00:00');
INSERT INTO doacao VALUES(9, 9, 3, 6, 'S', '2022-05-11', 30, 2, '07:00:00');
INSERT INTO doacao VALUES(10, 10, 8, 18, 'S', '2022-02-15', 12, 1, '08:00:00');

SELECT * FROM doacao;

INSERT INTO convenioDoador VALUES (1, 1);
INSERT INTO convenioDoador VALUES (3, 2);
INSERT INTO convenioDoador VALUES (7, 3);
INSERT INTO convenioDoador VALUES (5, 4);
INSERT INTO convenioDoador VALUES (4, 5);
INSERT INTO convenioDoador VALUES (2, 6);
INSERT INTO convenioDoador VALUES (9, 7);
INSERT INTO convenioDoador VALUES (10, 8);
INSERT INTO convenioDoador VALUES (6, 9);
INSERT INTO convenioDoador VALUES (6, 10);

SELECT * FROM conveniodoador;

INSERT INTO doacaohospital VALUES (1, 3);
INSERT INTO doacaohospital VALUES (2, 11);
INSERT INTO doacaohospital VALUES (3, 4);
INSERT INTO doacaohospital VALUES (4, 6);
INSERT INTO doacaohospital VALUES (5, 6);
INSERT INTO doacaohospital VALUES (6, 8);
INSERT INTO doacaohospital VALUES (7, 6);
INSERT INTO doacaohospital VALUES (8, 2);
INSERT INTO doacaohospital VALUES (9, 1);
INSERT INTO doacaohospital VALUES (10, 5);

SELECT * FROM doacaohospital;

INSERT INTO hospitalConvenio VALUES (1, 2);
INSERT INTO hospitalConvenio VALUES (2, 8);
INSERT INTO hospitalConvenio VALUES (3, 1);
INSERT INTO hospitalConvenio VALUES (4, 3);
INSERT INTO hospitalConvenio VALUES (5, 3);
INSERT INTO hospitalConvenio VALUES (6, 6);
INSERT INTO hospitalConvenio VALUES (7, 1);
INSERT INTO hospitalConvenio VALUES (8, 4);
INSERT INTO hospitalConvenio VALUES (9, 6);
INSERT INTO hospitalConvenio VALUES (10, 7);

SELECT * FROM hospitalConvenio;

INSERT INTO hospitalEnfermeiro VALUES (1, 1);
INSERT INTO hospitalEnfermeiro VALUES (2, 1);
INSERT INTO hospitalEnfermeiro VALUES (3, 2);
INSERT INTO hospitalEnfermeiro VALUES (4, 2);
INSERT INTO hospitalEnfermeiro VALUES (5, 3);
INSERT INTO hospitalEnfermeiro VALUES (6, 3);
INSERT INTO hospitalEnfermeiro VALUES (7, 4);
INSERT INTO hospitalEnfermeiro VALUES (8, 4);
INSERT INTO hospitalEnfermeiro VALUES (9, 4);
INSERT INTO hospitalEnfermeiro VALUES (10, 5);
INSERT INTO hospitalEnfermeiro VALUES (11, 5);
INSERT INTO hospitalEnfermeiro VALUES (12, 6);
INSERT INTO hospitalEnfermeiro VALUES (13, 6);
INSERT INTO hospitalEnfermeiro VALUES (14, 7);
INSERT INTO hospitalEnfermeiro VALUES (15, 7);
INSERT INTO hospitalEnfermeiro VALUES (16, 7);
INSERT INTO hospitalEnfermeiro VALUES (17, 8);
INSERT INTO hospitalEnfermeiro VALUES (18, 8);
INSERT INTO hospitalEnfermeiro VALUES (19, 9);
INSERT INTO hospitalEnfermeiro VALUES (20, 9);
INSERT INTO hospitalEnfermeiro VALUES (21, 10);
INSERT INTO hospitalEnfermeiro VALUES (22, 10);

SELECT * FROM hospitalEnfermeiro;


-- CONTA POSSÍVEIS DOADORES PARA SANGUE O+ (count + like)
SELECT COUNT(codDoador) FROM sangue WHERE receptores LIKE '%O+%';

-- LISTA NOME DOS DOADORES QUE ESTÃO APTOS PARA DOAÇÃO E POSSÍVEIS RECEPTORES 
SELECT doador.nome, sangue.receptores FROM triagem 
JOIN doador ON doador.cod = triagem.codDoador
JOIN sangue ON sangue.codDoador = triagem.codDoador
WHERE triagem.apto = 'S';

-- LISTA O NOME DOS ENFERMEIRO, HOSPITAL E ENDEREÇO QUE O ENFERMEIRO TRABALHA DE FORMA ORDENADA
SELECT enfermeiro.nome, hospital.nome, hospital.endereco FROM enfermeiro 
JOIN hospital ON hospital.codHospital = enfermeiro.codHospital
ORDER BY enfermeiro.nome;

-- LISTA O NOME DAS CLINICAS E OS ENFERMEIROS QUE TRABALHAM NELA, AS CLINICAS QUE NÃO TRABALHAM NINGUÉM, SERÁ LISTADA TAMBÉM
SELECT hospital.nome, enfermeiro.nome FROM enfermeiro 
RIGHT JOIN hospital ON hospital.codHospital = enfermeiro.codHospital; 


-- LISTA O NOME DE TODOS OS PACIENTES QUE JÁ DOARAM
SELECT doador.nome FROM doador 
WHERE doador.cod IN 
(SELECT doador.cod FROM doador
JOIN historicodoacao ON doador.cod = historicodoacao.codDoador); 

-- CONTA QUATOS PACIENTES NUNCA DOARAM
SELECT COUNT(*) FROM doador 
WHERE doador.cod NOT IN 
(SELECT doador.cod FROM doador
JOIN historicodoacao ON doador.cod = historicodoacao.codDoador); 

-- LISTA TODOS OS ENFERMEIROS E SUAS DOAÇÕES A FAZER, AQUELES SEM DOAÇÕES TAMBÉM APARECEM
SELECT e.nome, d.data, d.horário 
FROM enfermeiro e
	LEFT JOIN doacao d
    ON e.cod = d.codEnfermeiro;
    
-- LISTA TODOS OS HOSPITAIS E SUAS DOAÇÕES A FAZER, AQUELES SEM DOAÇÕES TAMBÉM APARECEM
SELECT h.nome, d.data, d.horário
FROM hospital h
	LEFT JOIN doacao d
    ON h.codhospital = d.codhospital;
    
--  NOME DO DOADOR QUE TEM MAIS DE UMA DOAÇÃO REALIZADA
SELECT doador.nome, historicodoacao.doacoesrealizadas
FROM doador, historicodoacao
WHERE doador.cod = historicodoacao.codDoador
GROUP BY doador.nome
HAVING(historicodoacao.doacoesrealizadas > 1);

-- NOME DOS HOSPITAIS QUE A SOMA DO PESO DE SEUS DOADORES NAO ULTRAPASSA 75Kg
SELECT h.nome AS nomeHospital, d.codDoador AS codido_do_doador, c.peso 
FROM hospital h, doacao d, caracteristicas c
WHERE h.codhospital = d.codhospital AND d.codDoador = c.codDoador
GROUP BY d.codDoador
HAVING sum(peso<75);

-- HOSPITAIS QUE TEM MAIS DE DOIS ENFERMEIROS TRABALHANDO
SELECT h.nome AS 'nome do hospital'
FROM enfermeiro e, hospital h
WHERE h.codhospital = e.codhospital
GROUP BY h.nome 
HAVING count(*)>2;

-- MEDIA DE PESO POR IDADE DE QUEM PASSOU PELA TRIAGEM
SELECT t.idade, avg(t.peso) AS 'media de peso'
FROM triagem t, doador d
WHERE t.codDoador = d.cod
GROUP BY t.idade
HAVING avg(t.peso>60)
ORDER BY t.idade;

-- DROP database projetofinal; 