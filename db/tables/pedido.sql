CREATE TABLE pedido (
  cd_pedido INT NOT NULL PRIMARY KEY IDENTITY,
  cd_loja INT NOT NULL FOREIGN KEY REFERENCES loja(cd_loja),
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(cd_cliente),
  cd_entrega INT NOT NULL FOREIGN KEY REFERENCES entrega(cd_entrega),
  ds_pedido VARCHAR(500),
  ic_situacao_pedido VARCHAR(30),
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
