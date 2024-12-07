package com.coforge.training.get.hibernatedemo;

public class Product {
	
	private long pid;
	private String name;
	private String description;
	private float price;
	
	public Product(String name, String description, float price) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
	}
}
