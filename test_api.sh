#!/bin/bash

# Cores para o terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

URL="http://localhost:8080/api"

echo "--- Iniciando Testes da API ---"

# Função para validar endpoint
test_endpoint() {
    local endpoint=$1
    local expected_status=$2
    local description=$3

    echo -n "Testando $description ($endpoint)... "
    
    # Faz a requisição e captura o status code
    status=$(curl -o /dev/null -s -w "%{http_code}" "$URL$endpoint")

    if [ "$status" -eq "$expected_status" ]; then
        echo -e "${GREEN}PASS (Status $status)${NC}"
    else
        echo -e "${RED}FAIL (Esperado $expected_status, obtido $status)${NC}"
        exit 1
    fi
}

# 1. Testar Perfil
test_endpoint "/perfil" 200 "Dados do Perfil"

# 2. Testar Projetos
test_endpoint "/projetos" 200 "Lista de Projetos"

# 3. Testar Filtro (Query Param)
test_endpoint "/projetos?status=finalizado" 200 "Filtro de Projetos"

# 4. Testar Rota Inexistente (404)
test_endpoint "/rota-fake" 404 "Página não encontrada"

echo "--- Todos os testes passaram com sucesso! ---"
