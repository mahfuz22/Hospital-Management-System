package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStuffInfo
 */
@WebServlet("/AddStuffInfo")
public class AddStuffInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStuffInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String stuffName=request.getParameter("stName");
		String stuffEmail=request.getParameter("stEmail");
		String gender=request.getParameter("stGender");
		String password=request.getParameter("stPass");
		String addr=request.getParameter("stAddr");
		String stPhone=request.getParameter("stPhone");
		
		//out.println("<h1>"+stuffName+"</h1>");
		
		//storing the data in database
		Connection connection=null;
		Statement statement=null;
		connection=dbConnector.DbConnector.getConnection();
		try {
			statement=connection.createStatement();
			String sql="insert into stuff (st_name, email, gender, password, address, phone)"
					+ " values('"+stuffName+"', '"+stuffEmail+"', '"+gender+"', '"+password+"', '"+addr+"', '"+stPhone+"')";
			int i=statement.executeUpdate(sql);
			if(i>0) {
				request.setAttribute("message", "stuff information stored !!!");
				request.getRequestDispatcher("stuff/addStuff.jsp").forward(request, response);
			}else {
				request.setAttribute("message", "stuff information not stored !!!");
				request.getRequestDispatcher("stuff/addStuff.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
