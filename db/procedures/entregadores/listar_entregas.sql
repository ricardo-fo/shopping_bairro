/**
 * Description: Lista as entregas de um determinado entregador.
 */
CREATE PROCEDURE dbo.pr_listar_entregas (
  @cd_entregador INT,
  @dt_inicio_entrega VARCHAR(10) = NULL,
  @dt_fim_entrega VARCHAR(10) = NULL,
  @ic_situacao_entrega VARCHAR(20) = NULL,
  @qt_km_distancia_entrega INT = NULL,
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

-- Sanitização da data de início da entrega, buscando a menor data
IF @dt_inicio_entrega IS NULL
BEGIN
  SELECT
    TOP 1
    @dt_inicio_entrega = CONVERT(VARCHAR(10), e.dt_inicio_entrega, 103)
  FROM
    dbo.entrega e
  WHERE
    e.cd_entregador = @cd_entregador
  ORDER BY
    e.dt_inicio_entrega ASC;
END

-- Sanitização da data de fim da entrega, buscando a maior data
IF @dt_fim_entrega IS NULL
BEGIN
  SELECT
    TOP 1
    @dt_fim_entrega = CONVERT(VARCHAR(10), e.dt_fim_entrega, 103)
  FROM
    dbo.entrega e
  WHERE
    e.cd_entregador = @cd_entregador
  ORDER BY
    e.dt_fim_entrega DESC;
END

SELECT
  e.cd_entregador,
  e.nm_entregador,
  e.cd_email,
  e.ic_ativo,
  ee.cd_entrega,
  CONVERT(VARCHAR(10), ee.dt_inicio_entrega, 103) AS dt_inicio_entrega,
  CONVERT(VARCHAR(10), ee.dt_fim_entrega, 103) AS dt_fim_entrega,
  ee.ic_situacao_entrega,
  ee.qt_km_distancia_entrega
FROM
  dbo.entregador e
LEFT JOIN dbo.entrega ee ON ee.cd_entregador = e.cd_entregador
WHERE
  e.cd_entregador = @cd_entregador
  AND (ee.dt_inicio_entrega BETWEEN CONVERT(DATE, @dt_inicio_entrega, 103) AND CONVERT(DATE, @dt_fim_entrega, 103))
  AND (ee.ic_situacao_entrega = @ic_situacao_entrega OR @ic_situacao_entrega IS NULL)
  AND (ee.qt_km_distancia_entrega = @qt_km_distancia_entrega OR @qt_km_distancia_entrega IS NULL)
ORDER BY
  ee.dt_inicio_entrega ASC
OFFSET @page * @per_page ROWS
FETCH NEXT @per_page ROWS ONLY;
