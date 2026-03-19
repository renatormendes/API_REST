# Variáveis
JC = javac
JVM = java
MAIN = Main
SRC = src/Main.java
BIN = out

# Alvo padrão: compila e roda
all: compile run

compile:
	mkdir -p $(BIN)
	$(JC) -d $(BIN) $(SRC)

run:
	$(JVM) -cp $(BIN) $(MAIN)

clean:
	rm -rf $(BIN)
