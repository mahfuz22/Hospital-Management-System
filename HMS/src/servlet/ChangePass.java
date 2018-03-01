package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class changePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String ppass=request.getParameter("ppass");
		String userMail=request.getParameter("userMail");
		String nPass=request.getParameter("npass");
		String mainPass="";
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="select password from nurse where email='"+userMail+"'";
			PreparedStatement psPreparedStatement=connection.prepareStatement(sql);
			ResultSet rSet=psPreparedStatement.executeQuery();
			while(rSet.next()) {
				mainPass=rSet.getString("password");
			}
			
			if (ppass.equals(mainPass)) {
				String sql1="update nurse set password='"+nPass+"' where email='"+userMail+"'";
				PreparedStatement ps2=connection.prepareStatement(sql1);
				int i=ps2.executeUpdate();
				if (i>0) {
					request.setAttribute("message", "Password changed !!! ");
					request.getRequestDispatcher("nurse/nurseProfile.jsp").forward(request, response);
				}else {
					request.setAttribute("message", "Password not changed !!! ");
					request.getRequestDispatcher("nurse/nurseProfile.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("message", "Your previous password is not Correct !!! ");
				request.getRequestDispatcher("nurse/nurseProfile.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
