% Sistemas de Representação de Conhecimento e Raciocínio - Exercício 1
% Grupo 1

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

utente(1,'528-76-5212','Leonardo Castro Cardoso',12,4,1925,'LeonardoCastroCardoso@gmail.com',965551716,'Braga','Carpinteiro',['Diabetes'],1).
utente(2,'050-12-8013','Antônio Dias Sousa',22,7,1969,'AntonioDiasSousa@gmail.com',273978687,'Aveiro','Pescador',['Diabetes'],2).
utente(3,'528-76-5212','Alex Cavalcanti',6,2,1969,'AlexFernandesCavalcanti@gmail.com',244641778,'Porto','Professor',['Asma'],3).

centro_saude(1,'Amorosa','Braga',253465372,'amorosa@gmail.com').
centro_saude(2,'AveiroSaude','Aveiro',283465372,'aveiroSaude@gmail.com').
centro_saude(3,'PortoSaude','Porto',255465372,'portoSaude@gmail.com').

staff(1,1,'Tomás Rocha','tomasrocha@gmail.com').
staff(2,2,'João Barbosa','joaobarbosa@gmail.com').
staff(3,3,'Aline Sousa','alinesousa@gmail.com').

vacinacao_Covid(1,1,21,2,2021,'AstraZeneca',1).
vacinacao_Covid(3,3,28,3,2021,'Pfizer',1).
%------------------------------------------------------------
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

intersetaLista([H],L):-pertence(H,L).
intersetaLista([H|T],L):- pertence(H,L);intersetaLista(T,L).

% Extensão do predicado removeRepetidos:Lista,Lista -> {V,F}
removeRepetidos([],[]).
removeRepetidos([H|T],L):- pertence(H,T),removeRepetidos(T,L).
removeRepetidos([H|T],[H|T1]):- nao(pertence(H,T)),removeRepetidos(T,T1).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extens�o do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    solucoes(Invariante,+Termo::Invariante,Lista),
    insercao(Termo),
    teste(Lista).

insercao(Termo) :-
    assert(Termo).
insercao(Termo) :-
    retract(Termo),!,fail.

teste([]).
test([H|T]):-
    H,
    test(T).

%----------------------------------------------------------------
%Extensao do predicado que perrmite a involucao do conhecimento
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
%----------------------------------------------------------------
% Invariante Estrutural para utente:
% (não permite a inserção de conhecimento repetido)

+utente(I,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,Doencas,CentroSaude) :: 
                                (solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(I,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,Doencas,CentroSaude) :: 
                                (solucoes(NSS,(utente(_,NSS,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(I,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,Doencas,CentroSaude) :: 
                                (solucoes(Email,(utente(_,_,_,_,_,_,Email,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+utente(I,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,Doencas,CentroSaude) :: 
                                (solucoes(Tel,(utente(_,_,_,_,_,_,_,Tel,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%----------------------------------------------------------------
% Invariante Estrutural para vacinacao_Covid:
% (não permite a inserção de conhecimento repetido)

+vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma) ::
                                (solucoes(Utente,(utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

+vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma) ::
                                (solucoes(Staff,(staff(Staff,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%+vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma) :: 
 %                   ((utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),
  %                  tomasUtente(Utente,T),T<2,
   %                 Toma is T+1). %Verificar tambem se a vacina é a mesma

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a primeira fase da Vacinação
% Extensao do predicado vacinacao1Fase : IDs -> {V,F}

vacinacao1Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,Ano,_,_,_,Profissao,Doencas,_),(
                                    (idade(Ano,Idade) ,Idade>=80);
                                    (profissoes1Fase(P),pertence(Profissao,P));
                                    (idade(Ano,Idade) ,Idade>=50, doencas1Fase(D),intersetaLista(Doencas,D)))),
                             R),removeRepetidos(R,IDs).
                            
profissoes1Fase(['Enfermeiro','Médico','Auxiliar de Saúde','Militar','Policia']).
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
indevidaFase1(Dia,Mes,Ano):-(Mes < 12,Ano =:= 2020);(Mes =< 12,Ano < 2020).
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

%-------------------------------------------------------------------------
%Registar
registaVacinacao(Staff,Utente,Dia,Mes,Ano,Vacina,Toma):- evolucao(vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma)).