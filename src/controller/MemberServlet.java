package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MembershipVO;
import model.MyProVO;

@WebServlet("/Member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		MemberDAO memberDAO = new MemberDAO();
		if (action != null) {
			String url = "";
			if (action.equals("move")) {
				url = "/index.jsp";
				
			}else if(action.equals("logout")) {
				request.getSession().removeAttribute("logOn");
				url = "/index.jsp";
			}else if (action.equals("likelist")) {
				String table = "likeProject";
				MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
				ArrayList<MyProVO> result = memberDAO.likelist(memberVO.getId(), table);
				System.out.println(result);
				request.setAttribute("likelist", result);
				url = "/likelist.jsp";
			}else if (action.equals("investlist")){
				String table = "investProject";
				MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
				ArrayList<MyProVO> result = memberDAO.investlist(memberVO.getId(), table);
				System.out.println(result);
				request.setAttribute("investlist", result);
				url = "/investlist.jsp";
			}else if (action.equals("cancellike")) {
				int seq_PID = Integer.parseInt(request.getParameter("seq_PID"));
				MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
				int result = memberDAO.cancelLike(memberVO.getId(), seq_PID);
				request.setAttribute("canceled", result); //개선필요. result객체 필요 없음
				String table = "likeProject";
				ArrayList<MyProVO> list = memberDAO.likelist(memberVO.getId(), table);
				request.setAttribute("likelist", list);
				url = "/likelist.jsp";
			}else if (action.equals("cancelinvest")) {
				int seq_PID = Integer.parseInt(request.getParameter("seq_PID"));
				MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
				int result = memberDAO.cancelInvest(memberVO.getId(), seq_PID);
				System.out.println(result);
				if (result == 2) {
					request.getSession().setAttribute("messageType", "확인메시지");
					request.getSession().setAttribute("messageContent", "투자가 취소되었습니다.");
				}
				String table = "investProject";
				ArrayList<MyProVO> list = memberDAO.investlist(memberVO.getId(), table);
				request.setAttribute("investlist", list);
				url = "/investlist.jsp";
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MemberDAO memberDAO = new MemberDAO();
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equals("register")) {
				// 회원정보 파라미터 가져오기
				String id = request.getParameter("id");
				String pw = request.getParameter("pw1");
				String name = request.getParameter("name");
				String pnum = request.getParameter("pnum");
				String email_1 = request.getParameter("email_1");
				String email_2 = request.getParameter("email_2");
				String email_3 = request.getParameter("email_3");
				System.out.println(email_2);
				System.out.println(email_3);
				String email = "";
				if (email_2 == null) {
					email = email_1 + "@" + email_3;
				}else {
					email = email_1 + "@" + email_2;
				}
				// 회원정보 INSERT하는 DAO메서드 호출
				
				MembershipVO memberVO = new MembershipVO();
				memberVO.setId(id);
				memberVO.setPw(pw);
				memberVO.setName(name);
				memberVO.setPnum(pnum);
				memberVO.setEmail(email);
				int result = memberDAO.register(memberVO);
				// 회원가입 성공한 경우
				if (result == 1) {
					request.getSession().setAttribute("messageType", "성공메시지");
					request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
					response.sendRedirect("register.jsp");
					return;
				} else {
					request.getSession().setAttribute("messageType", "오류메시지");
					request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
					response.sendRedirect("register.jsp");
					return;
				}
			// 아이디 중복 체크
			} else if (action.equals("registerCheck")) {
				String id = request.getParameter("id");
				String col = "id";
				response.getWriter().write(new MemberDAO().checkDouble(id, col) + "");
			//로그인
			} else if (action.equals("login")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				MembershipVO logOn = memberDAO.logIn(id, pw);
				if (logOn != null) {
					request.getSession().setAttribute("logOn", logOn);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else {
					request.getSession().setAttribute("messageType", "오류메시지");
					request.getSession().setAttribute("messageContent", "로그인 정보를 다시 한번 확인해주세요.");
					response.sendRedirect("login.jsp");
					return;
				}
			} else if (action.equals("modify_basic")) {
				String pnum = request.getParameter("pnum");
				String email_1 = request.getParameter("email_1");
				String email_2 = request.getParameter("email_2");
				String email_3 = request.getParameter("email_3");
				System.out.println(pnum);
				System.out.println(email_2);
				System.out.println(email_3);
				String email = "";
				if (email_2 == null) {
					email = email_1 + "@" + email_3;
				}else {
					email = email_1 + "@" + email_2;
				}
				//로그인 객체 수정
				MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
				memberVO.setPnum(pnum);
				memberVO.setEmail(email);
				//회원정보 수정 
				int result = memberDAO.membershipUpdate(memberVO);
				if (result == 1) {
					request.getSession().setAttribute("messageType", "확인메시지");
					request.getSession().setAttribute("messageContent", "회원정보가 성공적으로 수정되었습니다.");
					response.sendRedirect("mypage2.jsp");
					return;
				}else {
					System.out.println("회원정보 수정 오류발생");
				}
				}else if (action.equals("modify_pw")) {
					//기존 비밀번호 일치 확인
					 String pw = request.getParameter("pw");
					 MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
					 String id = memberVO.getId();
					 int result = memberDAO.checkPw(id, pw);
					 System.out.println(result);
					 //비밀번호 일치 확인 
					 if (result == 1) {
						 String pw_new = request.getParameter("pw1");
						 memberVO.setPw(pw_new);
						 memberDAO.membershipUpdate(memberVO);
						 request.getSession().setAttribute("messageType", "성공메시지");
							request.getSession().setAttribute("messageContent", "비밀번호가 성공적으로 수정되었습니다.");
							response.sendRedirect("mypage3.jsp");
							return;
					 }else {
						
								request.getSession().setAttribute("messageType", "오류메시지");
								request.getSession().setAttribute("messageContent", "기존 비밀번호를 다시 확인해주세요.");
								response.sendRedirect("mypage3.jsp");
								return;
							
					 }
				}else if (action.equals("leave")) {
					String pw = request.getParameter("pw");
					MembershipVO memberVO = (MembershipVO)request.getSession().getAttribute("logOn");
					String id = memberVO.getId();
					int result = memberDAO.checkPw(id, pw);
					if (result == 1) {
						request.getSession().removeAttribute("logOn");
						 request.getSession().setAttribute("messageType", "성공메시지");
							request.getSession().setAttribute("messageContent", "다음에 또 만나요");
							response.sendRedirect("mypage4.jsp");
							return;
					 }else {
						
								request.getSession().setAttribute("messageType", "오류메시지");
								request.getSession().setAttribute("messageContent", "비밀번호를 다시 확인해주세요.");
								response.sendRedirect("mypage4.jsp");
								return;
					 }
				}
		}
	}
}

