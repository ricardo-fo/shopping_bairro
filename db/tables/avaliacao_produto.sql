CREATE TABLE avaliacao_produto (
  cd_avaliacao_produto INT NOT NULL PRIMARY KEY IDENTITY,
  cd_cliente INT NOT NULL FOREIGN KEY REFERENCES cliente(cd_cliente),
  cd_produto INT NOT NULL FOREIGN KEY REFERENCES produto(cd_produto),
  qt_nota INT NOT NULL
);
