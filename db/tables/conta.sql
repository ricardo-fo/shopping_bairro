CREATE TABLE shopping_bairro.dbo.conta (
  cd_conta INT NOT NULL PRIMARY KEY IDENTITY,
  cd_conta_gateway VARCHAR(50),
  ic_ativo BIT DEFAULT 1,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
