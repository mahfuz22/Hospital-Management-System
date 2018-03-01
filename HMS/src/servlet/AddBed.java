package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class AddBed
 */
@WebServlet("/AddBed")
public class AddBed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBed() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		String bedType=request.getParameter("bedtype");
		int totalBed=Integer.parseInt(request.getParameter("totalbed"));
		String bDescription=request.getParameter("bedDes");
		int rate=Integer.parseInt(request.getParameter("rate"));
		
		//storing information into database table(department),
		Connection con=null;
		Statement statement=null;
		con=dbConnector.DbConnector.getConnection();
		List<Bed> list=BedDao.getBedNumberType();
		int number=0;
		for(Bed bed:list) {
			number=bed.getTotalBed();
			bed.getBedType();
		}
		try {
			statement=con.createStatement();
			String sql="insert into bed(bed_type, total_bed, bed_description, rate)"
					+ " values('"+bedType+"','"+totalBed+"','"+bDescription+"','"+rate+"')";
			int i=statement.executeUpdate(sql);
			if (i>0) {
				request.setAttribute("message", "bed info added !!");
				request.getRequestDispatcher("nurse/bed.jsp?page=1").forward(request, response);
			}else{
				request.setAttribute("message", "bed info is not added !!");
				request.getRequestDispatcher("nurse/bed.jsp?page=1").forward(request, response);
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
