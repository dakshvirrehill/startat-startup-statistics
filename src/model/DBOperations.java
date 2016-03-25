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
		String sql="UPDATE User Name='"+name+"' AND Description='"+description+"' AND Profile_Pic_Path='"+Profile_Pic_Path+"' AND Status=1 WHERE Username='"+username+"'";
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
	public static boolean addUserStatus(String username, String status)
	{
		String sql="INSERT INTO POST(Username,Post,Type) VALUES('"+username+"','"+status+"','status')";
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
	public static Vector<Post> getAllUserUpdates(String username) {
		Vector<Post> p=new Vector<Post>();
		String sql="SELECT * FROM POST WHERE Username='"+username+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			Post post=new Post();
			while(rs.next())
			{
				post.setUsername(username);
				post.setPost(rs.getString(2));
				post.setType(rs.getString(3));
				p.add(post);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	public static Vector<String> getAllCompanyLogoPath(String username)
	{
		Vector<String> logos=new Vector<String>();
		String sql="SELECT logo_path FROM Company WHERE Username='"+username+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				logos.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return logos;
	}
	public static boolean updateUserSettings(String username,String password,String email)
	{
		String sql="UPDATE User Password='"+password+"' AND Email='"+email+"' WHERE Username='"+username+"'";
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
	public static Page getPage(String slug) {
		Page page=new Page();
		String sql="SELECT * FROM Page WHERE Slug='"+slug+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				page.setSlug(slug);
				page.setTitle(rs.getString(2));
				page.setContent(rs.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;
	}
	public static boolean addCompany(String username,String name,String company_domain,String email,String website,String stage_of_development,String established,String profile,String description){
		String sql="INSERT INTO Company(Username,Name,Company_Domain,Email,Website,Stage_of_Development,Established,Logo_path,Description) VALUES('"+username+"','"+name+"','"+company_domain+"','"+email+"','"+website+"','"+stage_of_development+"','"+established+"','"+profile+"','"+description+"')";
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
	public static boolean addUser(String username, String email, String password) {
		String sql="INSERT INTO User(Username,Email,Password) VALUES('"+username+"','"+email+"','"+password+"')";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			int i=ps.executeUpdate();
			if(i>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean checkUser(String username,String password) {
		
		String sql="SELECT Username FROM User WHERE Username='"+username+"' AND Password='"+password+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return false;
	}
	public static Vector<Company> getAllCompanyDetails(String username) {
		Vector<Company> company=new Vector<Company>();
		String sql="SELECT Name,Company_Domain,Verification,CId FROM Company WHERE Username='"+username+"'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			Company c=new Company();
			while(rs.next())
			{
				c.setName(rs.getString(1));
				c.setCId(rs.getInt(4));
				c.setField_of_interest(rs.getString(2));
				c.setVerification(rs.getString(3));
				company.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return company;
	}
	public static Company getCompanyDetails(int CId) {
		Company c=new Company();
		String sql="SELECT * FROM Company WHERE CId="+CId;
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				c.setCId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setDescription(rs.getString(3));
				c.setEmail(rs.getString(4));
				c.setField_of_interest(rs.getString(5));
				c.setWebsite(rs.getString(6));
				c.setLogo_path(rs.getString(7));
				c.setValuation(rs.getString(8));
				c.setVerification(rs.getString(9));
				c.setOwnership_proof_path(rs.getString(10));
				c.setTotal_profits(rs.getString(11));
				c.setTotal_expenses(rs.getString(12));
				c.setUser_id(rs.getString(13));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
}
