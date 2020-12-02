USE Escola;

INSERT INTO Aluno
	(nr_de_aluno,nome,idade,media,email,idEscola,idTurma)
    VALUES
		(3,"Marcelo Alexandre Matos Fonseca Lima",16,9.5,"marceloLima@aejc.com"),
        (4,"Eduardo Semanas Oliveira Araújo",15,11,"eduHard4@aejc.com"),
        (9,"Bruno Miguel de Sousa Cancelinha",16,20,"cancelinha9@aejc.com"),
		(16,"Ricardo Jorge Barroso Certo",16,13.2,"rjbc@aejc.com"),
        (17,"Bruno Filipe da Silva Ferreira",15,13.6,"brunoFerreira@aejc.com"),
        (19,"Ricardo Manuel Cerineu Canela",16,10,"ricardo19@aejc.com"),
		(30,"Filipe Vieira Fortunato",16,10.5,"filipeForunato@aejc.com"),
        (32,"José Diogo Paiva Bastos",15,16,"jbasto@aejc.com"),
		(36,"Inês Marques Sampaio",15,18,"marques@aejc.com"),
        (37,"João Pedro Lima Cardoso Leal",16,12,"jpC@aejc.com"),
        (39,"Guilherme Vasconcelos da Silva Guerreiro",15,14.5,"gui@aejc.com"),
        (52,"Pedro Manuel Barbosa de Almeida",16,13.8,"almeida@aejc.com"),
        (63,"José António Dantas Silva", 15,16,"zeTone63@aejc.com"),
        (68,"Manuel João Monteiro",16,13.4,"donatelo@aejc.com"),
        (85,"Júlio Dinis Sá Peixoto",15,12.4,"juliosPeixoto@aejc.com"),
        (87,"Sara Alexandra Da Silva Pereira",15,16.2,"saraAlex87@aejc.com"),
        (88,"Marco Matias Pereira Gonçalves",16,19,"marco88@aejc.com"),
        (105,"Renato Jorge Cruzinha da Silva",15,13,"renatoSilva@aejc.com"),
        (120,"Rui Filipe Silva Vieira",16,16.4,"ruiVieira@aejc.com"),
		(122,"Adriana da Santa Guedes",15,17,"candace@aejc.com"),
        (128,"Adriana Margarida Martins Gonçalves",15,16.1,"adriana@aejc.com"),
        (136,"Pedro Melo Rocha",17,12.9,"rocha@aejc.com")
	;
    
INSERT INTO Docente
	(idDocente,nr_de_Contribuinte,nome,idEscola)
    VALUES
		("P1",532467321,"Maria Quintas Barros","A"),
        ("P2",235890472,"Francisco Correia Franco","A"),
        ("P3",173902700,"Ana Teresa Gião Gomes","A"),
        ("P4",356287111,"Maria Beatriz Araujo Lacerda","B"),
        ("P5",801382566,"Luis Enes Sousa","B"),
        ("P6",290172543,"Luis Carlos Salazar Martins","B"),
        ("P7",310200111,"André Carvalho da Cunha Martins","C"),
        ("P8",128356011,"André Gonçalves Vieira","C"),
        ("P9",574123456,"João Figueiredo Peixe Santos","C")
	;
    
INSERT INTO Turma
	(N_Turma,N_Alunos,ID_Diretor,IDEscola)
    VALUES
		(1,7,"P1","A"),
        (2,6,"P2","A"),
        (3,8,"P3","A"),
        (4,6,"P4","B"),
        (5,7,"P5","B"),
        (6,7,"P6","B"),
        (7,8,"P7","C"),
        (8,8,"P9","C")
	;
        
        
        
        
      
        
        
        
        
        
        
        