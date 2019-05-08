package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Product {

    private int id;
    private double purcasheCost;
    private int quantityOnHand;
    private boolean available;
    private String description;

    public Product(int id, double purcasheCost, int quantityOnHand, boolean available, String description) {
        this.id = id;
        this.purcasheCost = purcasheCost;
        this.quantityOnHand = quantityOnHand;
        this.available = available;
        this.description = description;
    }
    
    public static ArrayList<Product> getList(int manufacturerId) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/sample";
        Connection con = DriverManager.getConnection(url, "app", "app");
        
        String SQL = "SELECT * FROM PRODUCT WHERE MANUFACTURER_ID = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, manufacturerId);
        ResultSet rs = st.executeQuery();

        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product p = new Product(
                    rs.getInt("PRODUCT_ID"),
                    rs.getDouble("PURCHASE_COST"),
                    rs.getInt("QUANTITY_ON_HAND"),
                    rs.getBoolean("AVAILABLE"),
                    rs.getString("DESCRIPTION")
            );
            list.add(p);
        }
        rs.close();
        st.close();
        con.close();
        return list;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPurcasheCost() {
        return purcasheCost;
    }

    public void setPurcasheCost(double purcasheCost) {
        this.purcasheCost = purcasheCost;
    }

    public int getQuantityOnHand() {
        return quantityOnHand;
    }

    public void setQuantityOnHand(int quantityOnHand) {
        this.quantityOnHand = quantityOnHand;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
    
    
}
