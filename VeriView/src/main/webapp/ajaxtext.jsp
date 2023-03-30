<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Document</title>
</head>
<body>

	<label for="exampleDataList" class="form-label">Datalist example</label>
	<input id="input1" class="form-control" list="datalistOptions" id="exampleDataList"
		placeholder="Type to search...">
	<datalist id="datalistOptions">
		<option value="San Francisco">

		<option value="New York">
  
		<option value="Seattle">
  
		<option value="Los Angeles">
  
		<option value="Chicago">

	</datalist>
<div id="div1"></div>


			<script>
				$(function() {
					$("#input1")
							.keyup(
									function() {
										$
												.ajax({
													url : "AjaxTestCon",
													type : 'post',
													data : {
														searchWord : $(
																'#input1')
																.val()
													},
													timeout : 3000,
													success : function(data) {
														let obj = JSON
																.parse(data);
														for (var i = 0; i < obj.length; i++) {
															console
																	.log(
																			obj[i].rest_no,
																			obj[i].rest_name);
														}
														$("#div1")
																.text(
																		JSON
																				.stringify(obj[0]));
													},
													error : function() {
														console.log("error");
													}
												})

									})
				})
			</script>

	<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>

		</body>
</html>