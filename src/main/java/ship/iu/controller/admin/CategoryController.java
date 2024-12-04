package ship.iu.controller.admin;

import java.io.File;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import ship.iu.Services.ICategoryService;
import ship.iu.Services.Implement.CategoryServiceImpl;
import ship.iu.model.CategoryModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static ship.iu.utils.Constant.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/categories", "/admin/category/add", "/admin/category/insert",
		"/admin/category/edit", "/admin/category/update", "/admin/category/delete", "/admin/category/search" })
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ICategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		if (url.contains("/admin/categories")) {
			List<CategoryModel> list = cateService.findAll();
			for (CategoryModel cate : list) {
				System.out.print(cate + "\n");
			}
			request.setAttribute("listcate", list);
			request.getRequestDispatcher("/views/admin/category-list.jsp").forward(request, response);

		} else if (url.contains("/admin/category/add")) {
			request.getRequestDispatcher("/views/admin/category-add.jsp").forward(request, response);

		} else if (url.contains("/admin/category/edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			CategoryModel category = cateService.findById(id);
			request.setAttribute("cate", category);
			request.getRequestDispatcher("/views/admin/category-edit.jsp").forward(request, response);
		} else if (url.contains("/admin/category/delete")) {
			String id = request.getParameter("id");
			cateService.delete(Integer.parseInt(id));
			response.sendRedirect(request.getContextPath() + "/admin/categories");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String url = request.getRequestURI();
		if (url.contains("/admin/category/insert")) {
			CategoryModel category = new CategoryModel();
			// lấy dữ liệu từ views
			String categoryname = request.getParameter("categoryname");
			int status = Integer.parseInt(request.getParameter("status"));
			int price = Integer.parseInt(request.getParameter("price"));
			String desc = request.getParameter("description");
			
			// String images = request.getParameter("images");
			// đưa vào model

			category.setCategoryname(categoryname);
			category.setStatus(status);
			category.setPrice(price);
			category.setDesc(desc);
			
			// xử lí upload file
			String fname = "";
			String uploadPath = DIR;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = request.getPart("images");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					part.write(uploadPath + "/" + fname);
					category.setImages(fname);
					// }else if(images != null) {
					// category.setImages(images);

				} else {
					category.setImages("avatar.png");
				}
			} catch (Exception e) {
				e.printStackTrace();

			}

			// truyền model vào insert
			cateService.insert(category);
			// Trả về views
			response.sendRedirect(request.getContextPath() + "/admin/categories");

		} else if (url.contains("update")) {
			int categoryid = Integer.parseInt(request.getParameter("categoryid"));
			String categoryname = request.getParameter("categoryname");
			String status = request.getParameter("status");
			int statuss = Integer.parseInt(status);
			CategoryModel category = new CategoryModel();
			category.setCategoryid(categoryid);
			category.setCategoryname(categoryname);
			category.setStatus(statuss);
			// luu hinh anh cu
			CategoryModel cateold = cateService.findById(categoryid);
			String fileold = cateold.getImages();
			// Xu ly images
			String fname = "";
			String uploadPath = DIR;

			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			try {
				Part part = request.getPart("images");
				if (part.getSize() > 0) {
					String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
					// đổi tên file
					int index = filename.lastIndexOf(".");
					String ext = filename.substring(index + 1);
					fname = System.currentTimeMillis() + "." + ext;
					// upload file
					part.write(uploadPath + "/" + fname);
					// ghi ten file vao data
					category.setImages(fname);
				} else {
					category.setImages(fileold);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			cateService.update(category);
			response.sendRedirect(request.getContextPath() + "/admin/categories");
		}
	}
}
