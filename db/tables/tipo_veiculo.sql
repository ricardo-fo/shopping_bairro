CREATE TABLE shopping_bairro.dbo.tipo_veiculo (
  cd_tipo_veiculo INT NOT NULL PRIMARY KEY IDENTITY,
  nm_tipo_veiculo VARCHAR(30) NOT NULL,
  ic_ativo BIT NOT NULL DEFAULT 1,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
