EXEC dbo.pr_inserir_vendedor
  @cd_email = 'teste@bol.com.br',
  @nm_vendedor = 'Rodrigo',
  @nm_sobrenome = 'Suarez Moreira',
  @cd_senha = 'teste123',
  @cd_celular = '998776713',
  @cd_ddd_celular = '13',
  @cd_cep = '12345678',
  @cd_estado = 1,
  @cd_cidade = 3,
  @nm_bairro = 'Meu bairro 5',
  @ds_logradoura = 'Minha avenida 1',
  @ic_concorda_termos 1;

EXEC dbo.pr_inserir_vendedor
  @cd_email = 'vendedor_01@email.com',
  @nm_vendedor = 'Vendedor',
  @nm_sobrenome = 'Silva',
  @cd_senha = '123456789',
  @cd_celular = '998776712',
  @cd_ddd_celular = '13',
  @cd_cep = '12345679',
  @cd_estado = 1,
  @cd_cidade = 4,
  @nm_bairro = 'Meu bairro 6',
  @ds_logradoura = 'Minha avenida 2',
  @ic_concorda_termos 1;

EXEC dbo.pr_inserir_vendedor
  @cd_email = 'vendedor_02@email.com',
  @nm_vendedor = 'Vendedor',
  @nm_sobrenome = 'Pereira',
  @cd_senha = '123123123',
  @cd_celular = '989898989',
  @cd_ddd_celular = '11',
  @cd_cep = '12345673',
  @cd_estado = 2,
  @cd_cidade = 4,
  @nm_bairro = 'Meu bairro 4',
  @ds_logradoura = 'Minha avenida 3',
  @ic_concorda_termos 1;
