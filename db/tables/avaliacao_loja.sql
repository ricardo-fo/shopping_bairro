CREATE TABLE avaliacao_loja (
  cd_avaliacao_loja INT NOT NULL PRIMARY KEY IDENTITY,
  cd_loja INT NOT NULL FOREIGN KEY REFERENCES loja(cd_loja),
  ds_avaliacao VARCHAR(350),
  qt_estrela_avaliacao INT DEFAULT 5
);
