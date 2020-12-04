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
delete from Aluno as A where idAluno = id;
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


--  drop procedure if exists alterarMedia;

-- delimiter $$
-- create procedure alterar

select * from Docente;

select * from Aluno;

select * from Turma;