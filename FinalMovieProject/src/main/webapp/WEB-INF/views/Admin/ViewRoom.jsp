<%@page import="my.com.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
<script
	src="https://unpkg.com/bootstrap-multiselect@0.9.13/dist/js/bootstrap-multiselect.js"></script>
<jsp:include page="../Page/Head.jsp" />
<jsp:include page="../Page/Background.jsp" />
<jsp:include page="../Page/Header.jsp" />
<body>
	<%
	List<Ticket> datas = (List<Ticket>) request.getAttribute("list");
	int coluum = (int) request.getAttribute("coluum");
	int row = (int) request.getAttribute("rowww");
	%>
	<div class="container d-flex justify-content-center p-5"
		style="width: 100%; height: auto; background-color: rgb(248, 248, 255, 0.1);">
		<div class="coluum">
			<%
			int count = 0;
			for (int i = 0; i < row; i++) {
			%>
			<div class="row">
				<%
				for (int j = 1; j <= coluum; j++) {
					if (datas.get(count).isStatus() == true) {
				%>
				<label class="seat" style="background: yellow;"> <input
					type="checkbox" />
					<div><%=datas.get(count).getNameSeat()%></div>

				</label>
				<%
				} else {
				%>
				<label class="seat"> <input type="checkbox" />
					<div><%=datas.get(count).getNameSeat()%></div>

				</label>
				<%
				}
				%>
				<%
				count++;
				%>
				<%
				}
				%>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
<jsp:include page="../Page/Footer.jsp" />
<jsp:include page="../Page/Script.jsp" />