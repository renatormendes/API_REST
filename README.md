# Java Native REST API - Portfolio Manager

Uma API RESTful de alta performance construída exclusivamente com o **JDK nativo**, sem a utilização de frameworks (Spring, Quarkus) ou gerenciadores de dependências (Maven, Gradle).

## 🚀 O Diferencial deste Projeto
A decisão de não utilizar ferramentas de automação modernas como Maven ou Gradle foi **proposital**. O objetivo é demonstrar domínio técnico sobre:
- **Entranhas do Java:** Gerenciamento manual de Classpath, compilação via `javac` e estruturação de pacotes.
- **Protocolo HTTP:** Implementação de Handlers, gerenciamento de Headers, Status Codes e Streams de entrada/saída (I/O) no nível do socket.
- **Automação Unix:** Uso de `Makefile` e `Shell Script` para padronizar o ciclo de vida da aplicação (Build, Run, Clean).

## 🛠️ Tecnologias
- **Linguagem:** Java 11+ (com `com.sun.net.httpserver`)
- **Build:** GNU Make / Bash Script
- **Containerização:** Docker (Multi-stage build)

## 📋 Como Rodar

### Via Makefile (Local)
```bash
make        # Compila e inicia o servidor
make clean  # Remove arquivos temporários
