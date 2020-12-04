-- view do ano de nascimento de cada aluno

create view listaNascimentos as select nome, idade,
	year(now()) - idade as AnoNascimemto from Aluno;

select * from listaNascimentos;

-- view alunos

create view listaAlunos as 
	select nome,idade,email,media from Aluno;
    
select * from listaAlunos;

-- view docentes

create view listaDocentes as
	select nome, nr_de_Contribuinte from Docente;
    
select * from listaDocentes;

-- view morada de cada escola
create view listaMoradas as
	select idEscola, Rua, Codigo_Postal from Escola;

select * from listaMoradas;

-- view contacto de cada escola

create view listaContacto as
	select  idEscola, telemovel from Escola;

select * from listaContacto;


-- view para cada professor que turmas leciona

create view listaTurmas as
	select D.nome , e.TurmaE from Docente as D, Ensina as e
    where e.DocenteE = D.idDocente;

select * from listaTurmas;


