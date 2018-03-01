package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateBloodBank
 */
@WebServlet("/UpdateBloodBank")
public class UpdateBloodBank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBloodBank() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		int status=Integer.parseInt(request.getParameter("status"));
		String bloodGroup=request.getParameter("bloodgroup");
		
		int currentStatus=dao.BloobBank.getStatus(id);
		if (status<=currentStatus) {
			request.setAttribute("message", "you entered wrong value !!");
			request.getRequestDispatcher("nurse/editBloodBank.jsp").forward(request, response);
		}else{
			Connection connection=dbConnector.DbConnector.getConnection();
			try {
				String sql="update blood_bank set status='"+status+"' where id='"+id+"'";
				PreparedStatement pStatement=connection.prepareStatement(sql);
				int i=pStatement.executeUpdate();
				if(i>0) {
					request.setAttribute("message", "update blood Bank !!");
					request.getRequestDispatcher("nurse/editBloodBank.jsp").forward(request, response);
				}
				else {
					request.setAttribute("message", "update failed !!");
					request.getRequestDispatcher("nurse/editBloodBank.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
