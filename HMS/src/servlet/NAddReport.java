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
 * Servlet implementation class NAddReport
 */
@WebServlet("/NAddReport")
public class NAddReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NAddReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String type=request.getParameter("type");
		String description=request.getParameter("description");
		String date=request.getParameter("date");
		String doctorName=request.getParameter("doctorname");
		String patientName=request.getParameter("patientname");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into report (type, description, date, doctor, patient) values(?,?,?,?,?)";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setString(1, type);
			preparedStatement.setString(2, description);
			preparedStatement.setString(3, date);
			preparedStatement.setString(4, doctorName);
			preparedStatement.setString(5, patientName);
		    int i=preparedStatement.executeUpdate();
		    if (i>0) {
				request.setAttribute("message", "Report Added !!!");
				request.getRequestDispatcher("nurse/manageReport.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Report not Added !!!");
				request.getRequestDispatcher("nurse/manageReport.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
