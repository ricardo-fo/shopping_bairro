EXEC dbo.pr_inserir_cliente
  @cd_email = 'ricardo@email.com',
  @nm_cliente = 'Ricardo',
  @nm_sobrenome = 'Oliveira',
  @cd_senha = '123456789',
  @cd_celular = '974137872',
  @cd_ddd_celular = '13',
  @cd_cep = '11432150',
  @cd_estado = 1,
  @cd_cidade = 1,
  @nm_bairro = 'Jardim dos Pássaros',
  @ds_logradouro = 'Rua Rouxinol',
  @ic_concorda_termos = 1;

EXEC dbo.pr_inserir_cliente
  @cd_email = 'teste@bol.com.br',
  @nm_cliente = 'Rodrigo',
  @nm_sobrenome = 'Suarez Moreira',
  @cd_senha = 'teste123',
  @cd_celular = '997376713',
  @cd_ddd_celular = '13',
  @cd_cep = '11111111',
  @cd_estado = 1,
  @cd_cidade = 1,
  @nm_bairro = 'Meu bairro',
  @ds_logradouro = 'Minha rua',
  @ic_concorda_termos = 1;

EXEC dbo.pr_inserir_cliente
  @cd_email = 'user_01@email.com',
  @nm_cliente = 'User',
  @nm_sobrenome = 'Silva',
  @cd_senha = 'abcdefghi',
  @cd_celular = '999999999',
  @cd_ddd_celular = '13',
  @cd_cep = '22222222',
  @cd_estado = 1,
  @cd_cidade = 1,
  @nm_bairro = 'Meu bairro 2',
  @ds_logradouro = 'Minha rua 2',
  @ic_concorda_termos = 1;
