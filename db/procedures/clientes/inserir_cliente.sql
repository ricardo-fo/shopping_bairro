CREATE PROCEDURE pr_inserir_cliente (
  @cd_email VARCHAR(30),
  @nm_cliente VARCHAR(40),
  @nm_sobrenome VARCHAR(40),
  @cd_senha VARCHAR(30),
  @cd_celular VARCHAR(9),
  @cd_ddd_celular VARCHAR(2),
  @cd_cep VARCHAR(2),
  @cd_estado INT,
  @cd_cidade INT,
  @nm_bairro VARCHAR(50),
  @ds_logradouro VARCHAR(30),
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
  cliente c
WHERE
  c.cd_email = LOWER(TRIM(@cd_email));

IF @existe_email = 1
BEGIN
  SELECT
    0 success,
    'O e-mail informado já está em uso.' msg
END

-- Sanitização do nome do cliente
IF LOWER(TRIM(@nm_cliente)) = ''
BEGIN
  SELECT
    0 success,
    'O nome do cliente não pode ser nulo.' msg
  RETURN;
END

-- Sanitização do sobrenome do cliente
IF LOWER(TRIM(@nm_sobrenome)) = ''
BEGIN
  SELECT
    0 success,
    'O sobrenome do cliente não pode ser nulo.' msg
  RETURN;
END

-- Validação do ID do estado
DECLARE @existe_estado BIT;
SELECT
  @existe_estado = 1
FROM
  estado e
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
  cidade c
WHERE
  c.cd_cidade = @cd_cidade;

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
  bairro b
WHERE
  b.nm_bairro = LOWER(TRIM(@nm_bairro));

-- Se o bairro não estiver registrado, ele é criado
IF @cd_bairro IS NULL
BEGIN
  INSERT INTO bairro (nm_bairro) VALUES (LOWER(TRIM(@nm_bairro)));

  SELECT
    @cd_bairro = b.cd_bairro
  FROM
    bairro b
  WHERE
    b.nm_bairro = LOWER(TRIM(@nm_bairro));
END

-- Criptografia da senha
DECLARE @token_senha VARCHAR(100) = PWDENCRYPT(@cd_senha);

-- Inserção do novo cliente
INSERT INTO cliente (
  cd_email,
  nm_cliente,
  nm_sobrenome,
  cd_senha,
  cd_celular,
  cd_ddd_celular,
  cd_cep,
  cd_estado,
  cd_cidade,
  cd_bairro,
  ds_logradouro,
  ic_concorda_termos
) VALUES (
  LOWER(TRIM(@cd_email)),
  LOWER(TRIM(@nm_cliente)),
  LOWER(TRIM(@nm_sobrenome)),
  @token_senha,
  @cd_celular,
  @cd_ddd_celular,
  @cd_cep,
  @cd_estado,
  @cd_cidade,
  @cd_bairro,
  LOWER(TRIM(@ds_logradouro)),
  @ic_concorda_termos
);

SELECT
  1 success,
  'Cliente inserido com sucesso.' msg;
