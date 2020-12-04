USE Escola;

-- Insere novo docente

DROP PROCEDURE IF EXISTS inserirDocente;

DELIMITER $$
CREATE PROCEDURE inserirDocente (IN idDocente INT,IN contri INT,IN nome VARCHAR(45),IN escola INT)
BEGIN
insert into Docente values (idDocente, contri, nome, escola);
END$$
DELIMITER ;

CALL inserirDocente(10,456182934,"José Pedro Castro Ferreira",1);

-- Remove novo docente

DROP PROCEDURE IF EXISTS removerDocente;

DELIMITER $$
CREATE PROCEDURE removerDocente (IN id INT)
BEGIN
DELETE FROM Docente where idDocente = id;
END$$
DELIMITER ;

CALL removerDocente(10);

-- Insere novo Aluno

DROP PROCEDURE IF EXISTS inserirAluno;

DELIMITER $$
CREATE PROCEDURE inserirAluno (IN idAluno INT,IN nome VARCHAR(100),IN idade INT,IN email VARCHAR(45)
							  ,IN escola INT,IN turma INT, IN media FLOAT)
BEGIN
insert into Aluno values (idAluno, nome, idade,email, escola,turma,media);
update Turma set N_Alunos = N_Alunos + 1 where idTurma = turma;
END$$
DELIMITER ;

CALL inserirAluno(183,"Francisco Alves Andrade",15,"faA@aejc.com",3,2,0.0);

-- Remove novo Aluno

DROP PROCEDURE IF EXISTS removerAluno;

DELIMITER $$
CREATE PROCEDURE removerAluno (IN id INT)
BEGIN
update Aluno as A, Turma set N_Alunos = N_Alunos - 1 where A.idAluno = id and idTurma = A.Turma;
delete from Aluno where idAluno = id;
END$$
DELIMITER ;

CALL removerAluno(183);


-- Inserir nova Turma
drop procedure if exists inserirTurma;

delimiter $$
create procedure inserirTurma(in idTurma int, in nAlunos int, in dt int, in escola int)
begin 
insert into Turma values (idTurma,nAlunos,dt,escola);
end$$
delimiter ;

call inserirTurma(9,0,3,2);



-- Alterar media de um aluno

drop procedure if exists alterarMedia;

delimiter $$
create procedure alterarMedia(in id int,in m float)
begin
update Aluno set media = m where idAluno = id;
end $$
delimiter ;

call alterarMedia(3,18.0);

-- Alterar turma de um aluno
drop procedure if exists alterarTurmaA;

delimiter $$
create procedure alterarTurmaA(in id int,in t  int)
begin
update Aluno set Turma = t where idAluno = id;
end $$
delimiter ;

call alterarTurmaA(3,5);

-- Alterar escola de um aluno

drop procedure if exists alterarEscolaA;

delimiter $$
create procedure alterarEscolaA(in id int,in e  int)
begin
update Aluno set EscolaAl = e where idAluno = id;
end $$
delimiter ;

call alterarEscolaA(3,2);

-- Alterar escola de um docente

drop procedure if exists alterarEscolaD;

delimiter $$
create procedure alterarEscolaD(in id int,in e  int)
begin
update Docente set EscolaD = e where idDocente = id;
end $$
delimiter ;

call alterarEscolaD(6,2);

-- Alterar turma de um docente

drop procedure if exists alterarTurmaD;

delimiter $$
create procedure alterarTurmaD(in id int,in t  int)
begin
update Ensina set TurmaE = t where DocenteE = id;
end $$
delimiter ;

call alterarTurmaD(2,5);


select * from Docente;

select * from Aluno;

select * from Turma;