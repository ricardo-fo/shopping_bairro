CREATE TABLE shopping_bairro.dbo.estoque (
  cd_estoque INT NOT NULL PRIMARY KEY IDENTITY,
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES dbo.produto(cd_produto),
  ic_reposicao VARCHAR(6),
  qt_produto INT NOT NULL DEFAULT 1
);
