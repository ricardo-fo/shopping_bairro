CREATE TABLE shopping_bairro.dbo.produto (
  cd_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_loja INT NOT NULL FOREIGN KEY REFERENCES dbo.loja(cd_loja),
  ds_titulo VARCHAR(100),
  ds_resumo VARCHAR(500),
  vl_produto_centavo BIGINT,
  cd_foto_produto VARCHAR(50)
  ic_ativo BIT DEFAULT 1,
  ic_concorda_termos BIT DEFAULT 1,
  cd_produto_gateway VARCHAR(30),
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
