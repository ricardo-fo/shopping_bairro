CREATE TABLE comentario_produto (
  cd_comentario_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(cd_cliente),
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES produto(cd_produto),
  ds_titulo VARCHAR(100),
  ic_ativo BIT NOT NULL DEFAULT 1,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
