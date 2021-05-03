% Sistemas de Representação de Conhecimento e Raciocínio - Exercício 2
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
:- discontiguous excecao/1.
:- discontiguous vacinacao_Covid/7.
:- discontiguous staff/4.
:- discontiguous centro_saude/5.
:- discontiguous utente/12.
:- discontiguous (::)/2.
:- discontiguous (-)/1.
:- discontiguous nulo/1.

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
utente(5,'525-89-6485','Éder Vigário Sacramento',10,7,1970,'edervigáriosacramento@gmail.com',961969458,'Bragança','Talhante',['Doença renal crónica'],5).
utente(6,'478-80-8396','Marília Castanho Dutra',16,1,1950,'maríliacastanhodutra@gmail.com',947429573,'Viseu','Advogado',['Doença respiratória crónica'],8).
utente(7,'237-61-0624','Dário Franca Costa da Costa',27,2,1987,'dariofrancacostadacosta@gmail.com',9619584846,'Santarem',p_desconhecida,[],4).
utente(8,nss_desconhecido,'Benjamin Tavares Sales',3,12,2008,'benjamintavaressales@gmail.com',9887808934,'Porto','Estudante',['Asma'],3).
utente(9,'501-19-9485','Marcelo Franqueira Portela',dia_desconhecido,mes_desconhecido,ano_desconhecido,'marcelofranqueiraportela@gmail.com',253796185,'Braga','Enfermeiro',['Diabetes'],1).
utente(10,'247-63-4919',nome_desconhecido,17,4,1979,'luciadominguesbarros@gmail.com',938582447,'Aveiro','Arquiteta',['Insuficiência cardíaca'],2).
utente(11,'387-05-0763','Marcelino Zarco Aveiro',3,11,1929,email_desconhecido,965772946,'Évora','Vendedor',[],7).
utente(12,'135-52-2652','Diana Coimbra Barreira',14,12,1978,'dianacoimbrabarreira@gmail.com',tele_desconhecido,'Lisboa','Barbeiro',[],6).
utente(13,'247-17-6120','Manuel Lourenço Garcia Faria Machado',20,1,1953,'manuelmachado@gmail.com',936885900,cidade_desconhecida,'Pasteleiro',['Obesidade'],4).
utente(14,'303-11-9515','Eduarda Cruz Pires',18,7,1965,'eduardres@gmail.com',927118463,'Bragança','Segurança',doencas_desconhecidas,5).


centro_saude(1,'Amorosa','Guimaraes',253465372,'amorosa@gmail.com').
centro_saude(2,'AveiroSaúde','Aveiro',283465372,'aveirosaude@gmail.com').
centro_saude(3,'PortoSaúde','Porto',255465372,'portosaude@gmail.com').
centro_saude(4,'SantarémClínica','Santarém',243794853,'santaremclinica@gmail.com').
centro_saude(5,nome_desconhecido,'Bragança',273888601,'bragancaclinica@gmail.com').
centro_saude(6,'LisboaComSaúde',cidade_desconhecida,219755729,'lisboacomsaude@gmail.com').
centro_saude(7,'ÉvoraMelhor','Évora',tele_desconhecido,'evoramelhor@gmail.com').
centro_saude(8,'ViseuSaúde','Viseu',232702759,email_desconhecido).

staff(1,1,'Tomás Rocha','tomasrocha@gmail.com').
staff(2,2,'João Barbosa','joaobarbosa@gmail.com').
staff(3,3,'Aline Sousa','alinesousa@gmail.com').
staff(4,4,'Noah Esteves','noahesteves@gmail.com').
staff(5,5,'Fábia Pescada','fabiavilarinho@gmail.com').
staff(6,6,'Diogo Mourinho','diogomourinho@gmail.com').
staff(7,7,'Salomé Sabrosa','salomesabrosa@gmail.com').
staff(8,8,'Duarte Mourão','duartemourao@gmail.com').
staff(9,4,nome_desconhecido,'candidacastanheira@gmail.com').
staff(10,7,'Adalberto Dias',email_desconhecido).

vacinacao_Covid(1,1,21,2,2021,'AstraZeneca',1).
vacinacao_Covid(3,3,28,3,2021,'Pfizer',1).
vacinacao_Covid(1,1,29,2,2021,'AstraZeneca',2).
vacinacao_Covid(6,4,22,2,2021,'Pfizer',1).
vacinacao_Covid(6,4,1,3,2021,'Pfizer',2).
vacinacao_Covid(5,5,12,5,2021,'Moderna',1).
vacinacao_Covid(5,5,20,5,2021,'Moderna',2).
vacinacao_Covid(2,10,dia_desconhecido,5,2021,'AstraZeneca',1).
vacinacao_Covid(9,13,10,mes_desconhecido,2021,'Moderna',1).
vacinacao_Covid(4,13,17,6,ano_desconhecido,'Moderna',2).
vacinacao_Covid(5,14,dia_desconhecido,mes_desconhecido,ano_desconhecido,'AstraZeneca',1).
vacinacao_Covid(5,14,10,6,2021,vacina_desconhecida,2).

%-------------------------------------------------------------------------

demo( Questao,verdadeiro ) :- Questao.
demo( Questao, falso ) :- -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).


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
    teste(Lista),
    remocao(Termo).

remocao(Termo) :-
    retract(Termo).
remocao(Termo) :-
    assert(Termo),!,fail.

% Extensão do predicado que permite a procura do conhecimento

solucoes(X,Y,Z) :- findall(X,Y,Z).

%-------------------------------------------------------------------------
% Invariante Estrutural para utente:
% (não permite a inserção de conhecimento repetido)

%Não permite adicionar um Utente com um ID ja existente na base de conhecimento
+utente(ID,_,_,_,_,_,_,_,_,_,_,_) :: 
                                (solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Não permite adicionar um Utente com um NSS ja existente na base de conhecimento
+utente(_,NSS,_,_,_,_,_,_,_,_,_,_) :: 
                                (solucoes(NSS,(utente(_,NSS,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Não permite adicionar um Utente com um Email ja existente na base de conhecimento
+utente(_,_,_,_,_,_,Email,_,_,_,_,_) :: 
                                (solucoes(Email,(utente(_,_,_,_,_,_,Email,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Não permite adicionar um Utente com um numero de Telemovel ja existente na base de conhecimento
+utente(_,_,_,_,_,_,_,Tel,_,_,_,_) :: 
                                (solucoes(Tel,(utente(_,_,_,_,_,_,_,Tel,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Não permite adicionar um Utente com um centro de Saude não existente na base de conhecimento
+utente(_,_,_,_,_,_,_,_,_,_,_,CentroSaude) ::
                                (solucoes(CentroSaude,(centro_saude(CentroSaude,_,_,_,_)),L),
                                comprimento(L,N),
                                N == 1).
%-------------------------------------------------------------------------
% Invariante Estrutural para vacinacao_Covid:

%Não permite adicionar uma vacinação com um utente que não existe na base de conhecimento
+vacinacao_Covid(_,Utente,_,_,_,_,_) ::
                                (solucoes(Utente,(utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Não permite adicionar uma vacinação com um staff que não existe na base de conhecimento
+vacinacao_Covid(Staff,_,_,_,_,_,_) ::
                                (solucoes(Staff,(staff(Staff,_,_,_)),L),
                                 comprimento(L,N),
                                N == 1).

%Garante que a inserção das vacinas é por ordem e que não possa haver mais do que duas tomas
+vacinacao_Covid(_,Utente,_,_,_,_,Toma) :: 
                    ((utente(Utente,_,_,_,_,_,_,_,_,_,_,_)),
                    tomasUtente(Utente,T),Toma=<2,
                    Toma =:= T).

%Garante que vacina da primeira toma é igual à da segunda
+vacinacao_Covid(_,Utente,_,_,_,Vacina,Toma) :: 
                    (Toma == 1;(solucoes(Utente,vacinacao_Covid(_,Utente,_,_,_,Vacina,_),L),
                    comprimento(L,N),
                    N == 2)). %% Mete-se Toma == 1 para o caso em que não foi vacinado ainda

%Garante que a data da segunda toma é depois da primeira
+vacinacao_Covid(_,Utente,Dia,Mes,Ano,_,Toma) :: 
                    (Toma == 1;(vacinacao_Covid(_,Utente,Dia2,Mes2,Ano2,_,1),
                    Toma == 2,isAfter(Dia,Mes,Ano,Dia2,Mes2,Ano2))).

%-------------------------------------------------------------------------
% Invariante Estrutural para staff:

%Não permite adicionar um Staff com um ID ja existente na base de conhecimento
+staff(Staff,_,_,_) :: (solucoes(Staff,(staff(Staff,_,_,_)),L),
                                    comprimento(L,N),
                                    N == 1).

%Não permite adicionar um Staff com um Email ja existente na base de conhecimento
+staff(_,_,_,Email) :: (solucoes(Email,(staff(_,_,_,Email)),L),
                                    comprimento(L,N),
                                    N == 1).

%Não permite adicionar um Staff com um centro de Saude não existente na base de conhecimento                                
+staff(_,Centro,_,_) :: (solucoes(Centro,(centro_saude(Centro,_,_,_,_)),L),
                                    comprimento(L,N),
                                    N == 1).

%-------------------------------------------------------------------------
% Invariante Estrutural para centro_saude:

%Não permite adicionar um Centro de Saude com um ID ja existente na base de conhecimento
+centro_saude(Centro,_,_,_,_) :: 
                            (solucoes(Centro,(centro_saude(Centro,_,_,_,_)),L),
                            comprimento(L,N),
                            N == 1).

%Não permite adicionar um Centro de Saude com um numero de Telefone ja existente na base de conhecimento
+centro_saude(_,_,_,Telefone,_) :: 
                            (solucoes(Telefone,(centro_saude(_,_,_,Telefone,_)),L),
                            comprimento(L,N),
                            N == 1).

%Não permite adicionar um Centro de Saude com um email ja existente na base de conhecimento
+centro_saude(_,_,_,_,Email) :: 
                            (solucoes(Email,(centro_saude(_,_,_,_,Email)),L),
                            comprimento(L,N),
                            N == 1).
%-------------------------------------------------------------------------
%Invariante conhecimento negativo utente
%Não é possivel remover utente que ja tenha vacinações
-utente(ID,_,_,_,_,_,_,_,_,_,_,_) ::
                            (solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),L),
                             comprimento(L,N),
                             N == 0).
%-------------------------------------------------------------------------
%Invariante conhecimento negativo Centro de Saude
%Não é possivel remover Centro de Saude que ja tenha um utente associado
-centro_saude(Centro,_,_,_,_) ::
                            (solucoes(Centro,(utente(_,_,_,_,_,_,_,_,_,_,_,Centro)),L),
                             comprimento(L,N),
                             N == 0).

%Não é possivel remover Centro de Saude que ja tenha stafff associada
-centro_saude(Centro,_,_,_,_) ::
                            (solucoes(Centro,(staff(_,Centro,_,_)),L),
                             comprimento(L,N),
                             N == 0).

%-------------------------------------------------------------------------
%Invariante conhecimento negativo Staff
%Não é possivel remover staff que ja tenha feito vacinacoes
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

vacinacao1Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,Ano,_,_,_,Profissao,Doencas,_),
                                    ((nao(excecao(utente(ID,_,_,_,_,ano_desconhecido,_,_,_,Profissao,Doencas,_))), 
                                      nao(excecao(utente(ID,_,_,_,_,ano_interdito,_,_,_,Profissao,Doencas,_)))),(idade(Ano,Idade) ,Idade>=80);
                                    (nao(excecao(utente(ID,_,_,_,_,Ano,_,_,_,p_desconhecida,Doencas,_))),profissoes1Fase(P),pertence(Profissao,P));
                                    ((nao(excecao(utente(ID,_,_,_,_,ano_desconhecido,_,_,_,Profissao,Doencas,_))), 
                                      nao(excecao(utente(ID,_,_,_,_,ano_interdito,_,_,_,Profissao,Doencas,_))),
                                      nao(excecao(utente(ID,_,_,_,_,Ano,_,_,_,Profissao,doencas_desconhecidas,_)))
                                      ),
                                    idade(Ano,Idade) ,Idade>=50, doencas1Fase(D),intersetaLista(Doencas,D)))),
                             R),removeRepetidos(R,IDs).

%Facto que representa todas as profissoes a serem vacindadas na primeira fase.
profissoes1Fase(['Enfermeiro','Médico','Auxiliar de Saúde','Militar','Polícia']).

%Facto que representa toas as doencas de risco para a primeira fase.
doencas1Fase(['Insuficiência cardíaca','Doença coronária','Insuficiência renal','Doença respiratória crónica','DPOC']).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a segunda fase da Vacinação
% Extensao do predicado vacinacao2Fase : IDs -> {V,F}

vacinacao2Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,Ano,_,_,_,_,Doencas,_),
                                    (nao(excecao(utente(ID,_,_,_,_,ano_desconhecido,_,_,_,Profissao,Doencas,_))), 
                                     nao(excecao(utente(ID,_,_,_,_,ano_interdito,_,_,_,Profissao,Doencas,_)))),
                                    ((idade(Ano,Idade) ,Idade>=65);
                                    (idade(Ano,Idade) ,Idade>=50,Idade=<64,
                                    nao(excecao(utente(ID,_,_,_,_,Ano,_,_,_,Profissao,doencas_desconhecidas,_))),
                                     doencas2Fase(D),intersetaLista(Doencas,D))),
                                    vacinacao1Fase(V),nao(pertence(ID,V))),
                            R),removeRepetidos(R,IDs).

%Facto que representa toas as doencas de risco para a primeira fase.
doencas2Fase(['Diabetes','Neoplasia maligna ativa','Doença renal crónica','Insuficiência hepática','Hipertensão arterial','Obesidade']).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas aptas para a terceira fase da Vacinação
% Extensao do predicado vacinacao3Fase : IDs -> {V,F}

vacinacao3Fase(IDs):-solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                vacinacao1Fase(V1),vacinacao2Fase(V2),
                                nao(pertence(ID,V1)),nao(pertence(ID,V2)))
                            ,IDs).

%-------------------------------------------------------------------------
% Identificar os ids das pessoas Vacinadas
% Extensao do predicado vacinadas : IDs -> {V,F}
vacinadas(IDs) :- solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),R),
                            removeRepetidos(R,IDs).


%-------------------------------------------------------------------------
% Identificar os ids das pessoas não vacinadas
% Extensao do predicado naoVacinadas : IDs -> {V,F}

naoVacinadas(IDs):-solucoes(ID,((utente(ID,_,_,_,_,_,_,_,_,_,_,_)),vacinadas(V),nao(pertence(ID,V))),IDs).

%-------------------------------------------------------------------------
% Verificar se data é indevida para certa fase de vacinação
% Extensao do predicado indevidaFaseX : Dia,Mes,Ano -> {V,F}
indevidaFase1(_,Mes,Ano):-(Mes < 12,Ano == 2020);(Mes =< 12,Ano < 2020).
indevidaFase2(Dia,Mes,Ano):-(Mes < 4,Ano == 2021);indevidaFase1(Dia,Mes,Ano).
indevidaFase3(Dia,Mes,Ano):-(Mes < 9,Ano == 2021);indevidaFase1(Dia,Mes,Ano);indevidaFase2(Dia,Mes,Ano).%Falar no relatorio de metermos que a fase 3 começa em Setembro.

%Verifica qual é a fase de um determinado utente
% Extensao do predicado faseUtente : ID,Fase -> {V,F}
faseUtente(ID,Fase):-vacinacao1Fase(V),pertence(ID,V),Fase is 1.
faseUtente(ID,Fase):-vacinacao2Fase(V),pertence(ID,V),Fase is 2.
faseUtente(ID,Fase):-vacinacao3Fase(V),pertence(ID,V),Fase is 3.

%Identificar os ids dos utentes que foram vacinados indevidamente
% Extensao do predicado vacinacaoIndevida : IDs -> {V,F}
vacinacaoIndevida(IDs):- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                      vacinacao_Covid(_,ID,Dia,Mes,Ano,_,_),
                                      (nao(excecao(vacinacao_Covid(_,ID,dia_interdito,mes_interdito,ano_interdito,_,_)))),
                                      (nao(excecao(vacinacao_Covid(_,ID,dia_desconhecido,Mes,Ano,_,_)))),
                                      (nao(excecao(vacinacao_Covid(_,ID,Dia,mes_desconhecido,Ano,_,_)))),
                                      (nao(excecao(vacinacao_Covid(_,ID,Dia,Mes,ano_desconhecido,_,_)))),
                                      (nao(excecao(vacinacao_Covid(_,ID,dia_desconhecido,mes_desconhecido,ano_desconhecido,_,_)))),
                                      faseUtente(ID,Fase),
                                      ((Fase == 1,indevidaFase1(Dia,Mes,Ano));
                                       (Fase == 2,indevidaFase2(Dia,Mes,Ano));
                                       (Fase == 3,indevidaFase3(Dia,Mes,Ano)))),
                                R),removeRepetidos(R,IDs).

%-------------------------------------------------------------------------
%Identificar os ids dos utentes candidatos a uma fase de vacinação
% Extensao do predicado candidatoVacinacao : Fase,IDs -> {V,F}
candidatoVacinacao(Fase,IDs):-solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                           naoVacinadas(NV),pertence(ID,NV),
                                           faseUtente(ID,F),F =:= Fase),
                                       R),removeRepetidos(R,IDs).

%-------------------------------------------------------------------------
%Identificar os ids dos utentes que tomaram todas as doses
% Extensao do predicado tomasCompletas : IDs -> {V,F}
tomasCompletas(IDs):-solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,2)),IDs).

%Identificar os ids dos utentes que não tomaram todas as doses
% Extensao do predicado vacinacaoIncompleta : IDs -> {V,F}
vacinacaoIncompleta(IDs):- solucoes(ID,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                        vacinadas(V),tomasCompletas(T),
                                        pertence(ID,V),nao(pertence(ID,T)))
                                    ,IDs).

%Identificar quantas todas tem um determinado utente
% Extensao do predicado tomasUtente : ID,Tomas -> {V,F}
tomasUtente(ID,Tomas):- solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),T),
                        comprimento(T,Tomas).

%Verifica se uma data é depois de outra
% Extensao do predicado isAter : Dia,Mes,Ano,Dia2,Mes2,Ano2 -> {V,F}
isAfter(Dia,Mes,Ano,Dia2,Mes2,Ano2):- (Ano > Ano2);(Ano =:= Ano2,Mes > Mes2);(Ano =:= Ano2,Mes =:= Mes2,Dia>Dia2).
%-------------------------------------------------------------------------
%Registar Vacinacao
% Extensao do predicado registaVacinacao : Staff,Utente,Dia,Mes,Ano,Vacina,Toma -> {V,F}
registaVacinacao(Staff,Utente,Dia,Mes,Ano,Vacina,Toma):- evolucao(vacinacao_Covid(Staff,Utente,Dia,Mes,Ano,Vacina,Toma)).

%Registar Utente
% Extensao do predicado registaUtente : ID,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,[Doencas],CentroSaude -> {V,F}
registaUtente(ID,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,[Doencas|H],CentroSaude):-evolucao(utente(ID,NSS,Nome,Dia,Mes,Ano,Email,Tel,Morada,Profissao,[Doencas|H],CentroSaude)).

%Registar Staff
% Extensao do predicado registaStaff : Staff,Centro,Nome,Email -> {V,F}
registaStaff(Staff,Centro,Nome,Email):-evolucao(staff(Staff,Centro,Nome,Email)).

%Registar Centro
% Extensao do predicado registaCentro : Centro,Nome,Morada,Telefone,Email -> {V,F}
registaCentro(Centro,Nome,Morada,Telefone,Email):-evolucao(centro_saude(Centro,Nome,Morada,Telefone,Email)).

%-------------------------------------------------------------------------
%Remover utente
% Extensao do predicado removerUtente : ID -> {V,F}
removerUtente(ID):-involucao(utente(ID,_,_,_,_,_,_,_,_,_,_,_)).

%Remover Staff
% Extensao do predicado removerStaff : Staff -> {V,F}
removerStaff(Staff):-involucao(staff(Staff,_,_,_)).

%Remover Centro
% Extensao do predicado removerCentro : Centro -> {V,F}
removerCentro(Centro):-involucao(centro_saude(Centro,_,_,_,_)).

%Remover lista de vacinas
% Extensao do predicado removerVacinas : [Ids] -> {V,F}
removerVacinas([]).
removerVacinas([H|T]):-involucao(vacinacao_Covid(_,H,_,_,_,_,_)),removerVacinas(T).

%Remover utente e todas as suas vacinas
% Extensao do predicado forceRemoverUtente : ID -> {V,F}
forceRemoverUtente(ID):-(solucoes(ID,(vacinacao_Covid(_,ID,_,_,_,_,_)),R)),
                            removerVacinas(R),removerUtente(ID).
%-------------------------------------------------------------------------

inferencia(Questao,false):- not(Questao).
inferencia(Questao,true):- Questao.

%-------------------------------------------------------------------------
%Identificar Staff que não vacinou ninguem.
% Extensao do predicado staffSemVacinacao : IDs -> {V,F}
staffSemVacinacao(IDs):-solucoes(ID,(staff(ID,_,_,_),
                                    staffComVacinacao(R),nao(pertence(ID,R)))
                                    ,IDs).

%Identificar Staff que vacinou alguem.
% Extensao do predicado staffComVacinacao : IDs -> {V,F}
staffComVacinacao(IDs):-solucoes(ID,(vacinacao_Covid(ID,_,_,_,_,_,_)),R),removeRepetidos(R,IDs).

%Identificar Staff que vacinou um determinado utente
% Extensao do predicado staffDeUtente : Utente,IDs -> {V,F}
staffDeUtente(Utente,IDs):-solucoes((ID,Nome),(vacinacao_Covid(ID,Utente,_,_,_,_,_),staff(ID,_,Nome,_)),IDs).

%Identificar Staff que pertence a centro.
% Extensao do predicado staffDeCentro : Utente,IDs -> {V,F}
staffDeCentro(Centro,IDs):-solucoes((ID,Nome),(staff(ID,Centro,Nome,_)),IDs).

%Determina quantas ocorrencias ha de uma vacina numa lista
% Extensao do predicado ocorrenciasVacina : Vacina,Lista,Ocorrencias -> {V,F}
ocorrenciasVacina(_,[],0).
ocorrenciasVacina(X,[X|T],Y):- ocorrenciasVacina(X,T,Z),Y is Z+1.
ocorrenciasVacina(X,[_|T],Z):- ocorrenciasVacina(X,T,Z).


%Transforma uma lista de vacinas numa lista de tuplos
% Extensao do predicado vacinasToTupleList : ListaVacinas,Lista,ListaDeTuplos -> {V,F}
vacinasToTupleList([],_,_).
vacinasToTupleList([H],V,[(H,R)]):-ocorrenciasVacina(H,V,R).
vacinasToTupleList([H|T],V,[(H,R)|L]):-ocorrenciasVacina(H,V,R),vacinasToTupleList(T,V,L).

%Lista todas as vacinas dadas num centro e a quantidade
% Extensao do predicado vacinasPorCentro : Centro,Vacinas -> {V,F}
vacinasPorCentro(Centro,Vacinas):- (solucoes(Vacina,(vacinacao_Covid(Staff,_,_,_,_,Vacina,_),
                                             staff(Staff,Centro,_,_)),R),
                                    removeRepetidos(R,L),vacinasToTupleList(L,R,Vacinas)).

%Determina o numero de vacinas dadas por um staff
% Extensao do predicado numeroVacinasPorStaff : Centro,Vacinas -> {V,F}
numeroVacinasPorStaff(Staff,R) :- solucoes((Staff),vacinacao_Covid(Staff,_,_,_,_,_,_),L),comprimento(L,R).


%Lista todas as vacinas dadas por uma staff e a quantidade
% Extensao do predicado vacinasPorStaff : Centro,Vacinas -> {V,F}
vacinasPorStaff(Staff,Vacinas):- (solucoes(Vacina,(vacinacao_Covid(Staff,_,_,_,_,Vacina,_)),R),
                                    removeRepetidos(R,L),vacinasToTupleList(L,R,Vacinas)).

maiorTuplo( (Z,X), (_,Y), (Z,X) ) :-
    X > Y.
maiorTuplo( (_,X),(W,Y),(W,Y) ) :-
    X =< Y.

maiorTuploLista( [X],X ).
maiorTuploLista( [X|Y],N ) :-
    maiorTuploLista( Y,Z ),
        maiorTuplo( X,Z,N ).

%Determina o Staff que vacinou mais
% Extensao do predicado staffMaisVacinas : (Staff,Quantidade)-> {V,F}
staffMaisVacinas(R) :- solucoes((Staff,N),(staff(Staff,_,_,_), 
					   numeroVacinasPorStaff(Staff,N)), X),
					   maiorTuploLista(X,R).

%Determina o numero de vacinas dadas por unum Centro
% Extensao do predicado numeroVacinasPorCentro : Centro,Vacinas -> {V,F}
numeroVacinasPorCentro(Centro,R) :- solucoes((Vacina),(staff(Staff,Centro,_,_),
					        vacinacao_Covid(Staff,_,_,_,_,Vacina,_)),L),
					        comprimento(L,R).

%Determina o Centro onde se vacinou mais
% Extensao do predicado centroMaisVacinas : (Centro,Quantidade)-> {V,F}
centroMaisVacinas(R) :- solucoes((Centro,N),(centro_saude(Centro,_,_,_,_), 
					     numeroVacinasPorCentro(Centro,N)), X),
					     maiorTuploLista(X,R).

%Determina o numero de utentes num determinado Centro
% Extensao do predicado numeroUtentesCentro : Centro,Quantidade-> {V,F}
numeroUtentesCentro(Centro,R) :- solucoes(ID,utente(ID,_,_,_,_,_,_,_,_,_,_,Centro),X),comprimento(X,R).

%Determina os utentes num determinado Centro
% Extensao do predicado utentesCentro : [(Id,Nome)]-> {V,F}
utentesCentro(Centro,R) :- solucoes((ID,Nome),utente(ID,_,Nome,_,_,_,_,_,_,_,_,Centro),R).

%Identifica as staff que fizerem vacinacao indevida
% Extensao do predicado vacinacaoIndevidaStaff : Ids-> {V,F}
vacinacaoIndevidaStaff(IDs):- solucoes(Staff,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                              vacinacao_Covid(Staff,ID,Dia,Mes,Ano,_,_),
                                              (nao(excecao(vacinacao_Covid(Staff,ID,dia_interdito,mes_interdito,ano_interdito,_,_)))),
                                              (nao(excecao(vacinacao_Covid(Staff,ID,dia_desconhecido,Mes,Ano,_,_)))),
                                              (nao(excecao(vacinacao_Covid(Staff,ID,Dia,mes_desconhecido,Ano,_,_)))),
                                              (nao(excecao(vacinacao_Covid(Staff,ID,Dia,Mes,ano_desconhecido,_,_)))),
                                              (nao(excecao(vacinacao_Covid(Staff,ID,dia_desconhecido,mes_desconhecido,ano_desconhecido,_,_)))),
                                      	      faseUtente(ID,Fase),
                                      	      ((Fase == 1,indevidaFase1(Dia,Mes,Ano));
                                              (Fase == 2,indevidaFase2(Dia,Mes,Ano));
                                              (Fase == 3,indevidaFase3(Dia,Mes,Ano)))),
                                      R),removeRepetidos(R,IDs).

%Identifica os centros onde se fizer vacinacao indevida
% Extensao do predicado vacinacaoIndevidaCentro : Ids-> {V,F}
vacinacaoIndevidaCentro(IDs):- solucoes(Centro,(utente(ID,_,_,_,_,_,_,_,_,_,_,_),
                                                vacinacao_Covid(Staff,ID,Dia,Mes,Ano,_,_),
                                                (nao(excecao(vacinacao_Covid(Staff,ID,dia_interdito,mes_interdito,ano_interdito,_,_)))),
                                                (nao(excecao(vacinacao_Covid(Staff,ID,dia_desconhecido,Mes,Ano,_,_)))),
                                                (nao(excecao(vacinacao_Covid(Staff,ID,Dia,mes_desconhecido,Ano,_,_)))),
                                                (nao(excecao(vacinacao_Covid(Staff,ID,Dia,Mes,ano_desconhecido,_,_)))),
                                                (nao(excecao(vacinacao_Covid(Staff,ID,dia_desconhecido,mes_desconhecido,ano_desconhecido,_,_)))),
                                                staff(Staff,Centro,_,_),
                                      	        faseUtente(ID,Fase),
                                      	        ((Fase == 1,indevidaFase1(Dia,Mes,Ano));
                                                (Fase == 2,indevidaFase2(Dia,Mes,Ano));
                                                (Fase == 3,indevidaFase3(Dia,Mes,Ano)))),
                                        R),removeRepetidos(R,IDs).



% --------------------------------------------------------------------------
% Conhecimento negativo
% --------------------------------------------------------------------------

% Conhecimento negativo por falha

-utente(ID,NSS,Nome,Dia,Mes,Ano,Email,Telefone,Morada,Profissao,Doencas,IDCentro) :-
        nao(utente(ID,NSS,Nome,Dia,Mes,Ano,Email,Telefone,Morada,Profissao,Doencas,IDCentro)) ,
        nao(excecao(utente(ID,NSS,Nome,Dia,Mes,Ano,Email,Telefone,Morada,Profissao,Doencas,IDCentro))).

-centro_saude(ID,Nome,Morada,Telefone,Email) :-
        nao(centro_saude(ID,Nome,Morada,Telefone,Email)),
        nao(excecao(centro_saude(ID,Nome,Morada,Telefone,Email))).

-staff(ID,IDCentro,Nome,Email) :-
        nao(staff(ID,IDCentro,Nome,Email)),
        nao(excecao(staff(ID,IDCentro,Nome,Email))).

-vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,Ano,Vacina,Toma) :-
        nao(vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,Ano,Vacina,Toma)),
        nao(excecao(vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,Ano,Vacina,Toma))).

% Negação forte

% Não sabemos as doenças do Utente mas sabemos que não é só cancro pulmonar 

utente(15,'725-24-8751','Joaquim Oliveira',7,9,1973,'joaquimoliveira@gmail.com',967143682,'Bragança','Construtor Civil',doencas_desconhecidas,5).
-utente(15,'725-24-8751','Joaquim Oliveira',7,9,1973,'joaquimoliveira@gmail.com',967143682,'Bragança','Construtor Civil',['Cancro pulmonar'],5).

% Não sabemos a cidade de onde é o centro de saúde mas sabemos que não é de Braga

centro_saude(9,'CidadeHealth',cidade_desconhecida,257833776,'cidadehealth@gmail.com').
-centro_saude(9,'CidadeHealth','Braga',257833776,'cidadehealth@gmail.com').

% Não sabemos o nome da Staff mas sabemos que não se chama Jorge Miguel

staff(11,7,nome_desconhecido,'staffmitica@gmail.com').
-staff(11,7,'Jorge Miguel','staffmitica@gmail.com').

% Não sabemos a vacinação que foi atribuída mas sabemos que a vacina administrada não foi a Pfizer

vacinacao_Covid(2,15,17,10,2020,vacina_desconhecida,1).
-vacinacao_Covid(2,15,17,10,2020,'Pfizer',1).



% --------------------------------------------------------------------------
% Conhecimento interdito
% --------------------------------------------------------------------------

% Utente com Número de Segurança Social interdito

utente(16,nss_interdito,'Rodrigo Perez',19,11,1968,'perezrodrigogmail.com',973465124,'Évora','Juiz',['Escorbuto','Lepra'],7).
excecao(utente(ID,_,N,Dia,Mes,A,E,T,M,P,D,IDCentro)) :- utente(ID,nss_interdito,N,Dia,Mes,A,E,T,M,P,D,IDCentro).
nulo(nss_interdito).
+utente(16,nss_interdito,'Rodrigo Perez',19,11,1968,'perezrodrigogmail.com',973465124,'Évora','Juiz',['Escorbuto','Lepra'],7) :: 
                            (solucoes(NSS, (utente(21,NSS,'Rodrigo Perez',19,11,1968,'perezrodrigogmail.com',973465124,'Évora','Juiz',['Escorbuto','Lepra'],7),
                            nao(nulo(NSS))),S),
                            comprimento(S,N),
                            N == 0).

% Utente com data de nascimento interdita

utente(17,'768-43-1609','Paulo Jorge',dia_interdito,mes_interdito,ano_interdito,'paulojorge@gmail.com',983143776,'Lisboa','Taxista',[],6).
excecao(utente(ID,NSS,N,_,_,_,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,dia_interdito,mes_interdito,ano_interdito,E,T,M,P,D,IDCentro).
nulo(dia_interdito).
nulo(mes_interdito).
nulo(ano_interdito).
+utente(17,'768-43-1609','Paulo Jorge',dia_interdito,mes_interdito,ano_interdito,'paulojorge@gmail.com',983143776,'Lisboa','Taxista',[],6) :: 
                            (solucoes((Dia,Mes,Ano), (utente(17,'768-43-1609','Paulo Jorge',Dia,Mes,Ano,'paulojorge@gmail.com',983143776,'Lisboa','Taxista',[],6),
                            nao(nulo(Dia)),nao(nulo(Mes)),nao(nulo(Ano))),S),
                            comprimento(S,N),
                            N == 0).

% Staff com email interdito

staff(12,7,'Pedro Pereira',email_interdito).
excecao(staff(ID,IDCentro,N,_)) :- staff(ID,IDCentro,N,email_interdito).
nulo(email_interdito).
+staff(12,7,'Pedro Pereira',email_interdito) :: 
                            (solucoes(Email, (staff(12,7,'Pedro Pereira',Email),
                            nao(nulo(Email))),S),
                            comprimento(S,N),
                            N == 0).

%Vacinação com data interdita

vacinacao_Covid(4,17,dia_interdito,mes_interdito,ano_interdito,'AstraZeneca',1).
excecao(vacinacao_Covid(IDStaff,IDUtente,_,_,_,V,T)) :- vacinacao_Covid(IDStaff,IDUtente,dia_interdito,mes_interdito,ano_interdito,V,T).
+vacinacao_Covid(4,17,dia_interdito,mes_interdito,ano_interdito,'AstraZeneca',1) ::
                            (solucoes((Dia,Mes,Ano), (vacinacao_Covid(4,17,Dia,Mes,Ano,'AstraZeneca',1),
                            nao(nulo(Dia)),nao(nulo(Mes)),nao(nulo(Ano))),S),
                            comprimento(S,N),
                            N == 0).



% --------------------------------------------------------------------------
% Conhecimento impreciso
% --------------------------------------------------------------------------

% Um utente pode ter dois números de telemóvel e dois emails

utente(18,'714-32-889','José Antunes',7,7,1983,{'joseantunes@gmail.com','joseantunesalternativo@gmail.com'},{975442145,923477893},'Aveiro','Detetive',['Sífilis'],2).
excecao(utente(18,'714-32-889','José Antunes',7,7,1983,'joseantunes@gmail.com',975442145,'Aveiro','Detetive',['Sífilis'],2)).
excecao(utente(18,'714-32-889','José Antunes',7,7,1983,'joseantunes@gmail.com',923477893,'Aveiro','Detetive',['Sífilis'],2)).
excecao(utente(18,'714-32-889','José Antunes',7,7,1983,'joseantunesalternativo@gmail.com',923477893,'Aveiro','Detetive',['Sífilis'],2)).
excecao(utente(18,'714-32-889','José Antunes',7,7,1983,'joseantunesalternativo@gmail.com',975442145,'Aveiro','Detetive',['Sífilis'],2)).

% Um centro de saúde pode ter dois números de telemóvel e dois emails

centro_saude(10,'GuardaSaudável','Guarda',{277845667,225625773},{'guardasaudável@gmail.com','guardasaudável2@gmail.com'}).
excecao(centro_saude(10,'GuardaSaudável','Guarda',277845667,'guardasaudável@gmail.com')).
excecao(centro_saude(10,'GuardaSaudável','Guarda',225625773,'guardasaudável@gmail.com')).
excecao(centro_saude(10,'GuardaSaudável','Guarda',277845667,'guardasaudável2@gmail.com')).
excecao(centro_saude(10,'GuardaSaudável','Guarda',225625773,'guardasaudável2@gmail.com')).

% Uma staff pode ter dois emails

staff(13,6,'Alexandre Costa',{'alexandrecosta@gmail.com','alexandrecosta2@gmail.com'}).
excecao(staff(13,6,'Alexandre Costa','alexandrecosta@gmail.com')).
excecao(staff(13,6,'Alexandre Costa','alexandrecosta2@gmail.com')).

% Uma vacinação pode ter ocorrido em dois dias diferentes (dia 10 e dia 15 por exemplo)

vacinacao_Covid(5,16,{10,15},10,2021,'AstraZeneca',1).
excecao(vacinacao_Covid(5,16,10,10,2021,'AstraZeneca',1)).
excecao(vacinacao_Covid(5,16,15,10,2021,'AstraZeneca',1)).



% --------------------------------------------------------------------------
% Conhecimento incerto
% --------------------------------------------------------------------------

% --------------Utentes--------------------

% Numero de Segurança Social desconhecido
excecao(utente(ID,_,N,Dia,Mes,A,E,T,M,P,D,IDCentro)) :- utente(ID,nss_desconhecido,N,Dia,Mes,A,E,T,M,P,D,IDCentro).

% Nome desconhecido
excecao(utente(ID,NSS,_,Dia,Mes,A,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,nome_desconhecido,Dia,Mes,A,E,T,M,P,D,IDCentro).

% Dia da Data de nascimento desconhecido
excecao(utente(ID,NSS,N,_,Mes,A,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,dia_desconhecido,Mes,A,E,T,M,P,D,IDCentro).

% Mês da Data de nascimento desconhecido
excecao(utente(ID,NSS,N,Dia,_,A,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,Dia,mes_desconhecido,A,E,T,M,P,D,IDCentro).

% Ano da Data de nascimento desconhecido
excecao(utente(ID,NSS,N,Dia,Mes,_,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,ano_desconhecido,E,T,M,P,D,IDCentro).

% Email desconhecido
excecao(utente(ID,NSS,N,Dia,Mes,A,_,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,A,email_desconhecido,T,M,P,D,IDCentro).

% Telemovel desconhecido
excecao(utente(ID,NSS,N,Dia,Mes,A,E,_,M,P,D,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,A,E,tele_desconhecido,M,P,D,IDCentro).

% Morada desconhecida
excecao(utente(ID,NSS,N,Dia,Mes,A,E,T,_,P,D,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,A,E,T,morada_desconhecida,P,D,IDCentro).

% Profissão desconhecida
excecao(utente(ID,NSS,N,Dia,Mes,A,E,T,M,_,D,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,A,E,T,M,p_desconhecida,D,IDCentro).

% Doenças desconhecidas
excecao(utente(ID,NSS,N,Dia,Mes,A,E,T,M,P,_,IDCentro)) :- utente(ID,NSS,N,Dia,Mes,A,E,T,M,P,doencas_desconhecidas,IDCentro).

% Data de nascimento desconhecida
excecao(utente(ID,NSS,N,_,_,_,E,T,M,P,D,IDCentro)) :- utente(ID,NSS,N,dia_desconhecido,mes_desconhecido,ano_desconhecido,E,T,M,P,D,IDCentro).


% --------------Centro de Saúde---------------

% Nome desconhecido
excecao(centro_saude(ID,_,Morada,Telefone,Email)) :- centro_saude(ID,nome_desconhecido,Morada,Telefone,Email).

% Morada desconhecida
excecao(centro_saude(ID,Nome,_,Telefone,Email)) :- centro_saude(ID,Nome,morada_desconhecida,Telefone,Email).

% Telefone desconhecido
excecao(centro_saude(ID,Nome,Morada,_,Email)) :- centro_saude(ID,Nome,Morada,tele_desconhecido,Email).

% Email desconhecido
excecao(centro_saude(ID,Nome,Morada,Telefone,_)) :- centro_saude(ID,Nome,Morada,Telefone,email_desconhecido).


% ------------------Staff--------------------

% Nome desconhecido
excecao(staff(ID,IDCentro,_,Email)) :- staff(ID,IDCentro,nome_desconhecido,Email).

% Email desconhecido
excecao(staff(ID,IDCentro,Nome,_)) :- staff(ID,IDCentro,Nome,email_desconhecido).


% ----------------Vacinação Covid-------------

% Dia desconhecido
excecao(vacinacao_Covid(IDStaff,IDUtente,_,Mes,Ano,Vacina,Toma)) :- vacinacao_Covid(IDStaff,IDUtente,dia_desconhecido,Mes,Ano,Vacina,Toma).

% Mês desconhecido
excecao(vacinacao_Covid(IDStaff,IDUtente,Dia,_,Ano,Vacina,Toma)) :- vacinacao_Covid(IDStaff,IDUtente,Dia,mes_desconhecido,Ano,Vacina,Toma).

% Ano desconhecido
excecao(vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,_,Vacina,Toma)) :- vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,ano_desconhecido,Vacina,Toma).

% Vacina desconhecida
excecao(vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,Ano,_,Toma)) :- vacinacao_Covid(IDStaff,IDUtente,Dia,Mes,Ano,vacina_desconhecida,Toma).

% Data desconhecida
excecao(vacinacao_Covid(IDStaff,IDUtente,_,_,_,Vacina,Toma)) :- vacinacao_Covid(IDStaff,IDUtente,dia_desconhecido,mes_desconhecido,ano_desconhecido,Vacina,Toma).
