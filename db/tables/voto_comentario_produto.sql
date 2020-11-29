CREATE TABLE shopping_bairro.dbo.voto_comentario_produto (
  cd_voto_comentario_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_comentario_produto INT NOT NULL FOREIGN KEY REFERENCES dbo.comentario_produto(cd_comentario_produto),
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES dbo.cliente(cd_cliente),
  ic_positivo BIT DEFAULT 1
);
