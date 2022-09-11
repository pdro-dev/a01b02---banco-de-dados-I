SELECT
	cat.CategoriaNome,
    prod.*
FROM categorias as cat
LEFT JOIN produtos as prod
	ON cat.CategoriaID = prod.CategoriaID


