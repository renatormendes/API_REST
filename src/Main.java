import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;


public class Main {

	public static void main(String[] args) throws IOException {

		int port = 8080;
		HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);

		// Rota 1: Informações do Profissional
		server.createContext("/api/perfil", exchange -> {

			String json = "{\"nome\": \"seu Nome\", \"cargo\": \"Backend Developer\", \"techs\": [\"Java\", \"REST\", \"Docker\"]}";
			sendResponse(exchange, json, 200);

		});

		// Rota 2: Lista de Projetos (Exemplo de filtragem por query param)
		server.createContext("/api/projetos", exchange -> {

			String query = exchange.getRequestURI().getQuery();
			String response;

			if (query != null && query.contains("status = finalizado")) {

				response = "[{\"id\": 1, \"nome\": \"API Java Nativa\", \"status\": \"finalizado\"}]";

			} else {

				response = "[{\"id\": 1, \"nome\": \"API Java Nativa\"}, {\"id\": 2, \"nome\": \"Sistema de Vendas (Draft)\"}]";

			}

			sendResponse(exchange, response, 200);

		});

		server.setExecutor(null);
		System.out.print("Portfólio API rodando em: http://localhost:" + port);
		server.start();
		
	}

	// Método auxiliar para evitar repetição de código (Clean Code)
	private static void sendResponse (HttpExchange exchange, String response, int statusCode) throws IOException {

		byte[] bytes = response.getBytes(StandardCharsets.UTF_8);
		exchange.getResponseHeaders().set("Content-Type", "application/json; charset = UTF-8");
		exchange.sendResponseHeaders(statusCode, bytes.length);

		try (OutputStream os = exchange.getResponseBody()) {

			os.write(bytes);
			os.flush();

		}

	}

}
