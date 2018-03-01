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
 * Servlet implementation class AddInvoice
 */
@WebServlet("/AddInvoice")
public class AddInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInvoice() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String title=request.getParameter("title");
		double amount=Double.parseDouble(request.getParameter("amount"));
		String pName=request.getParameter("patient");
		int presId=Integer.parseInt(request.getParameter("presid"));
		String date=request.getParameter("date");
		String status=request.getParameter("status");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="insert into invoice(title, amount, patient_name, pres_id, date) values(?,?,?,?,?)";
			PreparedStatement pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, title);
			pStatement.setDouble(2, amount);
			pStatement.setString(3, pName);
			pStatement.setInt(4, presId);
			pStatement.setString(5, date);
			int i=pStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Invoice Added !!");
				request.getRequestDispatcher("accountant/invoice.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Invoice not Added !!");
				request.getRequestDispatcher("accountant/invoice.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
