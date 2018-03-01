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
 * Servlet implementation class DUpdateBedAllotment
 */
@WebServlet("/DUpdateBedAllotment")
public class DUpdateBedAllotment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DUpdateBedAllotment() {
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
		String allotmentDate=request.getParameter("bedallotment");
		String dischargeDate=request.getParameter("beddischarge");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update bed_allotment set allotment_date='"+allotmentDate+"',"
					+ " discharge_date='"+dischargeDate+"' where id='"+id+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			int i=preparedStatement.executeUpdate();
			if(i>0) {
				request.setAttribute("message", "Bed allotment update");
				request.getRequestDispatcher("doctor/bedAllotment.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Bed allotment not update");
				request.getRequestDispatcher("doctor/bedAllotment.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
