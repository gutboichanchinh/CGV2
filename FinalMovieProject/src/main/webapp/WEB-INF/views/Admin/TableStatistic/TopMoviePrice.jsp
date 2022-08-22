<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.util.*" %>
    <%@ page import= "my.com.entity.Movie" %>
<div class="container bg-light fs-5 p-0 thongke">
		<div class="h3 text-center pt-3">Thống kê doanh thu phim</div>

		<table class="table table-striped table-hover table-bordered" id="top">
			<thead>
				<tr class="">
					<th>Tên phim</th>
					<th>Doanh thu</th>

				</tr>
			</thead>

			<tbody>

		<%  Map<Integer,Float> map = (HashMap) request.getAttribute("map");%>
		<%	List<Movie> list =(List) request.getAttribute("m"); %>
		<% for (Map.Entry<Integer, Float> entry : map.entrySet()) {	 
				%>
			<tr class="">
			<td>
			<% for (Movie movie:list){ %>
				<%
					if(movie.getId() == entry.getKey()){
						out.print(movie.getName());
					}
				
				%>
				
				<%} %>
				</td>
				<td><%=entry.getValue()%></td>
				
			</tr>
		<% } %>
			</tbody>

		</table>

	</div>
		