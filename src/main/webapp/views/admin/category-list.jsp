<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
	font-family: Arial, sans-serif;
}

th, td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

td img {
	max-height: 150px;
	max-width: 200px;
	border-radius: 5px;
}

z
td span {
	font-weight: bold;
	color: #4CAF50; /* Green for active */
}

td span:contains( "Locked ") {
	color: #FF0000; /* Red for locked */
}

a {
	color: #007BFF;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>

<a href="${pageContext.request.contextPath }/admin/category/add">Add
	Products</a>
<table border="1" width="100%">
	<tr>
		<th>STT</th>
		<th>Images</th>
		<th>Product ID</th>
		<th>Product Name</th>
		<th>Status</th>
		<th>Price</th>
		<th>Desc</th>
		<th>Action</th>
	</tr>

	<c:forEach items="${listcate}" var="cate" varStatus="STT">
		<tr>
			<td>${STT.index + 1}</td>
			<td><c:choose>
					<c:when
						test="${cate.images != null && cate.images.length() >= 5 && cate.images.substring(0,5) != 'https'}">
						<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
					</c:when>
					<c:otherwise>
						<c:url value="${cate.images}" var="imgUrl"></c:url>
					</c:otherwise>
				</c:choose> <img style="max-height: 150px; max-width: 200px;" src="${imgUrl}" />
			</td>

			<td>${cate.categoryid}</td>
			<td>${cate.categoryname}</td>



			<td>
				<%-- <c:choose>
					<c:when test="${cate.status == true}">
						Active
					</c:when>
					<c:otherwise>
						Inactive
					</c:otherwise>
				</c:choose> --%> <c:if test="${cate.status == 1 }">
					<span>Active</span>
				</c:if> <c:if test="${cate.status != 1 }">
					<span>Locked</span>
				</c:if>
			</td>
			<td>${cate.price}</td>
			<td>${cate.desc}</td>

			<td><a
				href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>">Edit</a>
				| <a
				href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>">Delete</a>
			</td>
		</tr>
	</c:forEach>
</table>
<a href="${pageContext.request.contextPath }/admin/checkout">Check
	out!</a>