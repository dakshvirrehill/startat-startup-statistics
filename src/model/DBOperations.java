package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
public class DBOperations {
	static Connection con=DBConnection.getConnection();
	public static int checkStatus(String username)
	{
		try {
			String sql="SELECT Status FROM User WHERE Username='"+username+"'";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static User getUserDetails(String username)
	{
		User u=new User();
		String sql="SELECT Name,Description,Profile_Pic_Path,Email,Mobno FROM User WHERE Username='"+username+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				u.setUsername(username);
				u.setName(rs.getString(1));
				u.setDescription(rs.getString(2));
				u.setProfile_pic_path(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setMobno(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	public static boolean addUserProfile(String username, String name, String description, String Profile_Pic_Path) {
		String sql="UPDATE User Name='"+name+"', Description='"+description+"', Profile_Pic_Path='"+Profile_Pic_Path+"', Status=1 WHERE Username='"+username+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0)
			{
				return true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
