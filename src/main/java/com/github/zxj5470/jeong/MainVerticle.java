package com.github.zxj5470.jeong;

import io.vertx.core.Vertx;

public class MainVerticle {
	public static void main(String[] args) {
		Vertx vertx = Vertx.vertx();
		MyFirstVerticle myFirstVerticle = new MyFirstVerticle();
		vertx.deployVerticle(myFirstVerticle);
		System.out.println("已启动");
	}
}
