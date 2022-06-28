package com.kt_dosirak.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDto {
    private String product_id;
    private String product_name;
    private String product_category_id_fk;
    private int product_price;
    private int product_stock;
    private int product_calories;
    private String product_desc;
    private Date product_regDate;

    public ProductDto() {}

    public ProductDto(String product_id, String product_name, String product_category_id_fk, int product_price, int product_stock, int product_calories, String product_desc) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_category_id_fk = product_category_id_fk;
        this.product_price = product_price;
        this.product_stock = product_stock;
        this.product_calories = product_calories;
        this.product_desc = product_desc;
    }

    public ProductDto(String product_id, String product_name, String product_category_id_fk, int product_price, int product_stock, int product_calories, String product_desc, Date product_regDate) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_category_id_fk = product_category_id_fk;
        this.product_price = product_price;
        this.product_stock = product_stock;
        this.product_calories = product_calories;
        this.product_desc = product_desc;
        this.product_regDate = product_regDate;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_category_id_fk() {
        return product_category_id_fk;
    }

    public void setProduct_category_id_fk(String product_category_id_fk) {
        this.product_category_id_fk = product_category_id_fk;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }

    public int getProduct_stock() {
        return product_stock;
    }

    public void setProduct_stock(int product_stock) {
        this.product_stock = product_stock;
    }

    public int getProduct_calories() {
        return product_calories;
    }

    public void setProduct_calories(int product_calories) {
        this.product_calories = product_calories;
    }

    public String getProduct_desc() {
        return product_desc;
    }

    public void setProduct_desc(String product_desc) {
        this.product_desc = product_desc;
    }

    public Date getProduct_regDate() {
        return product_regDate;
    }

    public void setProduct_regDate(Date product_regDate) {
        this.product_regDate = product_regDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDto that = (ProductDto) o;
        return product_price == that.product_price && product_stock == that.product_stock && product_calories == that.product_calories && Objects.equals(product_id, that.product_id) && Objects.equals(product_name, that.product_name) && Objects.equals(product_category_id_fk, that.product_category_id_fk) && Objects.equals(product_desc, that.product_desc) && Objects.equals(product_regDate, that.product_regDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(product_id, product_name, product_category_id_fk, product_price, product_stock, product_calories, product_desc, product_regDate);
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "product_id='" + product_id + '\'' +
                ", product_name='" + product_name + '\'' +
                ", product_category_id_fk='" + product_category_id_fk + '\'' +
                ", product_price=" + product_price +
                ", product_stock=" + product_stock +
                ", product_calories=" + product_calories +
                ", product_desc='" + product_desc + '\'' +
                ", product_regDate=" + product_regDate +
                '}';
    }
}
