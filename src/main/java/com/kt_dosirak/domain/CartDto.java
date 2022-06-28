package com.kt_dosirak.domain;

import java.util.Objects;

public class CartDto {
    private int cart_id;
    private String cart_user_id;
    private String cart_product_id;
    private int cart_amount;

//    ProductDto
    private String product_name;
    private int product_price;
    private int product_calories;
    private String product_desc;

    public CartDto(){}
    public CartDto(int cart_id, String cart_user_id, String cart_product_id, int cart_amount, String product_name, int product_price, int product_calories, String product_desc) {
        this.cart_id = cart_id;
        this.cart_user_id = cart_user_id;
        this.cart_product_id = cart_product_id;
        this.cart_amount = cart_amount;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_calories = product_calories;
        this.product_desc = product_desc;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getCart_user_id() {
        return cart_user_id;
    }

    public void setCart_user_id(String cart_user_id) {
        this.cart_user_id = cart_user_id;
    }

    public String getCart_product_id() {
        return cart_product_id;
    }

    public void setCart_product_id(String cart_product_id) {
        this.cart_product_id = cart_product_id;
    }

    public int getCart_amount() {
        return cart_amount;
    }

    public void setCart_amount(int cart_amount) {
        this.cart_amount = cart_amount;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDto cartDto = (CartDto) o;
        return cart_id == cartDto.cart_id && cart_amount == cartDto.cart_amount && product_price == cartDto.product_price && product_calories == cartDto.product_calories && Objects.equals(cart_user_id, cartDto.cart_user_id) && Objects.equals(cart_product_id, cartDto.cart_product_id) && Objects.equals(product_name, cartDto.product_name) && Objects.equals(product_desc, cartDto.product_desc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cart_id, cart_user_id, cart_product_id, cart_amount, product_name, product_price, product_calories, product_desc);
    }

    @Override
    public String toString() {
        return "CartDto{" +
                "cart_id=" + cart_id +
                ", cart_user_id='" + cart_user_id + '\'' +
                ", cart_product_id='" + cart_product_id + '\'' +
                ", cart_amount=" + cart_amount +
                ", product_name='" + product_name + '\'' +
                ", product_price=" + product_price +
                ", product_calories=" + product_calories +
                ", product_desc='" + product_desc + '\'' +
                '}';
    }
}
