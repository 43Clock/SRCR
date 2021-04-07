% Sistemas de Representação de Conhecimento e Raciocínio - Exercício 1
% Grupo 43

% Alexandra Dias Candeis
% Luis Carlos da Costa Salazar Martins
% Renata Ferreira Teixeira
% Rui Alexandre da Costa Gonçalves
% Tiago Araujo Alves

%-----------------------------------------------------------------------
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------------------------------------------------------------------
% Definição de invariante

:- op(900,xfy,'::').
:- dynamic(utente/12).
:- dynamic(centro_saude/5).
:- dynamic(staff/4).
:- dynamic(vacinacao_Covid/7).

% -------------------------------------------------------------------------------------------
% BASE DE CONHECIMENTO
%--------------------------------------------------------------------------------------------

utente(1,'528-76-5212','Leonardo Castro Cardoso',12,4,1925,'leonardocastrocardoso@gmail.com',965551716,'Braga','Carpinteiro',['Diabetes'],1).
utente(2,'050-12-8013','Antônio Dias Sousa',22,7,1969,'antoniodiassousa@gmail.com',273978687,'Aveiro','Pescador',['Diabetes'],2).
utente(3,'528-76-5212','Alex Cavalcanti',6,2,1969,'alexFernandescavalcanti@gmail.com',244641778,'Porto','Professor',['Asma'],3).
utente(4,'041-09-7675','Dominique Castelo Regueira',5,9,1965,'dominiquecasteloregueira@gmail.com',969248520,'Lisboa','Militar',[],6).
utente(5,'525-89-6485','Éder Vigário Sacramento',10,7,1964,'edervigáriosacramento@gmail.com',961969458,'Bragança','Talhante',['Doença renal crónica'],5).
utente(6,'478-80-8396','Marília Castanho Dutra',16,1,1950,'maríliacastanhodutra@gmail.com',947429573,'Viseu','Advogado',['Doença respiratória crónica'],1).
utente(7,'237-61-0624','Dário Franca Costa da Costa',27,2,1987,'dariofrancacostadacosta@gmail.com',9619584846,'Santarem','Médico',[],4).
utente(8,'487-56-6857','Benjamin Tavares Sales',3,12,2008,'benjamintavaressales@gmail.com',9887808934,'Porto','Estudante',['Asma'],3).
utente(9,'501-19-9485','Marcelo Franqueira Portela',29,3,1972,'marcelofranqueiraportela@gmail.com',253796185,'Braga','Enfermeiro',['Diabetes'],1).
utente(10,'247-63-4919','Lúcia Domingues Barros',17,4,1980,'luciadominguesbarros@gmail.com',938582447,'Aveiro','Arquiteta',['Insuficiência cardíaca'],2).
utente(11,'387-05-0763','Marcelino Zarco Aveiro',3,11,1929,'marcelinozarcoaveiro@gmail.com',965772946,'Évora','Vendedor',[],6).
utente(12,'135-52-2652','Diana Coimbra Barreira',14,12,1978,'dianacoimbrabarreira@gmail.com',968888619,'Lisboa','Mecânico',[],6).

centro_saude(1,'Amorosa','Braga',253465372,'amorosa@gmail.com').
centro_saude(2,'AveiroSaúde','Aveiro',283465372,'aveirosaude@gmail.com').
centro_saude(3,'PortoSaúde','Porto',255465372,'portosaude@gmail.com').
centro_saude(4,'SantarémClínica','Santarém',243794853,'santaremclinica@gmail.com').
centro_saude(5,'BragançaClínica','Bragança',273888601,'bragancaclinica@gmail.com').
centro_saude(6,'LisboaComSaúde','Lisboa',219755729,'lisboacomsaude@gmail.com').
centro_saude(7,'ÉvoraMelhor','Évora',266926492,'evoramelhor@gmail.com').
centro_saude(8,'ViseuSaúde','Viseu',232702759,'viseusaude@gmail.com').

staff(1,1,'Tomás Rocha',',').
staff(2,2,'João Barbosa','joaobarbosa@gmail.com').
staff(3,3,'Aline Sousa','alinesousa@gmail.com').
staff(4,4,'Noah Esteves','noahesteves@gmail.com').
staff(5,5,'Fábia Pescada','fabiavilarinho@gmail.com').
staff(6,6,'Diogo Mourinho','diogomourinho@gmail.com').
staff(7,7,'Salomé Sabrosa','salomesabrosa@gmail.com').
staff(8,8,'Duarte Mourão','duartemourao@gmail.com').
staff(9,4,'Cândida Castanheira','candidacastanheira@gmail.com').
staff(10,7,'Adalberto Dias','adalbertodias@gmail.com').

vacinacao_Covid(1,1,21,2,2021,'AstraZeneca',1).
vacinacao_Covid(1,1,21,3,2021,'AstraZeneca',2).
vacinacao_Covid(3,3,28,3,2021,'Pfizer',1).

%-------------------------------------------------------------------------
% Extensão do predicado comprimento : L , R -> {V,R} 

comprimento( [],0 ).
comprimento( [_|L],N ) :-
    comprimento( L,N1 ),
    N is N1+1.

% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|_] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

%Extensão do predicado idade: Ano,Idade -> {V,F}

idade(Ano,Idade):- Idade is 2021-Ano.


% Identificar se algum elemento de uma lista pertence a outra.
% Extensão do predicado intersetaLista: Lista,Lista -> {V,F}

intersetaLista([H],L):- 
    pertence(H,L).
intersetaLista([H|T],L):- 
    pertence(H,L);intersetaLista(T,L).

% Extensão do predicado removeRepetidos:Lista,Lista -> {V,F}

removeRepetidos([],[]).
removeRepetidos([H|T],L):- 
    pertence(H,T),removeRepetidos(T,L).
removeRepetidos([H|T],[H|T1]):- 
        nao(pertence(H,T)),removeRepetidos(T,T1).

%-------------------------------------------------------------------------
% Extensão do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    solucoes(Invariante,+Termo::Invariante,Lista),
    insercao(Termo),
    teste(Lista).

insercao(Termo) :-
    assert(Termo).
insercao(Termo) :-
    retract(Termo),!,fail.

teste([]).
teste([H|T]):-
    H,
    teste(T).

%-------------------------------------------------------------------------
%Extensão do predicado que perrmite a involucao do conhecimento

involucao( Termo ) :-
    solucoes(Invariante,-Termo::Invariante,Lista),
    remocao(Termo),
    teste(Lista).

remocao(Termo) :-
    retract(Termo).
remocao(Termo) :-
    assert(Termo),!,fail.

% Extensão do predicado que permite a procura do conhecimento

solucoes(X,Y,Z) :- findall(X,Y,Z).

%-------------------------------------------------------------------------
% Invariante Estrutural para utente:
% (não permite a inserção de conhecimento repetido)

+utente(ID,_,_,_,_,_,_,_,_,_,_,_) :: 
                                (solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(_,NSS,_,_,_,_,_,_,_,_,_,_) :: 
                                (solucoes(NSS,(utente(_,NSS,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(_,_,_,_,_,_,Email,_,_,_,_,_) :: 
                                (solucoes(Email,(utente(_,_,_,_,_,_,Email,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(_,_,_,_,_,_,_,Tel,_,_,_,_) :: 
                                (solucoes(Tel,(utente(_,_,_,_,_,_,_,Tel,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(_,_,_,_,_,_,_,_,_,_,_,CentroSaude) ::
                                (solucoes(CentroSaude,(centro_saude(CentroSaude,_,_,_,_)),L),
                                comprimento(L,N),
                                N == 1).
%-------------------------------------------------------------------------
% Invariante Estrutural para vacinacao_Covid:
% (não permite a inserção de conhecimento repetido)

+vacinacao_Covid(_,Utente,_,_,_,_,_) ::
                                (solucoes(Utente,(utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+vacinacao_Covid(Staff,_,_,_,_,_,_) ::
                                (solucoes(Staff,(staff(Staff,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Ver se é tomar certa
+vacinacao_Covid(_,Utente,_,_,_,_,Toma) :: 
                    ((utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),
                    tomasUtente(Utente,T),Toma=<2,
                    Toma =:= T).

%Ver se a vacina da primeira é igual à da segunda
+vacinacao_Covid(_,Utente,_,_,_,Vacina,Toma) :: 
                    (Toma == 1;(solucoes(Utente,vacinacao_Covid(_,Utente,_,_,_,Vacina,_),L),
                    comprimento(L,N),
                    N == 2)). %% Mete-se Toma == 1 para o caso em que não foi vacinado ainda

%Ver se a data da segunda toma é dps da primeira
+vacinacao_Covid(_,Utente,Dia,Mes,Ano,_,Toma) :: 
                    (Toma == 1;(vacinacao_Covid(_,Utente,Dia2,Mes2,Ano2,_,1),
                    Toma == 2,isAfter(Dia,Mes,Ano,Dia2,Mes2,Ano2))).

%-------------------------------------------------------------------------
% Invariante Estrutural para staff:
% (não permite a inserção de conhecimento repetido)

+staff(Staff,_,_,_) :: (solucoes(Staff,(staff(Staff,_,_,_)),L),
                                    comprimento(L,N),
                                    N == 1).

+staff(_,_,_,Email) :: (solucoes(Email,(staff(_,_,_,Email)),L),
                                    comprimento(L,N),
                                    N == 1).

+staff(_,Centro,_,_) :: (solucoes(Centro,(centro_saude(Centro,_,_,_,_)),L),
                                    comprimento(L,N),
                                    N == 1).

%-------------------------------------------------------------------------
% Invariante Estrutural para centro_saude:
% (não permite a inserção de conhecimento repetido)

+centro_saude(Centro,_,_,_,_) :: 
                            (solucoes(Centro,(centro_saude(Centro,_,_,_,_)),L),
                            comprimento(L,N),
                            N == 1).

+centro_saude(_,_,_,Telefone,_) :: 
                            (solucoes(Telefone,(centro_saude(_,_,_,Telefone,_)),L),
                            comprimento(L,N),
                            N == 1).

+centro_saude(_,_,_,_,Email) :: 
                            (solucoes(Email,(centro_saude(_,_,_,_,Email)),L),
                            comprimento(L,N),
                            N == 1).
%-------------------------------------------------------------------------

%Impede de remover se tiver vacinas
-utente(ID,_,_,_,_,_,_,_,_,_,_,_) ::
                            (solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),L),
                             comprimento(L,N),
                             N == 0).
%-------------------------------------------------------------------------
-centro_saude(Centro,_,_,_,_) ::
                            (solucoes(Centro,(utente(_,_,_,_,_,_,_,_,_,_,_,Centro)),L),
                             comprimento(L,N),
                             N == 0).

-centro_saude(Centro,_,_,_,_) ::
                            (solucoes(Centro,(staff(_,Centro,_,_)),L),
                             comprimento(L,N),
                             N == 0).

%-------------------------------------------------------------------------
-staff(Staff,_,_,_) :: (solucoes(Staff,(vacinacao_Covid(Staff,_,_,_,_,_,_)),L),
                        comprimento(L,N),
                       N == 0).


%-------------------------------------------------------------------------
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( _ ).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a primeira fase da Vacinação
% Extensao do predicado vacinacao1Fase : IDs -> {V,F}

vacinacao1Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,Ano,_,_,_,Profissao,Doencas,_),(
                                    (idade(Ano,Idade) ,Idade>=80);
                                    (profissoes1Fase(P),pertence(Profissao,P));
                                    (idade(Ano,Idade) ,Idade>=50, doencas1Fase(D),intersetaLista(Doencas,D)))),
                             R),removeRepetidos(R,IDs).
                            
profissoes1Fase(['Enfermeiro','Médico','Auxiliar de Saúde','Militar','Polícia']).
doencas1Fase(['Insuficiência cardíaca','Doença coronária','Insuficiência renal','Doença respiratória crónica','DPOC']).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a primeira fase da Vacinação
% Extensao do predicado vacinacao2Fase : IDs -> {V,F}

vacinacao2Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,Ano,_,_,_,_,Doencas,_),(
                                    (idade(Ano,Idade) ,Idade>=65);
                                    (idade(Ano,Idade) ,Idade>=50,Idade=<64, doencas2Fase(D),intersetaLista(Doencas,D))),
                                    vacinacao1Fase(V),nao(pertence(ID,V))),
                            R),removeRepetidos(R,IDs).

doencas2Fase(['Diabetes','Neoplasia maligna ativa','Doença renal crónica','Insuficiência hepática','Hipertensão arterial','Obesidade']).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a primeira fase da Vacinação
% Extensao do predicado vacinacao3Fase : IDs -> {V,F}

vacinacao3Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                vacinacao1Fase(V1),vacinacao2Fase(V2),
                                nao(pertence(ID,V1)),nao(pertence(ID,V2)))
                            ,IDs).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas Vacinadas
% Extensao do predicado vacinadas : IDs -> {V,F}

vacinadas(IDs) :- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),vacinacao_Covid(_,ID,_,_,_,_,_)),IDs).


%-------------------------------------------------------------------------
% Identificar os ids das pessoas não vacinadas
% Extensao do predicado naoVacinadas : IDs -> {V,F}

naoVacinadas(IDs):-solucoes(ID,((utente(ID,_,_,_,_,_,_,_,_,_,_,_)),vacinadas(V),nao(pertence(ID,V))),IDs).

%-------------------------------------------------------------------------
%Vacinação indevida

indevidaFase1(_,Mes,Ano):-(Mes < 12,Ano =:= 2020);(Mes =< 12,Ano < 2020).
indevidaFase2(Dia,Mes,Ano):-(Mes < 4,Ano =:= 2021);indevidaFase1(Dia,Mes,Ano).
indevidaFase3(Dia,Mes,Ano):-(Mes < 9,Ano =:= 2021);indevidaFase1(Dia,Mes,Ano);indevidaFase2(Dia,Mes,Ano).%Falar no relatorio de metermos que a fase 3 começa em Setembro.

faseUtente(ID,Fase):-vacinacao1Fase(V),pertence(ID,V),Fase is 1.
faseUtente(ID,Fase):-vacinacao2Fase(V),pertence(ID,V),Fase is 2.
faseUtente(ID,Fase):-vacinacao3Fase(V),pertence(ID,V),Fase is 3.

vacinacaoIndevida(IDs):- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                      vacinacao_Covid(_,ID,Dia,Mes,Ano,_,_),
                                      faseUtente(ID,Fase),
                                      ((Fase =:= 1,indevidaFase1(Dia,Mes,Ano));
                                       (Fase =:= 2,indevidaFase2(Dia,Mes,Ano));
                                       (Fase =:= 3,indevidaFase3(Dia,Mes,Ano)))),
                                R),removeRepetidos(R,IDs).

%-------------------------------------------------------------------------
%Candidatos

candidatoVacinacao(Fase,IDs):-solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                           naoVacinadas(NV),pertence(ID,NV),
                                           faseUtente(ID,F),F =:= Fase),
                                       R),removeRepetidos(R,IDs).

%-------------------------------------------------------------------------

tomasCompletas(IDs):-solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,2)),IDs).

vacinacaoIncompleta(IDs):- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                        vacinadas(V),tomasCompletas(T),
                                        pertence(ID,V),nao(pertence(ID,T)))
                                    ,IDs).

tomasUtente(ID,Tomas):- solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),T),
                        comprimento(T,Tomas).

isAfter(Dia,Mes,Ano,Dia2,Mes2,Ano2):- (Ano > Ano2);(Ano == Ano2,Mes > Mes2);(Ano == Ano2,Mes == Mes2,Dia>Dia2).
%-------------------------------------------------------------------------
%Registar

registaVacinacao(Staff,Utente,Dia,Mes,Ano,Vacina,Toma):- evolucao(vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma)).

registaUtente(ID,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,[Doencas|H],CentroSaude):-evolucao(utente(ID,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,[Doencas|H],CentroSaude)).

registaStaff(Staff,Centro,Nome,Email):-evolucao(staff(Staff,Centro,Nome,Email)).

registaCentro(Centro,Nome,Morada,Telefone,Email):-evolucao(centro_saude(Centro,Nome,Morada,Telefone,Email)).

%-------------------------------------------------------------------------
%Remover

removerUtente(ID):-involucao(utente(ID,_,_,_,_,_,_,_,_,_,_,_)).

removerStaff(Staff):-involucao(staff(Staff,_,_,_)).

removerCentro(Centro):-involucao(centro_saude(Centro,_,_,_,_)).

removerVacinas([]).
removerVacinas([H|T]):-involucao(vacinacao_Covid(_,H,_,_,_,_,_)),removerVacinas(T).

forceRemoverUtente(ID):-(solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),R)),
                            removerVacinas(R),removerUtente(ID).
%-------------------------------------------------------------------------

inferencia(Questao,false):- -Questao.
inferencia(Questao,true):- Questao.

%-------------------------------------------------------------------------
%EXTRA
%Identificar Staff que não vacinou ninguem.
staffSemVacinacao(IDs):-solucoes(ID,(staff(ID,_,_,_),
                                    staffComVacinacao(R),nao(pertence(ID,R)))
                                    ,IDs).

%Identificar Staff que vacinou alguem.
staffComVacinacao(IDs):-solucoes(ID,(vacinacao_Covid(ID,_,_,_,_,_,_)),IDs).

%Staff que vacinou um utente
staffDeUtente(Utente,IDs):-solucoes((ID,Nome),(vacinacao_Covid(ID,Utente,_,_,_,_,_),staff(ID,_,Nome,_)),IDs).

%Staff que pertence a centro.
staffDeCentro(Centro,IDs):-solucoes((ID,Nome),(staff(ID,Centro,Nome,_)),IDs).

ocurrenciasVacina(_,[],0).
ocurrenciasVacina(X,[X|T],Y):- ocurrenciasVacina(X,T,Z),Y is Z+1.
ocurrenciasVacina(X,[_|T],Z):- ocurrenciasVacina(X,T,Z).

vacinasToTupleList([],_,_).
vacinasToTupleList([H],V,[(H,R)]):-ocurrenciasVacina(H,V,R).
vacinasToTupleList([H|T],V,[(H,R)|L]):-ocurrenciasVacina(H,V,R),vacinasToTupleList(T,V,L).

%Lista todas as vacinas dadas num centro e a quantidade
vacinasPorCentro(Centro,Vacinas):- (solucoes(Vacina,(vacinacao_Covid(Staff,_,_,_,_,Vacina,_),
                                             staff(Staff,Centro,_,_)),R),
                                    removeRepetidos(R,L),vacinasToTupleList(L,R,Vacinas)).




listaUtentes(R) :- solucoes((Id,Nome),(utente(Id,_,Nome,_,_,_,_,_,_,_,_,_)),R).

listaVacinas(R) :- solucoes((Staff,Utente,Vacina,Toma),(vacinacao_Covid(Staff,Utente,_,_,_,Vacina,Toma)),R).

listaStaff(R) :- solucoes((Staff,Nome,Centro),(staff(Staff,Centro,Nome,_)),R).

listaCentros(R) :- solucoes((Centro,Nome),(centro_saude(Centro,Nome,_,_,_)),R).

vacinasPorStaff(Staff,R) :- solucoes((Staff),vacinacao_Covid(Staff,_,_,_,_,_,_),L),comprimento(L,R).


maiorTuplo( (Z,X), (_,Y), (Z,X) ) :-
    X > Y.
maiorTuplo( (_,X),(W,Y),(W,Y) ) :-
    X =< Y.


maiorTuploLista( [X],X ).
maiorTuploLista( [X|Y],N ) :-
    maiorTuploLista( Y,Z ),
        maiorTuplo( X,Z,N ).

%Staff que vacinou mais
staffMaisVacinas(R) :- solucoes((Staff,N),(staff(Staff,_,_,_), 
					   vacinasPorStaff(Staff,N)), X),
					   maiorTuploLista(X,R).


numeroVacinasPorCentro(Centro,R) :- solucoes((Vacina),(staff(Staff,Centro,_,_),
					        vacinacao_Covid(Staff,_,_,_,_,Vacina,_)),L),
					        comprimento(L,R).

centroMaisVacinas(R) :- solucoes((Centro,N),(centro_saude(Centro,_,_,_,_), 
					     numeroVacinasPorCentro(Centro,N)), X),
					     maiorTuploLista(X,R).

numeroUtentesCentro(Centro,R) :- solucoes(ID,utente(ID,_,_,_,_,_,_,_,_,_,_,Centro),X),comprimento(X,R).

utentesCentro(Centro,R) :- solucoes((ID,Nome),utente(ID,_,Nome,_,_,_,_,_,_,_,_,Centro),R).

vacinacaoIndevidaStaff(IDs):- solucoes(Staff,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
					      vacinacao_Covid(Staff,ID,Dia,Mes,Ano,_,_),
                                      	      faseUtente(ID,Fase),
                                      	      ((Fase =:= 1,indevidaFase1(Dia,Mes,Ano));
                                              (Fase =:= 2,indevidaFase2(Dia,Mes,Ano));
                                              (Fase =:= 3,indevidaFase3(Dia,Mes,Ano)))),
                                      R),removeRepetidos(R,IDs).


vacinacaoIndevidaCentro(IDs):- solucoes(Centro,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),						
					        vacinacao_Covid(Staff,ID,Dia,Mes,Ano,_,_),
                                                staff(Staff,Centro,_,_),
                                      	        faseUtente(ID,Fase),
                                      	        ((Fase =:= 1,indevidaFase1(Dia,Mes,Ano));
                                                (Fase =:= 2,indevidaFase2(Dia,Mes,Ano));
                                                (Fase =:= 3,indevidaFase3(Dia,Mes,Ano)))),
                                        R),removeRepetidos(R,IDs).
