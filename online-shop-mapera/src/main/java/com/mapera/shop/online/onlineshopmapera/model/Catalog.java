package com.mapera.shop.online.onlineshopmapera.model;


public class Catalog {

	private long id;
	//Stock keeping unit
	private String sku;
	private String title;
	private long quantityAvailable;
	private double cost;
	private String product;
	private String category;
	private String description;
	private String brand;
	//Minimum advertised price
	private double map;
	//>Manufacturers suggested retail price
	private double msrp;
	//Manufacturer part number
	private double mpn;
	//Universal product code
	private String upc;
	private double length;
	private double width;
	private double height;
	private double weight;
	private double handlingCost;
	private String  productAttributes;
	private String images;
	public Catalog(String sku, String title, long quantityAvailable, double cost,
			String product, String category, String description, String brand,
			double map, double msrp, double mpn, String upc, double length,
			double width, double height, double weight, double handlingCost,
			String productAttributes, String images) {
		super();
		this.sku = sku;
		this.title = title;
		this.quantityAvailable = quantityAvailable;
		this.cost = cost;
		this.product = product;
		this.category = category;
		this.description = description;
		this.brand = brand;
		this.map = map;
		this.msrp = msrp;
		this.mpn = mpn;
		this.upc = upc;
		this.length = length;
		this.width = width;
		this.height = height;
		this.weight = weight;
		this.handlingCost = handlingCost;
		this.productAttributes = productAttributes;
		this.images = images;
	}
	public long getId() {
		return id;
	}
	//TODO : remove setter when jdbc is ready
	public void setId(long id) {
		this.id = id;
	}
	public String getSku() {
		return sku;
	}
	public String getTitle() {
		return title;
	}
	public long getQuantityAvailable() {
		return quantityAvailable;
	}
	public double getCost() {
		return cost;
	}
	public String getProduct() {
		return product;
	}
	public String getCategory() {
		return category;
	}
	public String getDescription() {
		return description;
	}
	public String getBrand() {
		return brand;
	}
	public double getMap() {
		return map;
	}
	public double getMsrp() {
		return msrp;
	}
	public double getMpn() {
		return mpn;
	}
	public String getUpc() {
		return upc;
	}
	public double getLength() {
		return length;
	}
	public double getWidth() {
		return width;
	}
	public double getHeight() {
		return height;
	}
	public double getWeight() {
		return weight;
	}
	public double getHandlingCost() {
		return handlingCost;
	}
	public String getProductAttributes() {
		return productAttributes;
	}
	public String getImages() {
		return images;
	}
	@Override
	public String toString() {
		return String
				.format("Catalog [id=%s, sku=%s, quantityAvailable=%s, cost=%s, product=%s, category=%s, description=%s, brand=%s, map=%s, msrp=%s, mpn=%s, upc=%s, length=%s, width=%s, height=%s, weight=%s, handlingCost=%s, productAttributes=%s, images=%s]",
						id, sku, quantityAvailable, cost, product, category,
						description, brand, map, msrp, mpn, upc, length, width,
						height, weight, handlingCost, productAttributes, images);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime * result + ((sku == null) ? 0 : sku.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Catalog other = (Catalog) obj;
		if (id != other.id)
			return false;
		if (sku == null) {
			if (other.sku != null)
				return false;
		} else if (!sku.equals(other.sku))
			return false;
		return true;
	}
}
