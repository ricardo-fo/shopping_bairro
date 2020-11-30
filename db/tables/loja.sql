CREATE TABLE loja (
  cd_loja INT NOT NULL PRIMARY KEY IDENTITY,
  cd_vendedor INT NOT NULL FOREIGN KEY REFERENCES vendedor(cd_vendedor),
  cd_loja_tipo INT NOT NULL FOREIGN KEY REFERENCES tipo_loja(cd_tipo_loja),
  cd_conta INT NOT NULL FOREIGN KEY REFERENCES conta(cd_conta),
  cd_link_comprovante VARCHAR(40),
  ic_ativo BIT DEFAULT 1,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)
