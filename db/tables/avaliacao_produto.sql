CREATE TABLE shopping_bairro.dbo.avaliacao_produto (
  cd_avaliacao_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES dbo.cliente(cd_cliente),
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES dbo.produto(cd_produto),
  qt_nota INT NOT NULL
);
