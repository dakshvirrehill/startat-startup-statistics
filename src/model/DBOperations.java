package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
public class DBOperations {
	private static Connection con=DBConnection.getConnection();
	private static int insertOrUpdate(String sql) {
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	private static ResultSet selectQuery(String sql) {
		ResultSet rs = null;
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public static int checkStatus(String username)
	{
			String sql="SELECT Status FROM User WHERE Username='"+username+"'";
			ResultSet rs=selectQuery(sql);
			try {
				if(rs.next())
				{
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return 0;
	}
	public static User getUserDetails(String username)
	{
		User u=new User();
		String sql="SELECT Name,Description,Profile_Pic_Path,EmailId,Mobno FROM User WHERE Username='"+username+"'";
		
			ResultSet rs=selectQuery(sql);
		try {	
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
		String sql="UPDATE User SET Name='"+name+"' AND Description='"+description+"' AND Profile_Pic_Path='"+Profile_Pic_Path+"' AND Status=1 WHERE Username='"+username+"'";
		int i=insertOrUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public static boolean addUserStatus(String username, String status)
	{
		String sql="INSERT INTO POST(Username,Post,Type) VALUES('"+username+"','"+status+"','status')";
		int i=insertOrUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public static Vector<Post> getAllUserUpdates(String username) {
		Vector<Post> p=new Vector<Post>();
		String sql="SELECT * FROM POST WHERE Username='"+username+"'";
		ResultSet rs=selectQuery(sql);
			Post post=new Post();
		try{
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
		String sql="SELECT Logo_Path FROM Company WHERE Username='"+username+"'";
		ResultSet rs=selectQuery(sql);
		try{
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
		String sql="UPDATE User SET Password='"+password+"' AND EmailId='"+email+"' WHERE Username='"+username+"'";
		int i=insertOrUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public static Page getPage(String slug) {
		Page page=new Page();
		String sql="SELECT * FROM Page WHERE Slug='"+slug+"'";
		ResultSet rs=selectQuery(sql);
		try{
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
		String sql="INSERT INTO Company(Username,Name,Company_Domain,EmailId,Website,Stage_Of_Development,Established,Logo_Path,Description) VALUES('"+username+"','"+name+"','"+company_domain+"','"+email+"','"+website+"','"+stage_of_development+"','"+established+"','"+profile+"','"+description+"')";
		int i=insertOrUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public static boolean addUser(String username, String email, String password) {
		String sql="INSERT INTO User(Username,EmailId,Password) VALUES('"+username+"','"+email+"','"+password+"')";
		int i=insertOrUpdate(sql);
		if(i>0){
			return true;
		}
		return false;
	}
	public static boolean checkUser(String username,String password) {
		String sql="SELECT Username FROM User WHERE Username='"+username+"' AND Password='"+password+"'";
		ResultSet rs=selectQuery(sql);
		try{
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
		String sql="SELECT Name,Company_Domain,Verification,CompanyId FROM Company WHERE Username='"+username+"'";
		ResultSet rs=selectQuery(sql);
		Company c=new Company();
		try {
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
		String sql="SELECT * FROM Company WHERE CompanyId="+CId;
		ResultSet rs=selectQuery(sql);
		try {
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
				c.setNeed(rs.getString(14));
				c.setStage_of_development(rs.getString(15));
				c.setEstablished(rs.getString(16));
				c.setVid_path(rs.getString(18));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	public static boolean getVerified(String CId,String verified_path){
		int Cid=Integer.parseInt(CId);
		String sql="UPDATE Company SET Ownership_Proof_Path='"+verified_path+"' AND Verification='yes' WHERE CId="+Cid;
		int i=insertOrUpdate(sql);
		if(i>0)
		{
			return true;
		}
		return false;
	}
	public static Connections getPossibleConnections(String field_of_interest,String need) {
		Connections c=new Connections();
		Vector<Investor> inv=new Vector<Investor>();
		Vector<Startup> str=new Vector<Startup>();
		String sql1="SELECT * FROM Investor WHERE Field_Of_Investment='"+field_of_interest+"'";
		String sql2="SELECT * FROM Company WHERE Company_Domain='"+need+"'";
		ResultSet rs=selectQuery(sql1);
		Investor i=new Investor();
		try {
			while(rs.next()) {
				i.setName(rs.getString(2));
				i.setField_of_investment(rs.getString(3));
				i.setMax_investment(rs.getString(4));
				i.setEmailid(rs.getString(5));
				i.setWebsite(rs.getString(6));
				i.setContact_no(rs.getString(7));
				inv.add(i);
			}
			rs=selectQuery(sql2);
			Startup s=new Startup();
			while(rs.next()){
				s.setName(rs.getString(2));
				s.setEmailid(rs.getString(4));
				s.setField_of_interest(rs.getString(5));
				s.setWebsite(rs.getString(6));
				s.setNeed(rs.getString(14));
				str.add(s);
			}
			c.setInvestor(inv);
			c.setStartup(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	public static String getNeed(int CId) {
		String need="unset";
		String sql="SELECT Need FROM Company WHERE CompanyId="+CId;
		ResultSet rs=selectQuery(sql);
		try {
			if(rs.next())
			{
				need=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return need;
	}
	public static boolean setNeed(int CId, String need)
	{
		String sql="UPDATE Company SET Need='"+need+"' WHERE CompanyId="+CId;
		int i=insertOrUpdate(sql);
		if(i>0) {
			return true;
		}
		return false;
	}
	public static boolean changeStatus(String username){
		String sql="UPDATE User SET Status=0 WHERE Username='"+username+"'";
		int i=insertOrUpdate(sql);
		if(i>0) {
			return true;
		}
		return false;
	}
	public static boolean addVideo(int CId,String path){
		String sql="UPDATE Company SET Vid_Path='"+path+"' WHERE CompanyId="+CId;
		int i=insertOrUpdate(sql);
		if(i>0){
			return true;
		}
		return false;
	}
	public static boolean addBMData(String tag,String val,int CId,String bmname) {
		String sql="INSERT INTO BusinessModelData Values("+CId+",'"+tag+"','"+val+"','"+bmname+"')";
		int i=insertOrUpdate(sql);
		if(i>0) {
			return true;
		}
		return false;
	}
	public static boolean checkBMData(String tag, int CId,String bmname) {
		String sql="SELECT BMData FROM BusinessModelData WHERE BMTag='"+tag+"' AND BMName='"+bmname+"' AND CompanyId="+CId;
		ResultSet rs=selectQuery(sql);
		try {
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean updateBMData(String tag, String val, int CId, String bmname) {
		String sql="UPDATE BusinessModelData SET BMData='"+val+"' WHERE BMTag='"+tag+"' BMName='"+bmname+"' AND CompanyId="+CId;
		int i=insertOrUpdate(sql);
		if(i>0) {
			return true;
		}
		return false;
	}
	public static boolean checkBmVsCompanyId(int CId) {
		String sql="SELECT * FROM BusinessModelData WHERE CompanyId="+CId;
		ResultSet rs=selectQuery(sql);
		try {
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static Vector<String> getBMName(int CId) {
		Vector<String> bmname=new Vector<String>();
		String sql="SELECT BMName FROM BusinessModelData WHERE CompanyId="+CId;
		ResultSet rs=selectQuery(sql);
		try {
			while(rs.next()) {
				bmname.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bmname;
	}
	public static Vector<BusinessModelData> getBMData(int cid,String BMname) {
		Vector<BusinessModelData> bmd=new Vector<BusinessModelData>();
		String sql="SELECT * FROM BusinessModelData WHERE CompanyId="+cid+" AND BMName='"+BMname+"'";
		ResultSet rs=selectQuery(sql);
		BusinessModelData b=new BusinessModelData();
		try {
			while(rs.next()) {
				b.setBMName(BMname);
				b.setCompanyId(cid);
				b.setBMTag(rs.getString(3));
				b.setBMData(rs.getString(4));
				bmd.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bmd;
	}
	public static boolean setScore(int score[], int cid,String scoreval[]) {
		String sql="SELECT * FROM CompariScore WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		try {
			if(rs.next()) {
				sql="UPDATE CompariScore SET PopularityScore="+score[0]+" AND CustomerRelationshipScore="+score[1]+" AND CustomerSegmentScore="+score[2]+" AND ValuePropositionScore="+score[3]+" AND CompareWith='"+scoreval[0]+"' AND Popularity='"+scoreval[1]+"' AND CustomerRelationship='"+scoreval[2]+"' AND CustomerSegment='"+scoreval[3]+"' AND ValueProposition='"+scoreval[4]+"' WHERE CompanyId="+cid;
			}
			else {
				sql="INSERT INTO CompariScore VALUES("+cid+","+score[0]+","+score[1]+","+score[2]+","+score[3]+",'"+scoreval[0]+"','"+scoreval[1]+"','"+scoreval[2]+"','"+scoreval[3]+"','"+scoreval[4]+"')";
			}
			int i=insertOrUpdate(sql);
			if(i>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static CompariScore getScore(int cid) {
		CompariScore score=new CompariScore();
		String sql="SELECT * FROM CompariScore WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		try {
			if(rs.next()) {
				score.setCompanyId(rs.getInt(2));
				score.setPopularityScore(rs.getInt(3));
				score.setCustomerRelationshipScore(rs.getInt(4));
				score.setCustomerSegmentScore(rs.getInt(5));
				score.setValuePropositionsScore(rs.getInt(6));
				score.setComparisionWith(rs.getString(7));
				score.setPopularity(rs.getString(8));
				score.setCustomerRelationship(rs.getString(9));
				score.setCustomerSegment(rs.getString(10));
				score.setValueProposition(rs.getString(11));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return score;
	}
	public static boolean isScoreSet(int cid) {
		String sql="SELECT * FROM CompariScore WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		try {
			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean addFinancials(Financials fin) {
		String sql="INSERT INTO Financials VALUES("+fin.getCompanyId()+",'"+fin.getFinancial_Name()+"','"+fin.getFinancial_Type()+"',"+fin.getFinancialAmount()+",'"+fin.getDate()+"',"+fin.getSales()+","+fin.getMonth()+","+fin.getYear()+","+fin.getTotalCost()+","+fin.getTotalRev()+")";
		if(insertOrUpdate(sql)>0) {
			return true;
		}
		return false;
	}
	public static Vector<Financials> getFinancials(int cid) {
		Vector<Financials> finance=new Vector<Financials>();
		String sql="SELECT * FROM Financials WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		Financials fin=new Financials();
		try {
			while(rs.next()) {
				fin.setFinancialId(rs.getInt(1));
				fin.setCompanyId(rs.getInt(2));
				fin.setFinancial_Name(rs.getString(3));
				fin.setFinancial_Type(rs.getString(4));
				fin.setFinancialAmount(rs.getInt(5));
				fin.setDate(rs.getString(6));
				fin.setSales(rs.getInt(7));
				fin.setMonth(rs.getInt(8));
				fin.setYear(rs.getInt(9));
				fin.setTotalCost(rs.getInt(10));
				fin.setTotalRev(rs.getInt(11));
				finance.add(fin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return finance;
	}
	public static int getRevenue(int cid) {
		String sql="SELECT TotalRevenue FROM Financials WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		int rev=0;
		try {
			while(rs.next()) {
				 rev=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rev;
	}
	public static int getCost(int cid) {
		String sql="SELECT TotalCost FROM Financials WHERE CompanyId="+cid;
		ResultSet rs=selectQuery(sql);
		int cost=0;
		try {
			while(rs.next()) {
				cost=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cost;
	}
	public static boolean addQuery(Query q) {
		String sql="INSERT INTO Query VALUES('"+q.getName()+"','"+q.getEmail()+"','"+q.getMessage()+"')";
		if(insertOrUpdate(sql)>0) {
			return true;
		}
		return false;
	}
}