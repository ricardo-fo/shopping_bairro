CREATE TABLE shopping_bairro.dbo.cidade (
  cd_cidade INT NOT NULL PRIMARY KEY IDENTITY,
  nm_cidade VARCHAR(40) NOT NULL,
  cd_estado INT NOT NULL FOREIGN KEY REFERENCES dbo.estado(cd_estado)
);
