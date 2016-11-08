<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Game Craft</title>
<link rel="stylesheet" type="text/css" href="resources/css/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/css/icon.css">
<link rel="stylesheet" type="text/css" href="resources/css/demo.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/flexslider.css" />

<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.flexslider-min.js"></script>


<style type="text/css">
body {
	margin: 0;
	padding: 0;
	display: block;
}

#container {
	width: 1080px;
	margin: 0 auto;
}

#head {
	margin: 10px auto;
	width: 1080px;
}

#search {
	font: "arial black";
}

.searchtext {
	font-size: 20px;
	height: 40px;
	width: 600px;
	padding: 0px 10px 0 10px;
}

.searchbutton {
	font-size: 20px;
	height: 40px;
}

#banner {
	width: 1080px;
	margin: 0 auto;
}

#content {
	margin: 40px 0 auto;
	border: 10px;
	border-color: #FF0000;
	font-family: arial;
	font-size: 20px;
	line-height: 40px;
}
</style>

<script type="text/javascript">
	//	var temp;
	var GameData;
	var selectGame;
	function search() {
		$
				.ajax({
					type : "get",
					url : "/game/Search?gameName=" + $("#searchname").val(),
					dataType : "json",
					success : function(data) {
						temp = data;
					//	alert(data.length);
						GameData = data.gameDetail;
						$("#resultCount").html(data.gameCount.count);
						for (var i = 0; i < data.gameDetail.length; i++) {
							var currentName = "<a href='javascript:void(0)' onclick='getGameDetail(); selectGame="
									+ i
									+ ";' id='selcetGameNum"
									+ i
									+ "'>"
									+ data.gameDetail[i].name + "</a></br>";
							$("#gameList").append(currentName);
						}

					},
					error : function(msg) {
						alert(msg);
					}
				});
	}
	function getGameDetail() {
		alert(temp);
	}
	/* 	$(function(){
	 $(document).click(function (e) {
	 alert($(e.target).attr('id'));
	 })
	 }); */
	/* 	$(document).ready(function(){
	 $("#gameList").click(function(e){
	 temp=this;
	 alert($(e.target).attr('id'));
	 })
	 }); */
	$(function() {
		$(".flexslider").flexslider({
			slideshowSpeed : 4000, //展示时间间隔ms
			animationSpeed : 400, //滚动时间ms
		});
	});
</script>

</head>
<body>
	<div id="container">
		<div id="head" align="left">
			<div>
				<img src="resources/img/logo.png" />
			</div>
		</div>
		<div id="search">
			<div class="easyui-tabs"
				style="width: 1080px; height: 120px; color: #AAAAAA">
				<div title="Name" style="margin: 20px">
					<form class="form">
						<div>
							<input type="text" class="searchtext" id="searchname"
								placeholder="Search for Game Name" name="searchtext" /> <input
								type="button" onclick="search()" class="searchbutton"
								value="Search" />
						</div>
					</form>
				</div>

				<div title="Type" style="margin: 20px">
					<form action="" method="post" id="searchForm" class="form">
						<div>
							<input type="text" class="searchtext"
								placeholder="Search for Game Type" name="search" /> <input
								type="submit" class="searchbutton" value="Search" />
						</div>
					</form>
				</div>

				<div title="Score" style="margin: 20px">
					<form action="" method="post" id="searchForm" class="form">
						<div>
							<input type="text" class="searchtext"
								placeholder="Search for Game Score" name="search" /> <input
								type="submit" class="searchbutton" value="Search" />
						</div>
					</form>
				</div>

				<div title="Date" style="margin: 20px">
					<form action="" method="post" id="searchForm" class="form">
						<div>
							<input type="text" class="searchtext"
								placeholder="Search for Game Date" name="search" /> <input
								type="submit" class="searchbutton" value="Search" />
						</div>
					</form>
				</div>

			</div>
		</div>

		<div id="banner">
			<div class="flexslider" style="margin: 0 auto">
				<ul class="slides">
					<li><img src="resources/img/1.png" /></li>
					<li><img src="resources/img/2.png" /></li>
					<li><img src="resources/img/3.png" /></li>
			</div>
		</div>

		<div id="content">
			<div style="font-size: 30px; line-height: 40px;">
				Search Result: <span id="resultCount"> </span>
			</div>
			<div id="gameList"></div>
		</div>
</body>
</html>
