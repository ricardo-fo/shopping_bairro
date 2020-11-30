CREATE TABLE cidade (
  cd_cidade INT NOT NULL PRIMARY KEY IDENTITY,
  nm_cidade VARCHAR(40) NOT NULL,
  cd_estado INT NOT NULL FOREIGN KEY REFERENCES estado(cd_estado)
);
