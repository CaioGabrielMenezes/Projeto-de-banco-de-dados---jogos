SELECT 
jogo.nome AS nome_jogo,
jogo.ano_lancamento,
dlc.nome AS nome_dlc
FROM jogo
INNER JOIN dlc ON jogo.id_jogo = dlc.id_jogo;

SELECT 
jogo.nome AS nome_jogo,
desenvolvedora.nome AS nome_desenvolvedora,
jogo.ano_lancamento
FROM jogo
INNER JOIN desenvolvedora ON jogo.id_desenvolvedora = desenvolvedora.id_desenvolvedora;
