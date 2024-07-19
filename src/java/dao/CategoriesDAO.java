/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DB.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Categories;

public class CategoriesDAO extends DBContext{
    public List<Categories> getAll() {
        List<Categories> list = new ArrayList<>();
        String sql = "select * from dbo.Categories";
        try {
             PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Categories c = new Categories(rs.getString("categoriesID"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
   
    
    
     
     
      
      public static void main(String[] args) {
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        List<Categories> list = categoriesDAO.getAll();
          for (Categories o : list) {
              System.out.println(o);
          }
    }
}
