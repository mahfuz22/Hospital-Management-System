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
 * Servlet implementation class UpdateSale
 */
@WebServlet("/UpdateSale")
public class UpdateSale extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSale() {
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
		String pName=request.getParameter("pname");
		double price=Double.parseDouble(request.getParameter("price"));
		String date=request.getParameter("date");
		
		Connection connection=dbConnector.DbConnector.getConnection();
		try {
			String sql="update medicine_sale set patient_name='"+pName+"',"
					+ " price='"+price+"', date='"+date+"' where id='"+id+"'";
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			int i=preparedStatement.executeUpdate();
			if(i>0) {
				request.setAttribute("message", "Sale Info updated");
				request.getRequestDispatcher("stuff/provideMedi.jsp?page=1").forward(request, response);
			}else {
				request.setAttribute("message", "Sale Info not updated");
				request.getRequestDispatcher("stuff/provideMedi.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
