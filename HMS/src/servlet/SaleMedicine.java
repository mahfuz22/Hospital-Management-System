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
 * Servlet implementation class SaleMedicine
 */
@WebServlet("/SaleMedicine")
public class SaleMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleMedicine() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("id"));
		String pName=request.getParameter("pname");
		String medicineName=request.getParameter("mname");
		double price=Double.parseDouble(request.getParameter("price"));
		String date=request.getParameter("date");
		
		System.out.println(pName);
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into medicine_sale(pres_id, patient_name, price, date) values(?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			pStatement.setString(2, pName);
			pStatement.setDouble(3, price);
			pStatement.setString(4, date);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Sale success !!");
				request.getRequestDispatcher("stuff/provideMedi.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Medicine not Added !!");
				request.getRequestDispatcher("stuff/provideMedi.jsp?page=1").forward(request, response);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
