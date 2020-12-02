EXEC pr_inserir_entregador
  @cd_email = 'teste@bol.com',
  @nm_entregador = 'Rodrigo',
  @nm_sobrenome = 'Suarez Moreira',
  @cd_senha = 'teste123',
  @cd_celular = '998776713',
  @cd_ddd_celular = '13',
  @cd_cep = '11111111',
  @ds_logradouro = 'Minha rua',
  @cd_estado = 1,
  @cd_cidade = 1,
  @nm_bairro = 'Meu bairro 1',
  @nm_bairro_operacao = 'Meu bairro 1',
  @ic_concorda_termos = 1;


EXEC pr_inserir_entregador
  @cd_email = 'entregador_01@email.com',
  @nm_entregador = 'Entregador',
  @nm_sobrenome = 'Silva',
  @cd_senha = '123456789',
  @cd_celular = '999999999',
  @cd_ddd_celular = '13',
  @cd_cep = '11111111',
  @ds_logradouro = 'Minha rua',
  @cd_estado = 1,
  @cd_cidade = 2,
  @nm_bairro = 'Meu bairro 2',
  @nm_bairro_operacao = 'Meu bairro 2',
  @ic_concorda_termos = 1;

EXEC pr_inserir_entregador
  @cd_email = 'entregador_02@email.com',
  @nm_entregador = 'Entregador',
  @nm_sobrenome = 'Pereira',
  @cd_senha = 'abcdefghi',
  @cd_celular = '999999999',
  @cd_ddd_celular = '13',
  @cd_cep = '22222222',
  @ds_logradouro = 'Minha rua',
  @cd_estado = 1,
  @cd_cidade = 1,
  @nm_bairro = 'Meu bairro 3',
  @nm_bairro_operacao = 'Meu bairro 3',
  @ic_concorda_termos = 1;