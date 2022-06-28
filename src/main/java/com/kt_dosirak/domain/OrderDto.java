package com.kt_dosirak.domain;

import java.util.Date;
import java.util.Objects;

public class OrderDto {
    private String order_id;
    private String order_user_id;
    private String order_receiver;
    private String order_address;
    private String order_phone;
    private int order_totalPrice;
    private Date order_time;
    private String order_product_id;
    private String order_amount;
    private String order_product_name;
    public OrderDto(){}

    public OrderDto(String order_id, String order_user_id, String order_receiver, String order_address, String order_phone, int order_totalPrice, Date order_time, String order_product_id, String order_amount, String order_product_name) {
        this.order_id = order_id;
        this.order_user_id = order_user_id;
        this.order_receiver = order_receiver;
        this.order_address = order_address;
        this.order_phone = order_phone;
        this.order_totalPrice = order_totalPrice;
        this.order_time = order_time;
        this.order_product_id = order_product_id;
        this.order_amount = order_amount;
        this.order_product_name = order_product_name;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getOrder_user_id() {
        return order_user_id;
    }

    public void setOrder_user_id(String order_user_id) {
        this.order_user_id = order_user_id;
    }

    public String getOrder_receiver() {
        return order_receiver;
    }

    public void setOrder_receiver(String order_receiver) {
        this.order_receiver = order_receiver;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public String getOrder_phone() {
        return order_phone;
    }

    public void setOrder_phone(String order_phone) {
        this.order_phone = order_phone;
    }

    public int getOrder_totalPrice() {
        return order_totalPrice;
    }

    public void setOrder_totalPrice(int order_totalPrice) {
        this.order_totalPrice = order_totalPrice;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public String getOrder_product_id() {
        return order_product_id;
    }

    public void setOrder_product_id(String order_product_id) {
        this.order_product_id = order_product_id;
    }

    public String getOrder_amount() {
        return order_amount;
    }

    public void setOrder_amount(String order_amount) {
        this.order_amount = order_amount;
    }

    public String getOrder_product_name() {
        return order_product_name;
    }

    public void setOrder_product_name(String order_product_name) {
        this.order_product_name = order_product_name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderDto orderDto = (OrderDto) o;
        return order_totalPrice == orderDto.order_totalPrice && Objects.equals(order_id, orderDto.order_id) && Objects.equals(order_user_id, orderDto.order_user_id) && Objects.equals(order_receiver, orderDto.order_receiver) && Objects.equals(order_address, orderDto.order_address) && Objects.equals(order_phone, orderDto.order_phone) && Objects.equals(order_time, orderDto.order_time) && Objects.equals(order_product_id, orderDto.order_product_id) && Objects.equals(order_amount, orderDto.order_amount) && Objects.equals(order_product_name, orderDto.order_product_name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(order_id, order_user_id, order_receiver, order_address, order_phone, order_totalPrice, order_time, order_product_id, order_amount, order_product_name);
    }

    @Override
    public String toString() {
        return "OrderDto{" +
                "order_id='" + order_id + '\'' +
                ", order_user_id='" + order_user_id + '\'' +
                ", order_receiver='" + order_receiver + '\'' +
                ", order_address='" + order_address + '\'' +
                ", order_phone='" + order_phone + '\'' +
                ", order_totalPrice=" + order_totalPrice +
                ", order_time=" + order_time +
                ", order_product_id='" + order_product_id + '\'' +
                ", order_amount='" + order_amount + '\'' +
                ", order_product_name='" + order_product_name + '\'' +
                '}';
    }
}
