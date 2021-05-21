CREATE TABLE SETORES (
                CODIGO VARCHAR(10) NOT NULL,
                SETOR VARCHAR(100) NOT NULL,
                SUBSETOR VARCHAR(100) NOT NULL,
                SEGMENTO VARCHAR(100) NOT NULL,
                CONSTRAINT CODIGO PRIMARY KEY (CODIGO)
)CREATE TABLE ACOES (
                AC_ID INT IDENTITY NOT NULL,
                DATA DATETIME NOT NULL,
                CODBDI INT NOT NULL,
                CODNEG VARCHAR(10) NOT NULL,
                TPMERC INT NOT NULL,
                NOMRES VARCHAR(50) NOT NULL,
                ESPECI VARCHAR(50) NOT NULL,
                MODREF VARCHAR(10) NOT NULL,
                PREABE DECIMAL(10,2) NOT NULL,
                PREMAX DECIMAL(10,2) NOT NULL,
                PREMIN DECIMAL(10,2) NOT NULL,
                PREMED DECIMAL(10,2) NOT NULL,
                PREULT DECIMAL(10,2) NOT NULL,
                PREOFC DECIMAL(10,2) NOT NULL,
                PREOFV DECIMAL(10,2) NOT NULL,
                TOTNEG INT NOT NULL,
                QUATOT BIGINT NOT NULL,
                VOLTOT DECIMAL(15,2) NOT NULL,
                FATCOT INT NOT NULL,
                CODISI VARCHAR(50) NOT NULL,
                DISMES INT NOT NULL,
                CONSTRAINT AC_ID PRIMARY KEY (AC_ID)
)