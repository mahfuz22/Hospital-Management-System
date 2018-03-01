package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Bed;
import dao.BedDao;

/**
 * Servlet implementation class UpdateBed
 */
@WebServlet("/UpdateBed")
public class UpdateBed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBed() {
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
		String bedType=request.getParameter("bedtype");
		int rate=Integer.parseInt(request.getParameter("rate"));
		
		
		Connection con=null;
		con=dbConnector.DbConnector.getConnection();
		List<Bed> list=BedDao.getBedNumberType();
		try {
			String sql="update bed set bed_type='"+bedType+"', rate='"+rate+"' where id='"+id+"'";
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			int i=preparedStatement.executeUpdate();
			if (i>0) {
				request.setAttribute("message", "bed info updated !!");
				request.getRequestDispatcher("nurse/bed.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "bed info is not updateds !!");
				request.getRequestDispatcher("nurse/bed.jsp?page=1").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
