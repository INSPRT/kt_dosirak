package com.kt_dosirak.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

public class UserDto {
    private String id;
    private String pass;
    private String name;
    private String phone;
    private String address;
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;
    private String gender;
    private int height;
    private int weight;
    private int exercise;
    private Date reg_date;

    public UserDto() {
    }

    public UserDto(String id, String pass, String name, String phone, String address, String email, Date birth, int height, int weight, int exercise) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.birth = birth;
        this.height = height;
        this.weight = weight;
        this.exercise = exercise;
    }

    public UserDto(String id, String pass, String name, String phone, String address, String email, Date birth, String gender, int height, int weight, int exercise) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.birth = birth;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.exercise = exercise;
    }

    public UserDto(String id, String pass, String name, String phone, String address, String email, Date birth, String gender, int height, int weight, int exercise, Date reg_date) {
        this.id = id;
        this.pass = pass;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.birth = birth;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.exercise = exercise;
        this.reg_date = reg_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getExercise() {
        return exercise;
    }

    public void setExercise(int exercise) {
        this.exercise = exercise;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDto userDto = (UserDto) o;
        return height == userDto.height && weight == userDto.weight && exercise == userDto.exercise && Objects.equals(id, userDto.id) && Objects.equals(pass, userDto.pass) && Objects.equals(name, userDto.name) && Objects.equals(phone, userDto.phone) && Objects.equals(address, userDto.address) && Objects.equals(email, userDto.email) && Objects.equals(birth, userDto.birth) && Objects.equals(gender, userDto.gender) && Objects.equals(reg_date, userDto.reg_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pass, name, phone, address, email, birth, gender, height, weight, exercise, reg_date);
    }

    @Override
    public String toString() {
        return "UserDto{" +
                "id='" + id + '\'' +
                ", pass='" + pass + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", birth='" + birth + '\'' +
                ", gender='" + gender + '\'' +
                ", height=" + height +
                ", weight=" + weight +
                ", exercise=" + exercise +
                ", reg_date=" + reg_date +
                '}';
    }
}
