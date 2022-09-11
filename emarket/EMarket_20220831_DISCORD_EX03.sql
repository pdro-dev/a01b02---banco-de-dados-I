#20220831 DISCORD EX03
SELECT
	MONTHNAME(DataNascimento) AS 'Mês',
    COUNT(EmpregadoID) AS 'Qtd_Aniversariantes'
FROM empregados
GROUP BY Mês
ORDER BY MONTH(DataNascimento)
