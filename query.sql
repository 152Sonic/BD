USE Escola;


-- 1. Obter todos os alunos do agrupamento
select * from Aluno;

-- 2. Obter todos os docentes do agrupamento
select * from Docente;

-- 3. Obter todas as escolas do agrupamento
select * from Escola;

-- 4. Obter o número de alunos total dada uma escola
select count(A.idAluno) as total from Aluno A where EscolaAl = 1;

-- 5. Obter o número total de docentes dada uma escola

-- 6. Obter o número total de turmas dada uma escola

-- 7. Quais dos docentes são diretores de turma.
select D.idDocente, D.nome from Docente AS D, Turma AS T 
where T.Diretor_de_Turma = D.idDocente;

-- 8. Saber a média de um determinado aluno.

-- 9. Saber a média de uma determinada turma.

-- 10.	Saber a média de uma escola

-- 11. Saber os nomes e número de aluno dos alunos de uma determinada turma.

-- 12. Saber o nome e número de aluno dos alunos que frequentam determinada escola.

-- 13. Identificar o top 3 dos melhores alunos da escola 1.
select A.media, A.nome from Aluno AS A where EscolaAl = 1
ORDER BY media DESC 
Limit 3;

