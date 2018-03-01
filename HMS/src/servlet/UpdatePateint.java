package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.ScatteringByteChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePateint
 */
@WebServlet("/UpdatePateint")
public class UpdatePateint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePateint() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		int phone=Integer.parseInt(request.getParameter("phone"));
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update patient set p_name='"+name+"', p_email='"+email+"', p_address='"+address+"', p_phone='"+phone+"' where p_id='"+id+"'";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			int i=pStatement.executeUpdate();
			if(i>0) {
				request.setAttribute("message", "update patient info !!");
				request.getRequestDispatcher("nurse/patient.jsp?page=1").forward(request, response);
			}
			else {
				request.setAttribute("message", "update failed !!");
				request.getRequestDispatcher("nurse/patient.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
