package com.hitema.servlets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hitema.entities.Role;
import com.hitema.services.RoleService;
import com.hitema.services.RoleServiceImpl;
import com.hitema.services.StudentHbnImpl;
import com.hitema.services.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CheckServlet extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(CheckServlet.class);
    private static final String version = "1.0" ;
    
    private  StudentService service = new StudentHbnImpl();
    private  RoleService roleService = new RoleServiceImpl();

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		log.trace("Servlet called, method {}", method);
		HttpSession session = request.getSession(false);
		var option = request.getParameter("opt");
		log.trace("option : {}", option);
		response.setContentType("text/html");

		String msg = String.format("%s",
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd - HH:mm:ss.SSS")));
		request.setAttribute("hour", msg);
		request.setAttribute("version", version);

		String jsp = null;
		
		if (method.equals("POST"))
			jsp = post(request);
		else {
			if (option.equals("menu"))
				jsp = menu(request);
			else if (option.equals("students"))
				jsp = students(request);
			else if (option.equals("roles"))
				jsp = roles(request);
			else if (option.equals("new role")) {
				request.setAttribute("update", "false");
				request.setAttribute("msgClient", "Création d'un nouveau Rôle");
				jsp = "update_role.jsp";
			} else if (option.equals("update role")) {
				request.setAttribute("update", "false");
				jsp = updateRole(request);
			} else if (option.equals("delete role")) {
				jsp = deleteRole(request);
			}else
				log.error("Url non traitée par la Servlet : {}", option);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(jsp);

		rd.forward(request, response);
	}

	private String deleteRole(HttpServletRequest request) {
		Integer id = Integer.valueOf(request.getParameter("id"));
		log.trace("Delete role is called for Id:{}",id);
		Role role = new Role();
		role.setId(id);
		roleService.delete(role);
		return roles(request);
	}

	private String put(HttpServletRequest request) {
		Role role = new Role();
		role.setId(Integer.valueOf(request.getParameter("id")));
		role.setName(request.getParameter("name"));
		role.setLabel(request.getParameter("label"));
		role.setCreationDate(LocalDateTime.now());
		log.trace("Call Role Service for update :{}", role);
		roleService.update(role);
		return roles(request);
	}

	private String updateRole(HttpServletRequest request) {
		Integer id = Integer.valueOf(request.getParameter("id")) ;
		log.trace("updateRole called, id : {}",id);
		Role role = roleService.read(id);
		request.setAttribute("update", "true");
		request.setAttribute("id", role.getId());
		request.setAttribute("name", role.getName());
		request.setAttribute("label", role.getLabel());
		request.setAttribute("method", "PUT");
		request.setAttribute("msgClient", "Modification du Rôle");
		return "update_role.jsp";
	}

	private String post(HttpServletRequest request) {
		//request.setAttribute("msgClient", msgClient);
		request.getParameterMap().forEach((k, v) -> log.trace("key[{}] : {} ", k, v[0]));
		if ( request.getParameter("opt").equals("role") &&
			 request.getParameter("update").equals("false"))
			return createRole(request, request.getParameter("name"), request.getParameter("label"));
		else if ( request.getParameter("opt").equals("role") &&
				request.getParameter("update").equals("true"))
			return put(request);
		else if ( request.getParameter("opt").equals("student") )
			return "update_student.jsp";
		else {
			request.setAttribute("msgClient", "Opération inconnue : "+request.getParameter("opt"));
			return "menu.jsp";
		}
	}

	private String createRole(HttpServletRequest request, String name, String label) {
		Role role = new Role();
		role.setName(name);
		role.setLabel(label);
		role.setCreationDate(LocalDateTime.now());
		roleService.create(role);
		request.setAttribute("msgClient", "Rôle Id : "+role.getId()+" créé");
		return roles(request);
	}

	private String students(HttpServletRequest request) {
        var students = service.getAll();
        request.setAttribute("students", students);
		return "students.jsp";
	}

	private String roles(HttpServletRequest request) {
        var roles = roleService.findAll();
        request.setAttribute("roles", roles);
		return "roles.jsp";
	}
	
	private String menu(HttpServletRequest request) {
		return "menu.jsp" ;
	}



}
