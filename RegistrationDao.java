import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class RegistrationDao {
	private String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbUname = "system";
	private String dbPassword = "1234";
	private String dbDriver = "oracle.jdbc.driver.OracleDriver";
	
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	

public String insert(user user_phno)
{
	loadDriver(dbDriver);
	Connection con = getConnection();
	String result = "Data entered successfully";
	String sql = "insert into user_phno values(?,?)";
	
	PreparedStatement pk;
	try {
	pk = con.prepareStatement(sql);
	pk.setString(1, user_phno.getuid());
	pk.setString(2, user_phno.getphnum());
	pk.executeUpdate();
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		result = "Data not entered";
		
	}
	return result;
}

}
