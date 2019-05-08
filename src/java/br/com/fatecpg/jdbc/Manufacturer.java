package br.com.fatecpg.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Manufacturer {

    private int id;
    private String name;
    private String address;
    private String city;

    public Manufacturer(int id, String name, String address, String city) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.city = city;
    }
    
    public static ArrayList<Manufacturer> getList() throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/sample";
        Connection con = DriverManager.getConnection(url, "app", "app");

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM MANUFACTURER");

        ArrayList<Manufacturer> list = new ArrayList<>();
        while (rs.next()) {
            Manufacturer m = new Manufacturer(
                    rs.getInt("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("ADDRESSLINE1"),
                    rs.getString("CITY")
            );
            list.add(m);
        }
        rs.close();
        st.close();
        con.close();
        return list;
    }
    
    public static Manufacturer getManufacturer(int id) throws Exception {
        Class.forName("org.apache.derby.jdbc.ClientDriver");

        String url = "jdbc:derby://localhost:1527/sample";
        Connection con = DriverManager.getConnection(url, "app", "app");

        String SQL = "SELECT * FROM MANUFACTURER WHERE MANUFACTURER_ID = ?";
        PreparedStatement st = con.prepareStatement(SQL);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();

        Manufacturer m = null;
        if (rs.next()) {
            m = new Manufacturer(
                    rs.getInt("MANUFACTURER_ID"),
                    rs.getString("NAME"),
                    rs.getString("ADDRESSLINE1"),
                    rs.getString("CITY")
            );
        }
        rs.close();
        st.close();
        con.close();
        return m;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
