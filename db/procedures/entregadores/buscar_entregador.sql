CREATE PROCEDURE pr_buscar_entregador (
  @cd_entregador INT = NULL,
  @cd_email VARCHAR(30) = NULL,
  @nm_entregador VARCHAR(40) = NULL,
  @nm_sobrenome VARCHAR(40) = NULL
)

AS

IF @cd_entregador IS NULL AND @cd_email IS NULL AND @nm_entregador IS NULL AND @nm_sobrenome IS NULL
BEGIN
  SELECT
    0 success,
    'É preciso informar ao menos um argumento.' msg
  RETURN 1;
END

SELECT
  TOP 1
  e.cd_entregador,
  e.cd_email,
  e.nm_entregador,
  e.nm_sobrenome,
  e.cd_celular,
  e.cd_ddd_celular,
  e.cd_cep,
  e.ds_logradouro,
  es.nm_estado,
  ci.nm_cidade,
  e.cd_bairro,
  e.cd_bairro_operacao,
  e.ic_concorda_termos,
  e.ic_ativo,
  e.ic_situacao_analise,
  CONVERT(VARCHAR(10), e.dt_created_at, 103) AS dt_created_at,
  CONVERT(VARCHAR(10), e.dt_updated_at, 103) AS dt_updated_at
FROM
  dbo.entregador e
LEFT JOIN dbo.estado es ON es.cd_estado = e.cd_estado
LEFT JOIN dbo.cidade ci ON ci.cd_cidade = e.cd_cidade
WHERE
  (e.cd_entregador = @cd_entregador OR @cd_entregador IS NULL)
  AND (e.cd_email = LOWER(TRIM(@cd_email)) OR @cd_email IS NULL)
  AND (e.nm_entregador LIKE CONCAT('%', LOWER(TRIM(@nm_entregador)), '%') OR @nm_entregador IS NULL)
  AND (e.nm_sobrenome LIKE CONCAT('%', LOWER(TRIM(@nm_sobrenome)), '%') OR @nm_sobrenome IS NULL);
