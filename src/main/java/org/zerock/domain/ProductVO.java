package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	
	private String name;
	private double price;
	
	public ProductVO(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "ProductVO [name=" + name + ", price =" + price + "]";
	}

}
