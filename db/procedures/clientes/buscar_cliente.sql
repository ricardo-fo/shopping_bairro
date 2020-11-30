CREATE PROCEDURE dbo.pr_buscar_cliente (
  @cd_cliente INT = NULL,
  @cd_email VARCHAR(30) = NULL,
  @nm_cliente VARCHAR(40) = NULL,
  @nm_sobrenome VARCHAR(40) = NULL
)

AS

IF @cd_cliente IS NULL AND @cd_email IS NULL AND @nm_cliente IS NULL AND @nm_sobrenome IS NULL
BEGIN
  SELECT
    0 success,
    'É preciso informar ao menos um argumento.' msg
  RETURN 1;
END

SELECT
  TOP 1
  c.cd_cliente,
  c.cd_email,
  c.nm_cliente,
  c.nm_sobrenome,
  c.cd_senha,
  c.cd_celular,
  c.cd_ddd_celular,
  c.cd_cep,
  es.nm_estado,
  ci.nm_cidade,
  c.cd_bairro,
  c.ds_logradouro,
  c.ic_concorda_termos,
  c.ic_ativo,
  c.ic_situacao_analise,
  CONVERT(VARCHAR(10), c.dt_created_at, 103) AS dt_created_at,
  CONVERT(VARCHAR(10), c.dt_updated_at, 103) AS dt_updated_at
FROM
  dbo.cliente c
LEFT JOIN dbo.estado es ON es.cd_estado = c.cd_estado
LEFT JOIN dbo.cidade ci ON ci.cd_cidade = c.cd_cidade
WHERE
  (c.cd_cliente = @cd_cliente OR @cd_cliente IS NULL)
  AND (c.cd_email = LOWER(TRIM(@cd_email)) OR @cd_email IS NULL)
  AND (c.nm_cliente LIKE CONCAT('%', LOWER(TRIM(@nm_cliente)), '%') OR @nm_cliente IS NULL)
  AND (c.nm_sobrenome LIKE CONCAT('%', LOWER(TRIM(@nm_sobrenome)), '%') OR @nm_sobrenome IS NULL);
