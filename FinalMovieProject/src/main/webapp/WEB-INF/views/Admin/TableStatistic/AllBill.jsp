<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container bg-light fs-5 p-0 thongke">
	<div class="h3 text-center pt-3">Thống kê</div>

	<table class="table table-striped table-hover table-bordered display"
		id="table_id">
		<thead>
			<tr class="text-center">
				<th>Tên phim</th>
				<th>Tài khoản</th>
				<th>Ngày Mua</th>
				<th>Tiền thức ăn</th>
				<th>Tiền vé</th>
				<th>Tổng Hóa Đơn</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="p" items="${list}">
				<tr class="">
					<c:forEach var="o" items="${m}">
						<c:if test="${p.idMovie == o.id }">
							<td>${o.name}</td>
						</c:if>
					</c:forEach>
					<c:forEach var="m" items="${people}">
						<c:if test="${p.idAccount == m.IDUser }">
							<td>${m.userName}</td>
						</c:if>
					</c:forEach>
					<td>${p.day}</td>
					<td id="combo">${p.priceCombo}</td>
					<td>${p.priceSeat}</td>
					<td>${p.total}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="statistic-foot">
				<td></td>
				<td></td>
				<td></td>
				<td>Doanh thu thức ăn: ${sumC}</td>
				<td>Doanh thu vé: ${sumT}</td>
				<td>Doanh thu rạp: ${sum}</td>
			</tr>
		</tfoot>
	</table>

</div>

