package com.github.zxj5470.jeong;

import io.vertx.core.AbstractVerticle;
import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.asyncsql.AsyncSQLClient;
import io.vertx.ext.asyncsql.PostgreSQLClient;
import io.vertx.ext.sql.SQLRowStream;

import java.util.ArrayList;

public class MyFirstVerticle extends AbstractVerticle {
	public void start() {
		JsonObject postgreSQLClientConfig = getDataBaseConfig();
		AsyncSQLClient postgreSQLClient = PostgreSQLClient.createShared(vertx, postgreSQLClientConfig, "gis");

		vertx.createHttpServer().requestHandler(req -> {
			if (req.absoluteURI().endsWith("/favicon.ico")) {
				req.response()
						.putHeader("content-type", "application/json")
						.end("{\"status\":-1}");
				return;
			}
			postgreSQLClient.queryStream("SELECT name, ST_AsText(geom) FROM geometries", res -> {
				if (res.succeeded()) {
					SQLRowStream sqlRowStream = res.result();
					ArrayList<JsonArray> jsonArrays = new ArrayList<>();
					sqlRowStream.handler(jsonArrays::add);
					JsonObject object = new JsonObject()
							.put("status",0)
							.put("cols", sqlRowStream.columns())
							.put("results", jsonArrays);
					req.response()
							.putHeader("content-type", "application/json")
							.end(object.toString());
				} else {
					System.out.println("failed to create connection");
					req.response()
							.putHeader("content-type", "application/json")
							.end("{\"status\":-1}");
				}
			});
		}).listen(8080);
	}

	private JsonObject getDataBaseConfig() {
		return new JsonObject()
					.put("username", "zh")
					.put("database", "gis")
					.put("port", 5432)
					.put("password", "zxj5470")
					.put("host", "localhost");
	}
}
