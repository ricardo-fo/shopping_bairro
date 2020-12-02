/**
 * Description: Lista os produtos de uma loja.
 */
CREATE PROCEDURE pr_listar_produtos (
  @cd_loja INT,
  @ds_titulo VARCHAR(100) = NULL,
  @ds_resumo VARCHAR(500) = NULL,
  @vl_produto_centavo BIGINT = NULL,
  @ic_ativo BIT = NULL,
  @sort_order VARCHAR(4) = NULL,
  @sort_column VARCHAR(10) = NULL,
  @per_page INT = NULL,
  @page INT = NULL
)

AS

-- Sanitização da quantidade de resultados por páginas
IF @per_page IS NULL OR @per_page <= 0 OR @per_page > 20
  SET @per_page = 10;

-- Sanitização da página
IF @page IS NULL OR @page < 0
  SET @page = 0;

-- Sanitização do estado de ativação do produto
IF @ic_ativo IS NULL
  SET @ic_ativo = 1;

SELECT
  *
FROM
  dbo.produto p
WHERE
  p.cd_loja = @cd_loja
  AND p.ic_ativo = @ic_ativo
ORDER BY
  CASE WHEN @sort_order <> 'ASC' THEN 0 END ASC,
  CASE WHEN @sort_column = 'id' THEN p.cd_produto END ASC,
  CASE WHEN @sort_order <> 'ASC' THEN '' END ASC,
  CASE WHEN @sort_column = 'titulo' THEN p.ds_titulo END ASC,
  CASE WHEN @sort_order <> 'DESC' THEN 0 END DESC,
  CASE WHEN @sort_order <> 'DESC' THEN '' END DESC
  OFFSET @page * @per_page ROWS
FETCH NEXT @per_page ROWS ONLY;
