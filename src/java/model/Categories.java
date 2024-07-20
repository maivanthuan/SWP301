/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class Categories {
    private String categoriesID;
    private String name;

    public Categories() {
    }

    public Categories(String categoriesID, String name) {
        this.categoriesID = categoriesID;
        this.name = name;
    }

    public String getCategoriesID() {
        return categoriesID;
    }

    public void setCategoriesID(String categoriesID) {
        this.categoriesID = categoriesID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "categories{" + "categoriesID=" + categoriesID + ", name=" + name + '}';
    }
    
    
}
