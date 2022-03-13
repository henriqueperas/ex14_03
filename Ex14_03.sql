CREATE DATABASE Ex14_03
GO
USE Ex14_03
GO

CREATE TABLE Cliente (
CPF					CHAR(11)		NOT NULL,
Nome				VARCHAR(100)	NOT NULL,
Email				VARCHAR(100)	NOT NULL,
Limite_de_credito	DECIMAL(7,2)	NOT NULL,
Dt_Nascimento		DATE			NOT NULL
PRIMARY KEY(CPF)
)

SELECT * FROM Cliente

DELETE Cliente
DROP PROCEDURE sp_inserircliente

CREATE PROCEDURE sp_inserircliente(@CPF CHAR(11), @Nome VARCHAR(100), 
	@Email VARCHAR(100), @Limite_de_credito	DECIMAL(7,2), @Dt_Nascimento DATE, 
	@saida VARCHAR(40) OUTPUT)
AS
	DECLARE @inter INT, 
			@inter2 INT, 
			@inter3 INT, 
			@valido BIT,
			@enter INT, 
			@enter2 INT, 
			@enter3 INT, 
			@enterSoma INT, 
			@enterFinal INT, 
			@enter4 INT, 
			@num2 INT, 
			@valido2 BIT

	SET @inter2 = 1
	SET @valido = 1
	SET @inter3 = SUBSTRING(@CPF,1,1)

	WHILE (@inter2 <= 11)
	BEGIN
		SET @inter = SUBSTRING(@CPF,@inter2,1)
			IF(@valido = 1)
			BEGIN
				IF(@inter = @inter3)
				BEGIN
					SET @valido = 1
				END
				ELSE
				BEGIN
					SET @valido = 0
				END
			END
		SET @inter2 = @inter2 + 1
	END

	IF(@valido = 1)
	BEGIN
		RAISERROR ('CPF invlido2', 16, 1)
	END
	ELSE
	BEGIN
		SET @num2 = 0

		WHILE (@num2 <= 1)
		BEGIN
			SET @enter = 10
			SET @enter2 = 1
			SET @enter4 = 9
			SET @enterSoma = 0

			IF (@num2 = 1)
			BEGIN
				SET @enter = 11
				SET @enter4 = 10
			END

			WHILE (@enter2 <= @enter4)
			BEGIN
				SET @enter3 = SUBSTRING(@CPF,@enter2,1)
				SET @enterSoma = @enterSoma + @enter3 * @enter
				SET @enter = @enter - 1
				SET @enter2 = @enter2 + 1
	
			END

			SET @enterFinal = @enterSoma % 11

			IF (@enterFinal >= 2)
			BEGIN
				SET @enterFinal = 11 - @enterFinal
			END
			ELSE
			BEGIN
				SET @enterFinal = 0
			END

			SET @enter = SUBSTRING(@CPF,@enter2,1)
			IF (@enter = @enterFinal)
			BEGIN
				SET @num2 = @num2 + 1
				SET @valido2 = 0
			END
			ELSE
			BEGIN
				SET @num2 = @num2 + 2
				RAISERROR ('CPF invlido3', 16, 1)
				SET @valido2 = 1
			END
		END

		IF(@valido2 = 0)
		BEGIN
			INSERT INTO Cliente VALUES 
			(@CPF, @Nome, @Email, @Limite_de_credito, @Dt_Nascimento)

			SET @saida = 'Cliente inserido com sucesso'
		END
	END

DECLARE @out VARCHAR (40)
EXEC sp_inserircliente '80376773030', 'Henrique', 'Henrique@gmail.com', 1000.00, '02/12/2005', @out OUTPUT
PRINT @out