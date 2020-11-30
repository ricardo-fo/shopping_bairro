CREATE TABLE denuncia_comentario_produto (
  cd_denuncia_comentario_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_comentario_produto INT NOT NULL FOREIGN KEY REFERENCES comentario_produto(cd_comentario_produto),
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(cd_cliente),
  ds_titulo VARCHAR(100),
  ds_mensangem VARCHAR(500),
  ic_ativo BIT NOT NULL DEFAULT 1,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
