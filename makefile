# Variáveis
JC = javac
JVM = java
MAIN = Main
SRC = src/Main.java
BIN = out

# Alvo padrão: compila testa e roda
all: compile test run

compile:
	mkdir -p $(BIN)
	$(JC) -d $(BIN) $(SRC)

run:
	$(JVM) -cp $(BIN) $(MAIN)

clean:
	rm -rf $(BIN)

test:
	@chmod +x test_api.sh
	@./test_api.sh
