package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddDoctorInfo
 */
@WebServlet("/AddDoctorInfo")
public class AddDoctorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out=response.getWriter();
		String doctorName=request.getParameter("dName");
		String doctorEmail=request.getParameter("dMail");
		String doctorGender=request.getParameter("dGender");
		String doctorPass=request.getParameter("dPass");
		String doctorAddress=request.getParameter("dAddr");
		String doctorPhone=request.getParameter("dPhone");
		String department=request.getParameter("depart");
		String degree=request.getParameter("degree");
		//out.println("<h1>"+doctorName+"</h1>");
		
		//storing above data into database on table(doctor).
		Connection connection=null;
		Statement stmt=null;
		connection=dbConnector.DbConnector.getConnection();
		try{
			stmt=connection.createStatement();
			String sql="insert into doctor (d_name, email, gender, password, address, phone, department, d_degree)"
					+ " values('"+doctorName+"','"+doctorEmail+"','"+doctorGender+"','"+doctorPass+"','"+doctorAddress+"','"+doctorPhone+"','"+department+"','"+degree+"')";
			int i=stmt.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "Insertion success");
				request.getRequestDispatcher("doctor/addDoctor.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "Insertion failed");
				request.getRequestDispatcher("doctor/addDoctor.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
