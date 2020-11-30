CREATE TABLE bairro (
  cd_bairro INT NOT NULL PRIMARY KEY IDENTITY,
  nm_bairro VARCHAR(50) NOT NULL,
  qt_entregador_bairro INT NOT NULL DEFAULT 1
);
