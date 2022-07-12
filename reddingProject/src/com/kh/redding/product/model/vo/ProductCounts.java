package com.kh.redding.product.model.vo;

public class ProductCounts {
	private int productTotalCount;
	private int saleProductCount;
	private int noSaleProductCount;
	public ProductCounts() {}

	public ProductCounts(int productTotalCount, int saleProductCount, int noSaleProductCount) {
		super();
		this.productTotalCount = productTotalCount;
		this.saleProductCount = saleProductCount;
		this.noSaleProductCount = noSaleProductCount;
	}

	public int getProductTotalCount() {
		return productTotalCount;
	}

	public void setProductTotalCount(int productTotalCount) {
		this.productTotalCount = productTotalCount;
	}

	public int getSaleProductCount() {
		return saleProductCount;
	}

	public void setSaleProductCount(int saleProductCount) {
		this.saleProductCount = saleProductCount;
	}

	public int getNoSaleProductCount() {
		return noSaleProductCount;
	}

	public void setNoSaleProductCount(int noSaleProductCount) {
		this.noSaleProductCount = noSaleProductCount;
	}

	@Override
	public String toString() {
		return "ProductCounts [productTotalCount=" + productTotalCount + ", saleProductCount=" + saleProductCount
				+ ", noSaleProductCount=" + noSaleProductCount + "]";
	}
	
	
}
