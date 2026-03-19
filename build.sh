#!/bin/bash
echo "Limpando..."
rm -rf out
mkdir out

echo "Compilando..."
javac -d out Main.java

echo "Executando..."
java -cp out Main
