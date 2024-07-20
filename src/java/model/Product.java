/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Objects;

public class Product {

    private int productID;
    private String name;
    private String description;
    private String size;
    private String image;
    private String categoryID;
    private int price;
    private int quantity;
    private String timeStart;
    private String timeEnd;

    public Product(int productID, String productName, String description, String size, String image, String categoryID, int price, int quantity) {
        this.productID = productID;
        this.name = productName;
        this.description = description;
        this.size = size;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
    }

    public Product() {
    }
    public Product(int productID, String name, String description, String size, String image, String categoryID, int price, String timeStart, String timeEnd) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.size = size;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
    }
     public Product(int productID, String productName, String description, String size, String image, String categoryID) {
        this.productID = productID;
        this.name = productName;
        this.description = description;
        this.size = size;
        this.image = image;
        this.categoryID = categoryID;
    }
    

    public Product(int productID, String productName, String description, String size, String image, String categoryID, int price) {
        this.productID = productID;
        this.name = productName;
        this.description = description;
        this.size = size;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String productName) {
        this.name = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "product{" + "productID=" + productID + ", productName=" + name + ", description=" + description + ", size=" + size + ", image=" + image + ", categoryID=" + categoryID + ", price=" + price + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 37 * hash + Objects.hashCode(this.productID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        return Objects.equals(this.productID, other.productID);
    }

}
