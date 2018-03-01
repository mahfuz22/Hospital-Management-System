package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class nurseAddPatient
 */
@WebServlet("/nurseAddPatient")
public class nurseAddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nurseAddPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String pName=request.getParameter("pname");
		String pEmail=request.getParameter("pemail");
		String pPass=request.getParameter("ppass");
		String pAddr=request.getParameter("paddr");
		String pPhone=request.getParameter("pphone");
		String pGender=request.getParameter("pgender");
		String pBirthDay=request.getParameter("pbd");
		String PAge=request.getParameter("page");
		String pBloodGroup=request.getParameter("pbg");
		
		//out.println("<h1>"+pGender+"</h1>");
		//String the information into
		
		Connection connection=null;
		Statement statement= null;
		connection=dbConnector.DbConnector.getConnection();
		try {
			statement=connection.createStatement();
			String sql="insert into patient(p_name, p_email, p_password, p_address, p_phone, p_gender, p_birthday, p_age, p_bloodgroup )"
					+ " values('"+pName+"', '"+pEmail+"', '"+pPass+"', '"+pAddr+"', '"+pPhone+"', '"+pGender+"', '"+pBirthDay+"', '"+PAge+"', '"+pBloodGroup+"')";
			int i=statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "Pateint Added");
				request.getRequestDispatcher("nurse/patient.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Pateint not Added");
				request.getRequestDispatcher("nurse/patient.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
