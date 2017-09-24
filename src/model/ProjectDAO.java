package model;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
public class ProjectDAO {
	// Connection ��ü�� ��������. -> ���� dao ��� ����� ���� connection pool�� ��ü����.
	private Connection connectDB() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "moviein", "moviein");
		} catch (Exception e) {
			System.out.println("ConnectDB() : " + e);
		}
		return conn;
	}
	
	// sort�� �Է� ������ �� : "cnt desc"(ū�ſ��� ������), "enddate", "writedate", "m_collected desc", "pna desc nulls last"
	//						��ȸ�� ���� �� 			        �����ӹ�          ���ۼ�		    ����� �� ���� ��.	 		���������
	public ArrayList<ProjectVO> listAll(String sorting) {
		ArrayList<ProjectVO> projectList = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			// seq_PID(������Ʈ id), ����� id, ������Ʈ��, imgurl���� ����
			// level_ �� status�� 3�� �͸� �ް� �Ű������� ���� ���� ������ �޸��Ͽ� ArrayList�� ������� ��Ƽ� �����.
			rs = st.executeQuery("select seq_PID, id, proj, imgurl, inv_type, purpose, to_char(enddate,'yyyy-mm-dd'), to_char(writedate, 'yyyy-mm-dd'), cnt, pna, m_collected from project where level_ = 3 and status = 3 order by " + sorting);
			ProjectVO vo = null;
			projectList = new ArrayList<ProjectVO>();
			while (rs.next()) {
				vo = new ProjectVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setProj(rs.getString(3));
				vo.setImgurl(rs.getString(4));
				vo.setInv_type(rs.getString(5));
				vo.setPurpose(rs.getString(6));
				vo.setEnddate(rs.getString(7));
				vo.setWritedate(rs.getString(8));
				vo.setCnt(rs.getInt(9));
				vo.setPna(rs.getInt(10));
				vo.setM_collected(rs.getInt(11));
				projectList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("listAll : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return projectList;
	}
	
	// FilterVO�� ���� ������. ������Ʈ �ѷ����� �ÿ� FilterVO�� ���� �̿��Ͽ� ������Ʈ list�� �����.
	public ArrayList<FilterVO> listFilter(String sorting) {
		ArrayList<FilterVO> filterList = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			// seq_PID(������Ʈ id), ����� id, ������Ʈ��, imgurl���� ����
			// level_ �� status�� 3�� �͸� �ް� �Ű������� ���� ���� ������ �޸��Ͽ� ArrayList�� ������� ��Ƽ� �����.
			rs = st.executeQuery("select movie.seq_PID, id, proj, imgurl, inv_type, purpose, genre1, genre2, genre3 from project, movie where project.seq_pid = movie.seq_pid and level_ = 3 and status = 3 order by " + sorting);
			FilterVO vo = null;
			filterList = new ArrayList<FilterVO>();
			while (rs.next()) {
				vo = new FilterVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setProj(rs.getString(3));
				vo.setImgurl(rs.getString(4));
				vo.setInv_type(rs.getString(5));
				vo.setPurpose(rs.getString(6));
				vo.setGenre1(rs.getString(7));
				vo.setGenre2(rs.getString(8));
				vo.setGenre3(rs.getString(9));
				filterList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("listAll : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return filterList;
	}
	// �˻���� dao. �˻�� �Է��ϸ� ������Ʈ �̸� �� �� keyword�� �� ���ڸ� ã����.
	public ArrayList<ProjectVO> search(String keyword) {
		ArrayList<ProjectVO> projectList = null;
		Connection conn = connectDB();
		String query = "select seq_PID, id, proj, imgurl, inv_type, purpose from project where level_ = 3 and status = 3 and proj like '%" + keyword + "%'";
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(query);
			ProjectVO vo = null;
			projectList = new ArrayList<ProjectVO>();
			while (rs.next()) {
				vo = new ProjectVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setProj(rs.getString(3));
				vo.setImgurl(rs.getString(4));
				vo.setInv_type(rs.getString(5));
				vo.setPurpose(rs.getString(6));
				projectList.add(vo);
			}
		} catch (Exception e) {
			System.out.println("search : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return projectList;
	}
	
	// project�� ���� �� ���������� ó������ ������ ���� ������ ����ϱ� ���� projectDB�� ��� ������ ����.
	public ProjectVO listOneProject(int seq_PID) {
		ProjectVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_PID, id, proj, m_target, m_collected, enddate, cnt, writedate, m_min, m_max, inv_type, pna, level_, purpose, status, imgurl from project where level_ = 3 and status = 3 and seq_pid = " + seq_PID);
			vo = new ProjectVO();
			if (rs.next()) {
				vo.setSeq_PID(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setProj(rs.getString(3));
				vo.setM_target(rs.getInt(4));
				vo.setM_collected(rs.getInt(5));
				vo.setEnddate(rs.getString(6));
				vo.setCnt(rs.getInt(7));
				vo.setWritedate(rs.getString(8));
				vo.setM_min(rs.getInt(9));
				vo.setM_max(rs.getInt(10));
				vo.setInv_type(rs.getString(11));
				vo.setPna(rs.getInt(12));
				vo.setLevel_(rs.getInt(13));
				vo.setPurpose(rs.getString(14));
				vo.setStatus(rs.getInt(15));
				vo.setImgurl(rs.getString(16));
			}
		} catch (Exception e) {
			System.out.println("listOne : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	// �޼��� ���� �������� ���� ������Ʈ�� ���� ��� True, ���� ��� False
	public boolean likeProjectChange(int seq_PID, String id) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_pid, id from likeproject where seq_PID = " + seq_PID + " and id = '" + id +"'");
			System.out.println("11");
			if (rs.next()) {
				System.out.println("12");
				st.executeUpdate("delete from likeproject where seq_pid = " + rs.getInt(1) + " and id = '" + rs.getString(2) + "'");
			} else {
				System.out.println("13");
				st.executeUpdate("insert into likeproject(seq_pid, id) values (" + seq_PID + ", '" + id + "')");
				result = true;
			}
		} catch (Exception e) {
			System.out.println("likeProjectChange : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ���� ������Ʈ�� �ִ��� �������� Ȯ����.
	public boolean likeProjectCheck(int seq_PID, String id) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			System.out.println(111);
			rs = st.executeQuery("select seq_pid, id from likeproject where seq_PID = " + seq_PID + " and id = '" + id + "'");
			System.out.println(112);
			if (rs.next()) {
				System.out.println(113);
				result = true;
			}
		} catch (Exception e) {
			System.out.println("likeProjectCheck : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// boolean insertPrice(seq_PID, id, m_invest) �����ϱ� ���� �� ����.
	// price�� �ּ� �ִ밪�� input ���� min, max �Ӽ�? ���� �ɷ�?
	public boolean insertInvest(int seq_PID, String id, int m_invest) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		try {
			st = conn.prepareStatement("insert into investProject(seq_pid, id, m_invest) values (?, ?, ?)");
			st.setInt(1, seq_PID);
			st.setString(2, id);
			st.setInt(3, m_invest);
			st.executeUpdate();
			st1 = conn.prepareStatement("update project set m_collected = m_collected + ? where seq_pid = ?");
			st1.setInt(1, m_invest);
			st1.setInt(2, seq_PID);
			st1.executeUpdate();
			result = true;
		} catch (Exception e) {
			System.out.println("insertPrice : " + e);
		} finally {
			try {
				st.close();
				st1.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ���� ���ڸ� �߾����� Ȯ���ϴ� DAO
	public boolean investCheck(int seq_PID, String id) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
//		String query = "select * from investProject where seq_pid = " + seq_PID + " and id = " + id;
//		System.out.println(query);
		try {
			st = conn.createStatement();
//			rs = st.executeQuery(query);
			rs = st.executeQuery("select * from investProject where seq_pid = " + seq_PID + " and id = '" + id + "'");
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("investCheck : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// CompanyVO companyInfo(seq_PID) - ������� �ҷ�����
	public CompanyVO companyInfo(int seq_PID) {
		CompanyVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_CID, seq_pid, id, c_name, c_location, to_char(c_date,'yyyy\"��\" mm\"��\" dd\"��\"'), c_eoname, c_emp, c_crime, c_site, c_mail from company where seq_pid = " + seq_PID);
			vo = new CompanyVO();
			if (rs.next()) {
				vo.setSeq_CID(rs.getInt(1));
				vo.setSeq_PID(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setC_name(rs.getString(4));
				vo.setC_location(rs.getString(5));
				vo.setC_date(rs.getString(6));
				vo.setC_eoname(rs.getString(7));
				vo.setC_emp(rs.getInt(8));
				vo.setC_crime(rs.getString(9));
				vo.setC_site(rs.getString(10));
				vo.setC_mail(rs.getString(11));
			}
		} catch (Exception e) {
			System.out.println("companyInfo : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	// MovieVO movieInfo(seq_PID) - ��ȭ���� �ҷ�����
	public MovieVO movieInfo(int seq_PID) {
		MovieVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_pid, title, genre1, genre2, genre3, director, actor1, actor2, actor3, actor4, production, distributor, to_char(releasedate,'yyyy\"��\" mm\"��\" dd\"��\"'), origin_title, importer from movie where seq_pid = " + seq_PID);
			vo = new MovieVO();
			if (rs.next()) {
				vo.setSeq_PID(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setGenre1(rs.getString(3));
				vo.setGenre2(rs.getString(4));
				vo.setGenre3(rs.getString(5));
				vo.setDirector(rs.getString(6));
				vo.setActor1(rs.getString(7));
				vo.setActor2(rs.getString(8));
				vo.setActor3(rs.getString(9));
				vo.setActor4(rs.getString(10));
				vo.setProduction(rs.getString(11));
				vo.setDistributor(rs.getString(12));
				vo.setReleasedate(rs.getString(13));
				vo.setOrigin_title(rs.getString(14));
				vo.setImporter(rs.getString(15));
			}
		} catch (Exception e) {
			System.out.println("movieInfo : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	// ProjectVO���� inv_type�� ����
	// ArrayList<InterestVO> interestInfo(seq_PID) or ArrayList<RewardVO> rewardInfo(seq_PID) �� ȣ���Ͽ� ������ ����.
	public ArrayList<InterestVO> interestInfo(int seq_PID) {
		ArrayList<InterestVO> list = null;
		InterestVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_pid, audience, interest from interest where seq_pid = " + seq_PID + " order by audience");
			list = new ArrayList<InterestVO>(); 
			while (rs.next()) {
				vo = new InterestVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setAudience(rs.getInt(2));
				vo.setInterest(rs.getInt(3));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("interestInfo : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public ArrayList<RewardVO> rewardInfo(int seq_PID) {
		ArrayList<RewardVO> list = null;
		RewardVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_pid, std_invest, reward from reward where seq_pid = " + seq_PID + " order by std_invest");
			list = new ArrayList<RewardVO>();
			while (rs.next()) {
				vo = new RewardVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setStd_invest(rs.getInt(2));
				vo.setReward(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("rewardInfo : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// ArrayList<NewsVO> listNews(int seq_PID) : ���ҽ� �۵� ���
	// group�� ���� ����(���ҽ��� �ֱٿ� �ۼ��� ������ �켱 ����)
	// �� ���� depth ������ �����ؼ� ��ۺ��� �ۼ����� ���� �� �� �ְ� ����
	// �� ���� n_date �� �����ؼ� ���� ���� ����� ���� �� �� �ְ� ��.
	public ArrayList<NewsVO> listNews(int seq_PID) {
		ArrayList<NewsVO> list = null;
		NewsVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_NNO, seq_PID, id, n_contents, n_date, n_depth, n_group, n_imgurl, n_videourl from news where seq_pid = " + seq_PID + " order by n_group desc, depth, n_date");
			list = new ArrayList<NewsVO>();
			while (rs.next()) {
				vo = new NewsVO();
				vo.setSeq_NNO(rs.getInt(1));
				vo.setSeq_PID(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setN_contents(rs.getString(4));
				vo.setN_date(rs.getString(5));
				vo.setN_depth(rs.getInt(6));
				vo.setN_group(rs.getInt(7));
				vo.setN_imgurl(rs.getString(8));
				vo.setN_videourl(rs.getString(9));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("listNews : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// boolean insertNewsReply(NewsVO vo) : ���ҽĿ� ��� �ޱ�
	public boolean insertNewsReply(NewsVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("insert into news(seq_NNO, seq_pid, id, n_contents, n_date, n_depth, n_group) values(?,?,?,?,?,?,?)");
			st.setInt(1, vo.getSeq_NNO());
			st.setInt(2, vo.getSeq_PID());
			st.setString(3, vo.getId());
			st.setString(4, vo.getN_contents());
			st.setString(5, vo.getN_date());
			st.setInt(6, vo.getN_depth());
			st.setInt(7, vo.getN_group());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("insertNewsReply : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public boolean deleteNewsReply(int seq_NNO) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		try {
			st = conn.createStatement();
			int num = st.executeUpdate("delete from news where seq_nno = " + seq_NNO); 
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("deleteNews : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public boolean updateNewsReply(NewsVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("update news set n_contents=? where seq_NNO = ?"); 
			st.setString(1, vo.getN_contents());
			st.setInt(2, vo.getSeq_NNO());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("updateNewsReply : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ������ - ���ҽ� ����
	public boolean insertNews(NewsVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("insert into news(seq_NNO, seq_pid, id, n_contents, n_date, n_depth, n_group, n_imgurl, n_videourl) values(?,?,?,?,?,?,?,?,?)");
			st.setInt(1, vo.getSeq_NNO());
			st.setInt(2, vo.getSeq_PID());
			st.setString(3, vo.getId());
			st.setString(4, vo.getN_contents());
			st.setString(5, vo.getN_date());
			st.setInt(6, vo.getN_depth());
			st.setInt(7, vo.getN_group());
			st.setString(8, vo.getN_imgurl());
			st.setString(9, vo.getN_videourl());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("insertNews : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ������ - ���ҽ� ����
	public boolean deleteNews(int seq_NNO) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		try {
			st = conn.createStatement();
			int num = st.executeUpdate("delete from news where n_group = " + seq_NNO); 
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("deleteNews : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ������ - ���ҽ� ����
	public boolean updateNews(NewsVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("update news set n_contents=?, n_date=?, n_imgurl=?, n_videourl=? where seq_NNO = ?"); 
			st.setString(1, vo.getN_contents());
			st.setString(2, vo.getN_date());
			st.setString(3, vo.getN_imgurl());
			st.setString(4, vo.getN_videourl());
			st.setInt(5, vo.getSeq_NNO());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("updateNews : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// �ǵ�� ���� ���̱�
	public ArrayList<FeedbackVO> listFeedback(int seq_PID) {
		ArrayList<FeedbackVO> list = null;
		FeedbackVO vo = null;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select seq_FNO, seq_PID, f_contents, f_date, depth, f_group, id from feedback where seq_pid = " + seq_PID + " order by f_group, depth");
			list = new ArrayList<FeedbackVO>();
			while (rs.next()) {
				vo = new FeedbackVO();
				vo.setSeq_FNO(rs.getInt(1));
				vo.setSeq_PID(rs.getInt(2));
				vo.setF_contents(rs.getString(3));
				vo.setF_date(rs.getString(4));
				vo.setDepth(rs.getInt(5));
				vo.setF_group(rs.getInt(6));
				vo.setId(rs.getString(7));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("listFeedback : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// �ǵ�� �ø���
	public boolean insertFeedback(FeedbackVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("insert into feedback(seq_FNO, seq_PID, f_contents, f_date, depth, f_group, id) values(?,?,?,?,?,?,?)");
			st.setInt(1, vo.getSeq_FNO());
			st.setInt(2, vo.getSeq_PID());
			st.setString(3, vo.getF_contents());
			st.setString(4, vo.getF_date());
			st.setInt(5, vo.getDepth());
			st.setInt(6, vo.getF_group());
			st.setString(7, vo.getId());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("insertFeedback : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//�ǵ�� ����
	public boolean deleteFeedback(int seq_FNO) {
		boolean result = false;
		Connection conn = connectDB();
		Statement st = null;
		try {
			st = conn.createStatement();
			int num = st.executeUpdate("delete from feedback where seq_fno = " + seq_FNO); 
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("deleteFeedback : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// feedback ����
	public boolean updateFeedback(FeedbackVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("update Feedback set f_contents=? where seq_FNO = ?"); 
			st.setString(1, vo.getF_contents());
			st.setInt(2, vo.getSeq_FNO());
			int num = st.executeUpdate();
			if (num != 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println("updateNews : " + e);
		} finally {
			try {
				st.close();
				conn.close(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//������Ʈ ���������� Ȯ��
	public ProjectVO checkProject(String id) {
		ProjectVO vo = null;
		Connection conn = connectDB();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement("select seq_PID, level_, inv_type from project where id = ? and status = 0");
			st.setString(1, id);
			rs = st.executeQuery();
			if (rs.next()) {
				vo = new ProjectVO();
				vo.setSeq_PID(rs.getInt(1));
				vo.setLevel_(rs.getInt(2));
				vo.setInv_type(rs.getString(3));
			}
		} catch (Exception e) {
			System.out.println("checkProject : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	// ������Ʈ����(project DB)�� �ڷ� �ø���
	public int insertProject(ProjectVO vo) {
		int result = -1;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		ResultSet rs = null;
		// vo�� �ִ� ���� DB�� insert ���ɾ ���� �ֱ�.
		try {
			st = conn.prepareStatement("insert into project values(seq_PID.nextval,?,?,?,0,?,0,sysdate,?,?,?,-1,0,?,0,?)");
			st.setString(1, vo.getId());
			st.setString(2, vo.getProj());
			st.setInt(3, vo.getM_target());
			st.setString(4, vo.getEnddate());
			st.setInt(5, vo.getM_min());
			st.setInt(6, vo.getM_max());
			st.setString(7, vo.getInv_type());
			st.setString(8, vo.getPurpose());
			st.setString(9, vo.getImgurl());
			st.executeQuery();
			st1 = conn.prepareStatement("select seq_PID from project where proj = ?");
			st1.setString(1, vo.getProj());
			rs = st1.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("insertProject : " + e);
		} finally {
			try {
				rs.close();
				st1.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// ������Ʈ�� inv_type 'R'�϶�, reward DB�� �ڷ� �ø���
	public boolean insertReward(ArrayList<RewardVO> list) {
		boolean result = true;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		try {
			for (int i = 0; i < list.size(); ++i) {
				st = conn.prepareStatement("insert into reward values(?, ?, ?)");
				st.setInt(1, list.get(i).getSeq_PID());
				st.setInt(2, list.get(i).getStd_invest());
				st.setString(3, list.get(i).getReward());
				st.executeUpdate();
			}
			st1 = conn.prepareStatement("update project set level_ = 1 where seq_PID = ?");
			st1.setInt(1,list.get(0).getSeq_PID());
			st1.executeUpdate();
			result = true;
		} catch (Exception e) {
			System.out.println("insertReward : " + e);
		} finally {
			try {
				st.close();
				st1.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	// ������Ʈ�� inv_type 'I'�϶�, interest DB�� �ڷ� �ø���
	public boolean insertInterest(ArrayList<InterestVO> list) {
		boolean result = true;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		try {
			for (int i = 0; i < list.size(); ++i) {
				st = conn.prepareStatement("insert into interest values(?, ?, ?)");
				st.setInt(1, list.get(i).getSeq_PID());
				st.setInt(2, list.get(i).getAudience());
				st.setInt(3, list.get(i).getInterest());
				st.executeUpdate();
			}
			st1 = conn.prepareStatement("update project set level_ = 1 where seq_PID = ?");
			st1.setInt(1,list.get(0).getSeq_PID());
			st1.executeUpdate();
			result = true;
			result = true;
		} catch (Exception e) {
			System.out.println("insertInterest : " + e);
		} finally {
			try {
				st.close();
				st1.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	// ��ȭ����(movie DB)�� �ڷ� �ø���
	public boolean insertMovie(MovieVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		// vo�� �ִ� ���� DB�� insert ���ɾ ���� �ֱ�.
		try {
			st = conn.prepareStatement("insert into movie values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			st.setInt(1, vo.getSeq_PID());
			st.setString(2, vo.getTitle());
			st.setString(3, vo.getGenre1());
			st.setString(4, vo.getGenre2());
			st.setString(5, vo.getGenre3());
			st.setString(6, vo.getDirector());
			st.setString(7, vo.getActor1());
			st.setString(8, vo.getActor2());
			st.setString(9, vo.getActor3());
			st.setString(10, vo.getActor4());
			st.setString(11, vo.getProduction());
			st.setString(12, vo.getDistributor());
			st.setString(13, vo.getReleasedate());
			st.setString(14, vo.getOrigin_title());
			st.setString(15, vo.getImporter());
			st.executeQuery();
			st1 = conn.prepareStatement("update project set level_ = 3, status = 1 where seq_PID = ?");
			st1.setInt(1,vo.getSeq_PID());
			st1.executeUpdate();
			result = true;
		} catch (Exception e) {
			System.out.println("insertMovie : " + e);
		} finally {
			try {
				st.close();
				st1.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// �������(company DB)�� �ڷ� �ø���
	public boolean insertCompany(CompanyVO vo) {
		boolean result = false;
		Connection conn = connectDB();
		PreparedStatement st = null;
		PreparedStatement st1 = null;
		// vo�� �ִ� ���� DB�� insert ���ɾ ���� �ֱ�.
		try {
			st = conn.prepareStatement("insert into company values(seq_CID.nextval,?,?,?,?,?,?,?,?,?,?)");
			st.setInt(1, vo.getSeq_PID());
			st.setString(2, vo.getId());
			st.setString(3, vo.getC_name());
			st.setString(4, vo.getC_location());
			st.setString(5, vo.getC_date());
			st.setString(6, vo.getC_eoname());
			st.setInt(7, vo.getC_emp());
			st.setString(8, vo.getC_crime());
			st.setString(9, vo.getC_site());
			st.setString(10, vo.getC_mail());
			st.executeQuery();
			st1 = conn.prepareStatement("update project set level_ = 2 where seq_PID = ?");
			st1.setInt(1,vo.getSeq_PID());
			st1.executeUpdate();
			result = true;
		} catch (Exception e) {
			System.out.println("insertCompany : " + e);
		} finally {
			try {
				st.close();
				st1.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int investorNumber(int seq_PID) {
		int result = 0;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select count(id) from investProject where seq_pid = " + seq_PID);
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("investorNumber : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public int remainingDay(int seq_PID) {
		int result = 0;
		Connection conn = connectDB();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery("select enddate - sysdate from project where seq_pid = " + seq_PID);
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("investorNumber : " + e);
		} finally {
			try {
				rs.close();
				st.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	
}