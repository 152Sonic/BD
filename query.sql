USE Escola;


-- 1. Obter todos os alunos do agrupamento
select * from Aluno;

-- 2. Obter todos os docentes do agrupamento
select * from Docente;

-- 3. Obter todas as escolas do agrupamento
select * from Escola;

-- 4. Obter o número de alunos total dada uma escola
DROP PROCEDURE IF EXISTS nTAlunosEscola;

DELIMITER $$
CREATE PROCEDURE nTAlunosEscola(IN idE INT)
BEGIN
select count(A.idAluno) as total from Aluno A 
where A.EscolaAl = idE;
END $$
DELIMITER ;

CALL nTAlunosEscola(1);

-- 5. Obter o número total de docentes dada uma escola

DROP PROCEDURE IF EXISTS nTDocentesEscola;

DELIMITER $$
CREATE PROCEDURE nTDocentesEscola(IN idE INT)
BEGIN
select count(D.idDocente) as total from Docente D 
where D.EscolaD = idE;
END $$
DELIMITER ;

CALL nTDocentesEscola(1);

-- 6. Obter o número total de turmas dada uma escola

DROP PROCEDURE IF EXISTS nTTurmaEscola;

DELIMITER $$

CREATE PROCEDURE nTTurmaEscola(IN idE INT)
BEGIN
select count(T.idTurma) as total from Turma T
where T.EscolaT = idE;
END $$
DELIMITER ;

CALL nTTurmaEscola(1);

-- 7. Quais dos docentes são diretores de turma.
select D.idDocente, D.nome from Docente AS D, Turma AS T 
where T.Diretor_de_Turma = D.nome;

-- 8. Saber a média de um determinado aluno.

DROP PROCEDURE IF EXISTS media;

DELIMITER $$
create procedure media(in idAluno INT)
BEGIN
select A.idAluno, A.nome, A.media from Aluno AS A
where A.idAluno = idAluno;
end $$
DELIMITER ;

CALL media(53);

-- 9. Saber a média de uma determinada turma.
DROP PROCEDURE IF EXISTS mediaTurma;

DELIMITER $$
create procedure mediaTurma(in idTurma INT)
begin
select sum(A.media)/T.N_Alunos from Turma AS T
inner join Aluno as A on A.Turma = T.idTurma
where T.idTurma = idTurma
group by T.N_Alunos;
end $$
DELIMITER ;


CALL mediaTurma(1);

-- 10.	Saber a média de uma escola

DROP PROCEDURE IF EXISTS mediaEscola;

DELIMITER $$

CREATE PROCEDURE mediaEscola(IN idEscola INT)
BEGIN
select (sum(A.media)/count(A.idAluno)) from Escola AS E
inner join Aluno AS A ON A.EscolaAl = E.idEscola
where E.idEscola = idEscola 
group by A.EscolaAl;
END $$

DELIMITER ;

CALL mediaEscola(1);

-- 11.	Saber a média por escola 

select (sum(A.media)/count(A.idAluno)) from Escola AS E
inner join Aluno AS A ON A.EscolaAl = E.idEscola
group by A.EscolaAl;


-- 12. Saber os nomes e número de aluno dos alunos de uma determinada turma.
delimiter $$

create procedure alunosTurma(in idT int)
begin
	select A.idAluno, A.nome from Aluno AS A
	where A.Turma = idT;
end$$

delimiter ;

call alunosTurma(2);

-- 13. Saber o nome e número de aluno dos alunos que frequentam determinada escola.
delimiter $$
create procedure alunosEscola(in idE int)
begin
	select A.idAluno, A.nome from Aluno AS A
	where A.EscolaAl = idE;
end$$

delimiter ;    

call alunosEscola(1);

-- 14. Identificar o top 3 dos melhores alunos de uma escola.

delimiter $$

create procedure topAlunos(in idE int)
begin
	select A.media, A.nome from Aluno AS A where EscolaAl = idE
	order by media desc 
	Limit 3;
end $$

delimiter ;

call topAlunos(3);


-- 15. Dado um aluno obter todos os docentes dele

DROP PROCEDURE IF EXISTS docentes_al;

DELIMITER $$
CREATE PROCEDURE docentes_al(IN id_al INT)
BEGIN
select D.idDocente, D.nome from Aluno as A
inner join ensina as en on en.TurmaE = A.Turma
inner join Docente as D on D.idDocente = en.DocenteE
where A.idAluno = id_al;
END $$
DELIMITER ;

CALL docentes_al(3);

-- 16. Dado um docente obter todos os alunos dele

DROP PROCEDURE IF EXISTS alunos_doc;

DELIMITER $$
CREATE PROCEDURE alunos_doc(IN id_doc INT)
BEGIN
select A.idAluno, A.nome from Docente as D
inner join ensina as en on en.DocenteE = D.idDocente
inner join Aluno as A on A.Turma = en.TurmaE
where D.idDocente = id_doc;
END $$
DELIMITER ;

CALL alunos_doc(1);

