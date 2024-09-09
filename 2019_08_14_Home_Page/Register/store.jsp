<%@ page import="java.sql.*"%>

<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String email=request.getParameter("email");

String username=request.getParameter("username");
String password=request.getParameter("password");
String rpassword=request.getParameter("re-password");


if(password.equals(rpassword)){
try{
	Connection conn=DriveManager.getConnection("","root","root")
	PreparedStatement ps=conn.prepareStaement("insert into registration values(?,?,?,?,?,?,?)")

	ps.setString(1,name);
	ps.setString(2,phone);
	ps.setString(3,address);
	ps.setString(4,email);
	ps.setString(5,username);
	ps.setString(6,password);
	ps.setString(7,rpassword);

	int x=ps.executeUpdate();
	if(x!=0){
			out.print("Sign-up done")
	}else{
	out.print("Something went wrong...")
}
	
}catch(Exception e){
	out.print(e);
}
}else{
	out.print("Password not matching...")
}


%>