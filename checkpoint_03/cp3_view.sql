/*
4. Crie uma view que contemple os principais dados do banco, de forma que qualquer usuário possa manipular os dados apenas pela view criada
*/

-- View para mostrar dados de funcionarios, pedidos e estoque de itens

CREATE VIEW vw_dadosFuncionarios AS
SELECT
f.funcionarioId AS 'ID Funcionario',
CONCAT(f.nome, ' ', f.sobrenome) AS 'Nome Completo',
f.cargo AS 'Cargo',
-- datas 
f.dataContrat AS 'Data Contratação',
f.dataNasc AS 'Data Nascimento'
FROM funcionarios f;



-- testando view

SELECT * FROM vw_dadosFuncionarios;
