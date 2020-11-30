CREATE PROCEDURE dbo.pr_buscar_vendedor (
  @cd_vendedor INT,
  @cd_email VARCHAR(30) = NULL,
  @nm_vendedor VARCHAR(40) = NULL,
  @nm_sobrenome VARCHAR(40) = NULL
)

AS

IF @cd_vendedor IS NULL AND @cd_email IS NULL AND @nm_vendedor IS NULL AND @nm_sobrenome IS NULL
BEGIN
  SELECT
    0 success,
    'É preciso informar ao menos um argumento.' msg
  RETURN 1;
END

SELECT
  TOP 1
  v.cd_vendedor,
  v.cd_email,
  v.nm_vendedor,
  v.nm_sobrenome,
  v.cd_celular,
  v.cd_ddd_celular,
  v.cd_cep,
  es.nm_estado,
  ci.nm_cidade,
  v.cd_bairro,
  v.ds_logradoura,
  v.ic_concorda_termos,
  v.ic_ativo,
  CONVERT(VARCHAR(10), v.dt_created_at, 103) AS dt_created_at,
  CONVERT(VARCHAR(10), v.dt_updated_at, 103) AS dt_updated_at
FROM
  dbo.vendedor v
LEFT JOIN dbo.estado es ON es.cd_estado = v.cd_estado
LEFT JOIN dbo.cidade ci ON ci.cd_cidade = v.cd_cidade
WHERE
  (v.cd_vendedor = @cd_vendedor OR @cd_vendedor IS NULL)
  AND (v.cd_email = LOWER(TRIM(@cd_email)) OR @cd_email IS NULL)
  AND (v.nm_vendedor LIKE CONCAT('%', LOWER(TRIM(@nm_vendedor)), '%') OR @nm_vendedor IS NULL)
  AND (v.nm_sobrenome LIKE CONCAT('%', LOWER(TRIM(@nm_sobrenome)), '%') OR @nm_sobrenome IS NULL);
