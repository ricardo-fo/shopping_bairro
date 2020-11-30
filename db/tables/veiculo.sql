CREATE TABLE veiculo (
  cd_veiculo INT NOT NULL PRIMARY KEY IDENTITY,
  cd_entregador INT NOT NULL FOREIGN KEY REFERENCES entregador(cd_entregador),
  cd_tipo_veiculo INT NOT NULL FOREIGN KEY REFERENCES tipo_veiculo(cd_tipo_veiculo),
  cd_placa_veiculo VARCHAR(15),
  nm_modelo_veiculo VARCHAR(20),
  nm_cor_veiculo VARCHAR(15),
  cd_foto_veiculo VARCHAR(30) NOT NULL,
  dt_created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dt_updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
