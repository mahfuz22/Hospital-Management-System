package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Bed;
import dao.BedDao;

/**
 * Servlet implementation class UpdateMedicineCat
 */
@WebServlet("/UpdateMedicineCategory")
public class UpdateMedicineCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicineCategory() {
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
		String catName=request.getParameter("categoryname");
		String des=request.getParameter("description");
		
		
		Connection con=null;
		con=dbConnector.DbConnector.getConnection();
		List<Bed> list=BedDao.getBedNumberType();
		try {
			String sql="update medicine_category set category_name='"+catName+"', description='"+des+"' where id='"+id+"'";
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			int i=preparedStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "Category updated !!");
				request.getRequestDispatcher("stuff/medicineCat.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "Category is not updated !!");
				request.getRequestDispatcher("stuff/medicineCat.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
