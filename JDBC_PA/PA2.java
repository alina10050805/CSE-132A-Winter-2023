/** 
 * This Java program exemplifies the basic usage of JDBC. 
 * Requirements: 
 *   (1) JDK 8.0+ 
 *   (2) SQLite3. 
 *   (3) SQLite3 JDBC jar (https://bitbucket.org/xerial/sqlite-
jdbc/downloads/sqlite-jdbc-[version number].jar). 
 */ 
 
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
import java.sql.Statement; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
 
public class PA2 { 
    public static void main(String[] args) { 
        Connection conn = null;  // Database connection. 
 
        try { 
            // Load the JDBC class. 
            Class.forName("org.sqlite.JDBC"); 
            // Get the connection to the database. 
            // - "jdbc" : JDBC connection name prefix. 
            // - "sqlite" : The concrete database implementation 
            // (e.g., sqlserver, postgresql). 
            // - "pa2.db" : The name of the database. In this project,  
            // we use a local database named "pa2.db".  This can also 
            // be a remote database name. 
            conn = DriverManager.getConnection("jdbc:sqlite:pa2.db"); 
            System.out.println("Opened database successfully."); 

            // Get a Statement object. 
            Statement stmt = conn.createStatement(); 

            // TABLE Connected for final result
            stmt.executeUpdate("DROP TABLE IF EXISTS Connected;"); 
            stmt.executeUpdate("CREATE TABLE Connected (Airline char(32), Origin char(32), Destination char(32), Stops INT);");  
 
            // TABLE T
            stmt.executeUpdate("DROP TABLE IF EXISTS T;"); 
            stmt.executeUpdate("CREATE TABLE T AS SELECT *, 0 AS countStops FROM Flight;");

            // TABLE Delta
            stmt.executeUpdate("DROP TABLE IF EXISTS Delta;"); 
            stmt.executeUpdate("CREATE TABLE Delta AS SELECT * FROM T;");

            // set the ResultSet to check if is empty
            ResultSet rset = stmt.executeQuery("SELECT * from Delta;"); 

            // use next in ResultSet to check if rset is empty
            while (rset.next()) { 
                // TABLE T_old
                stmt.executeUpdate("DROP TABLE IF EXISTS T_old;"); 
                stmt.executeUpdate("CREATE TABLE T_old AS SELECT * FROM T;");
 
                stmt.executeUpdate("INSERT INTO T SELECT * FROM " +
                                    "(SELECT airline, origin, destination, MIN(stops) FROM " +
                                    "(SELECT x.airline, x.origin, y.destination, x.countStops+y.countStops+1 AS stops FROM Delta x, T y " +
                                    "WHERE x.airline = y.airline AND x.destination = y.origin AND x.origin<>y.destination AND " +
                                    "NOT EXISTS (SELECT * FROM T WHERE airline=x.airline AND origin=x.origin AND destination=y.destination)) " +
                                    "GROUP BY airline, origin, destination);");
                
                stmt.executeUpdate("DELETE FROM Delta;");
                stmt.executeUpdate("INSERT INTO Delta " +
                                    "SELECT * FROM T " +
                                    "EXCEPT " +
                                    "SELECT * FROM T_old;");

                // reset the ResultSet to check if is empty
                rset.close();
                rset = stmt.executeQuery("SELECT * from Delta;");
            } 

            stmt.executeUpdate("INSERT INTO Connected SELECT DISTINCT * FROM T ORDER BY airline, origin, destination;");
            stmt.executeUpdate("DROP TABLE IF EXISTS T;"); 
            stmt.executeUpdate("DROP TABLE IF EXISTS Delta;"); 
            stmt.executeUpdate("DROP TABLE IF EXISTS T_old;"); 

            // testing output
            // rset = stmt.executeQuery("SELECT * from Connected;"); 
            // while (rset.next()) { 
            //     System.out.print(rset.getString("airline")); 
            //     System.out.print("---");
            //     System.out.print(rset.getString("origin")); 
            //     System.out.print("---"); 
            //     System.out.print(rset.getString("destination")); 
            //     System.out.print("---"); 
            //     System.out.println(rset.getString("Stops")); 
            // }
 
            // Close the ResultSet and Statement objects. 
            rset.close(); 
            stmt.close(); 
        
        }
        catch (Exception e) 
        { 
            throw new RuntimeException("There was a runtime problem!", e); 
        } 
        finally 
        { 
            try 
            { 
                if (conn != null)
                    conn.close(); 
            } 
            catch (SQLException e) 
            { 
                throw new RuntimeException("Cannot close the connection!", e); 
            } 
        } 
    } 
} 