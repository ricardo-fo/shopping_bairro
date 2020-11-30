CREATE TABLE item_pedido (
  cd_item_pedido INT NOT NULL PRIMARY KEY IDENTITY,
  cd_pedido INT NOT NULL FOREIGN KEY REFERENCES pedido(cd_pedido),
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES produto(cd_produto),
  qt_produto INT DEFAULT 1
);
