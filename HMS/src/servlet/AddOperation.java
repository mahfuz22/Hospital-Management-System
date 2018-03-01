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
 * Servlet implementation class AddOperation
 */
@WebServlet("/AddOperation")
public class AddOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOperation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String dName=request.getParameter("doctorName");
		String pName=request.getParameter("patientName");
		String opType=request.getParameter("operationtype");
		double opFee=dao.OperationDao.getFeeByType(opType);
		String date=request.getParameter("date");
		String description=request.getParameter("description");
		
		Connection con=null;
		Statement statement=null;
		con=dbConnector.DbConnector.getConnection();
		try {
			statement=con.createStatement();
			String sql="insert into operation(operation_type, doctor_name, patient_name, operation_fee, date, description)"
					+ " values('"+opType+"', '"+dName+"','"+pName+"','"+opFee+"' ,'"+date+"' ,'"+description+"')";
			int i=statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "Operation added !!");
				request.getRequestDispatcher("doctor/operation.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Operation is not added !!");
				request.getRequestDispatcher("doctor/operation.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
