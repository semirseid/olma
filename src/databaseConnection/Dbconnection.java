 package databaseConnection;
 

 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 
 public class Dbconnection
 {
     //String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
   Connection connection;
   Statement st;
   ResultSet rs;
   PreparedStatement ps;
     String user = "olma";
     String password = "olma";
     //String dburl = "jdbc:sqlserver://localhost:1433;databaseName=Ehiochaina";
   
            String dburl = "jdbc:oracle:thin:@localhost:1521:olma";
   
   public Connection getConnection()
     throws ClassNotFoundException
   {
     try
     {   Class.forName("oracle.jdbc.driver.OracleDriver");
         //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       
 
         this.connection = DriverManager.getConnection(this.dburl, this.user, this.password);
         if (this.connection != null) {
           return this.connection;
       }
         System.out.println("Connection to the database failed");
     }
     catch (SQLException localSQLException) {}
       return this.connection;
   }
   
   public void close()
   {
       if (this.connection == null) {
       try
       {
           this.connection.close();
       }
       catch (SQLException e)
       {
           e.printStackTrace();
       }
     }
   }
 }


