<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<form action="${pageContext.request.contextPath}/admin/category/insert"
	method="post" enctype="multipart/form-data">
	<label for="categoryname">Category name:</label><br> <input
		type="text" id="categoryname" name="categoryname"><br> <label
		for="description">Description:</label><br>
	<textarea id="description" name="description" rows="5" cols="40"
		placeholder="Enter description here"></textarea>
	<br> <label for="price">Price:</label><br> <input
		type="number" id="price" name="price" min="0" step="0.01"
		placeholder="Enter price"><br> <label for="images">Images:</label><br>
	<img height="150" width="200" src="" /> <input type="file" id="images"
		name="images"> <label for="status">Status:</label><br> <input
		type="radio" id="ston" name="status" value="1" checked> <label
		for="ston">Active</label><br> <input type="radio" id="stoff"
		name="status" value="0"> <label for="stoff">Stopped</label><br>

	<input type="submit" value="Insert">
</form>
