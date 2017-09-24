package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
	private Connection connectDB() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							"moviein", "moviein");		
		}catch (Exception e) {
			System.out.println("ConnectDB 예외 발생 - " + e);
		}
		return conn;
		}
	//아이디 중복 체크 메서드 
	public int checkDouble(String input, String col) {
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		int result = -1;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("SELECT "+ col + " FROM membership WHERE " +col+ " = '" + input+ "'");
			if(rs.next()) {
				result = 0; //아이디 중복
			}else {
				result = 1;
			}
		}catch (Exception e) {
			System.out.println("checkDouble 예외 발생 - "+ e);
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	//회원정도 입력 메서드
	public int register(MembershipVO memberVO) {
		Connection conn = connectDB();
		PreparedStatement st = null; 
		int result = 1;
		try {
			st = conn.prepareStatement("INSERT INTO membership VALUES(seq_ID.nextval, ?, ?, ?, ?, ?, sysdate)");
			st.setString(1, memberVO.getId());
			st.setString(2, memberVO.getName());
			st.setString(3, memberVO.getEmail());
			st.setString(4, memberVO.getPw());
			st.setString(5, memberVO.getPnum());
			int num = st.executeUpdate();
			if (num != 1)
				result = 0;
		} catch (Exception e) {
			System.out.println("register 예외발생 - " + e);
			result = 0;
		} finally {
			try{
				st.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public MembershipVO logIn(String id, String pw) {
		MembershipVO membershipVO = null;
		Connection conn = connectDB();
		PreparedStatement st = null; 
		ResultSet rs = null;
		try {
			st = conn.prepareStatement("SELECT * FROM membership where id = ? and pw = ?");
			st.setString(1, id);
			st.setString(2, pw);
			rs = st.executeQuery();
			if (rs.next()) {
				membershipVO = new MembershipVO();
				membershipVO.setSeq_ID(rs.getInt(1));
				membershipVO.setId(rs.getString(2));
				membershipVO.setName(rs.getString(3));
				membershipVO.setEmail(rs.getString(4));
				membershipVO.setPw(rs.getString(5));
				membershipVO.setPnum(rs.getString(6));
				membershipVO.setJoindate(rs.getString(7));
				return membershipVO;
			}
		} catch (Exception e) {
			System.out.println("logIn 예외발생 - " + e);
		} finally {
			try{
				rs.close();
				st.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return membershipVO;
	}
	public int membershipUpdate(MembershipVO memberVO) {
		int result = 0;
		Connection conn = connectDB();
		PreparedStatement st = null; 
		try {
			st = conn.prepareStatement("UPDATE membership SET pnum = ?, email = ?,pw = ? where id = ?");
			st.setString(1, memberVO.getPnum());
			st.setString(2, memberVO.getEmail());
			st.setString(3, memberVO.getPw());
			st.setString(4, memberVO.getId());
			result = st.executeUpdate();
			return result;
			
		} catch (Exception e) {
			System.out.println("MembershipVO 예외발생 - " + e);
		} finally {
			try{
				st.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int checkPw(String id, String pw) {
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		int result = -1;
		System.out.println("1");
		try {
			st = conn.createStatement();
			rs = st.executeQuery("SELECT * FROM membership WHERE id = '" + id + "' and pw = '" + pw +"'");
			if(rs.next()) {
				System.out.println("2");
				result = 1; //비밀번호 일치 
			}else {
				result = 0;
			}
		}catch (Exception e) {
			System.out.println("checkPw 예외 발생 - "+ e);
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int leave(String id) {
		Connection conn = connectDB();
		Statement st = null;
		int result = -1;
		try {
			st = conn.createStatement();
			result = st.executeUpdate("DELETE FROM membership WHERE id = '" + id + "'");
			return result;
		}catch (Exception e) {
			System.out.println("leave 예외 발생 - "+ e);
		}finally {
			try {
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public ArrayList<MyProVO> likelist(String id, String table){
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MyProVO> result = new ArrayList<MyProVO>();
		try {
			/*st = conn.prepareStatement("SELECT seq_PID FROM ? WHERE id = ?");
			st.setString(1, table);
			st.setString(2, id);
			적용불가? */
			st = conn.createStatement();
			rs = st.executeQuery("SELECT seq_PID FROM "+table+" WHERE id = '"+id+"'");
			ArrayList<Integer> seq_PID = new ArrayList<Integer>();
			while(rs.next()) {
				seq_PID.add(rs.getInt(1));
			}
			System.out.println(seq_PID);
			for (Integer pid : seq_PID) {
				st = conn.createStatement();
				rs = st.executeQuery("SELECT seq_PID, proj, imgurl FROM project WHERE seq_PID = "+pid);
				while(rs.next()) {
					MyProVO myproVO = new MyProVO();
					myproVO.setSeq_PID(rs.getInt(1));
					myproVO.setProj(rs.getString(2));
					myproVO.setImgurl(rs.getString(3));
					result.add(myproVO);
				}
			}
		}catch(Exception e) {
			System.out.println("likelist 예외발생 -- "+ e);
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public ArrayList<MyProVO> investlist(String id, String table){
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		ArrayList<MyProVO> result = new ArrayList<MyProVO>();
		try {
			/*st = conn.prepareStatement("SELECT seq_PID FROM ? WHERE id = ?");
			st.setString(1, table);
			st.setString(2, id);
			적용불가? */
			st = conn.createStatement();
			rs = st.executeQuery("SELECT seq_PID, m_invest FROM "+table+" WHERE id = '"+id+"'");
			ArrayList<MyProVO> investProj = new ArrayList<MyProVO>();
			while(rs.next()) {
				MyProVO myproVO = new MyProVO();
				myproVO.setSeq_PID(rs.getInt(1));
				myproVO.setM_invest(rs.getInt(2));
				investProj.add(myproVO);
			}
			for (MyProVO investVO : investProj) {
				st = conn.createStatement();
				rs = st.executeQuery("SELECT seq_PID, proj, imgurl FROM project WHERE seq_PID = "+investVO.getSeq_PID());
				int m_invest = investVO.getM_invest();
				if(rs.next()) {
					MyProVO myproVO2 = new MyProVO();
					myproVO2.setSeq_PID(rs.getInt(1));
					myproVO2.setProj(rs.getString(2));
					myproVO2.setImgurl(rs.getString(3));
					myproVO2.setM_invest(m_invest);
					result.add(myproVO2);
				}
			}
		}catch(Exception e) {
			System.out.println("investlist 예외발생 -- "+ e);
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int cancelLike(String id, int seq_PID) {
		Connection conn = connectDB();
		Statement st = null;
		int result = -1;
		try {
			st = conn.createStatement();
			result = st.executeUpdate("DELETE FROM likeproject WHERE id = '" + id + "' and seq_PID = "+seq_PID);
			return result;
		}catch (Exception e) {
		System.out.println("cancelLike 예외 발생 - "+ e);
	}finally {
		try {
			st.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return result;
	}
	public int cancelInvest(String id, int seq_PID) {
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null; 
		int result = -1;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("SELECT m_invest FROM investproject WHERE id = '"+id+ "' and seq_PID = "+seq_PID);
			int m_invest = 0;
			if(rs.next()) {
				m_invest = rs.getInt(1);
			}
			int result1 = st.executeUpdate("DELETE FROM investproject WHERE id = '"+id+ "' and seq_PID = "+seq_PID);
			int result2 = st.executeUpdate("UPDATE project SET m_collected = m_collected - "+ m_invest + "WHERE seq_PID = "+seq_PID);
			return result1+result2;
		}catch (Exception e){
			System.out.println("cancelInvest에러 발생 --" + e);
		}finally {
			try {
				rs.close();
				st.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}

