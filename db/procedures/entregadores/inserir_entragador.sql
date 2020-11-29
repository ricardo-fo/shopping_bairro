CREATE PROCEDURE shopping_bairro.dbo.pr_inserir_entregador (
  @cd_email VARCHAR(30),
  @nm_entregador VARCHAR(40),
  @nm_sobrenome VARCHAR(40),
  @cd_senha VARCHAR(30),
  @cd_celular VARCHAR(9),
  @cd_ddd_celular VARCHAR(2),
  @cd_cep VARCHAR(8),
  @ds_logradouro VARCHAR(30),
  @cd_estado INT,
  @cd_cidade INT,
  @nm_bairro VARCHAR(50),
  @nm_bairro_operacao VARCHAR(50),
  @ic_concorda_termos BIT
)

AS

-- Validação dos termos de uso
IF @ic_concorda_termos <> 1
BEGIN
  SELECT
    0 success,
    'É preciso concordar com os termos de uso.' msg
  RETURN;
END

-- Validação do e-mail
DECLARE @existe_email BIT;
SELECT
  @existe_email = 1
FROM
  shopping_bairro.dbo.entregador e
WHERE
  e.cd_email = LOWER(TRIM(@cd_email));

IF @existe_email = 1
BEGIN
  SELECT
    0 success,
    'O e-mail informado já está em uso.' msg,
  RETURN;
END

-- Sanitização do nome do entregador
IF LOWER(TRIM(@nm_entregador)) = ''
BEGIN
  SELECT
    0 success,
    'O nome do entregador não pode ser nulo.' msg
  RETURN;
END

-- Sanitização do sobrenome do entregador
IF LOWER(TRIM(@nm_sobrenome)) = ''
BEGIN
  SELECT
    0 success,
    'O sobrenome do entregador não pode ser nulo.' msg
  RETURN;
END

-- Validação do ID do estado
DECLARE @existe_estado BIT;
SELECT
  @existe_estado = 1
FROM
  shopping_bairro.dbo.estado e
WHERE
  e.cd_estado = @cd_estado;

IF @existe_estado IS NULL
BEGIN
  SELECT
    0 success,
    'Estado não encontrado.' msg
  RETURN;
END

-- Validação do ID da cidade
DECLARE @existe_cidade BIT;
SELECT
  @existe_cidade = 1
FROM
  shopping_bairro.dbo.cidade c
WHERE
  e.cd_cidade = @cd_cidade;

IF @existe_cidade IS NULL
BEGIN
  SELECT
    0 success,
    'Cidade não encontrada.' msg
  RETURN;
END

-- Validação do bairro
DECLARE @cd_bairro INT;
SELECT
  @cd_bairro = b.cd_bairro
FROM
  shopping_bairro.dbo.bairro b
WHERE
  b.nm_bairro = LOWER(TRIM(@nm_bairro));

-- Se o bairro não estiver registrado, ele é criado
IF @cd_bairro IS NULL
BEGIN
  INSERT INTO shopping_bairro.dbo.bairro (nm_bairro) VALUES (LOWER(TRIM(@nm_bairro)));

  SELECT
    @cd_bairro = b.cd_bairro
  FROM
    shopping_bairro.dbo.bairro b
  WHERE
    b.nm_bairro = LOWER(TRIM(@nm_bairro));
END

-- Validação do bairro de operação
DECLARE @cd_bairro_operacao INT;
SELECT
  @cd_bairro_operacao = b.cd_bairro
FROM
  shopping_bairro.dbo.bairro b
WHERE
  b.nm_bairro = LOWER(TRIM(@nm_bairro_operacao));

-- Se o bairro não estiver registrado, ele é criado
IF @cd_bairro_operacao IS NULL
BEGIN
  INSERT INTO shopping_bairro.dbo.bairro (nm_bairro) VALUES (LOWER(TRIM(@nm_bairro_operacao)));

  SELECT
    @cd_bairro_operacao = b.cd_bairro
  FROM
    shopping_bairro.dbo.bairro b
  WHERE
    b.nm_bairro = LOWER(TRIM(@nm_bairro_operacao));
END

-- Criptografia da senha
DECLARE @token_senha VARCHAR(100) = PWDENCRYPT(@cd_senha);

INSERT INTO shopping_bairro.dbo.entregador (
  cd_email,
  nm_entregador,
  nm_sobrenome,
  cd_senha,
  cd_celular,
  cd_ddd_celular,
  cd_cep,
  cd_estado,
  cd_cidade,
  cd_bairro,
  cd_bairro_operacao,
  ds_logradouro,
  ic_concorda_termos
) VALUES (
  LOWER(TRIM(@cd_email)),
  LOWER(TRIM(@nm_entregador)),
  LOWER(TRIM(@nm_sobrenome)),
  @token_senha,
  @cd_celular,
  @cd_ddd_celular,
  @cd_cep,
  @cd_estado,
  @cd_cidade,
  @cd_bairro,
  @cd_bairro_operacao,
  LOWER(TRIM(@ds_logradouro)),
  @ic_concorda_termos
);

SELECT
  1 success,
  'Entregador inserido com sucesso.' msg;
