<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<!-- saved from url=(0037)<%=basePath%> -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<%=basePath%>/imgs/command.ico">

    <title>Nocoder.Org</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=basePath%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=basePath%>/bootstrap/css/blog.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<%=basePath%>/bootstrap/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <link rel="stylesheet" type="text/css" href="chrome-extension://fidicgekecdkdmkjghdgadgdmcfodfid/themes/default/content.css"></head>

  <body>

    <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          	<a id="homeLink" class="blog-nav-item active" href="<%=basePath %>" onclick="toHome();">Home</a>
          	<a id="techLink" class="blog-nav-item" href="javascript:void(0);" onclick="toTech();">Technology</a>
          	<a id="otherLink" class="blog-nav-item" href="javascript:void(0);" onclick="toOther();">Other</a>
          	<a id="aboutLink" class="blog-nav-item" href="javascript:void(0);" onclick="toAbout();">About</a>
        </nav>
        <script type="text/javascript">
        	function toHome(){
        		$("#homeLink").addClass("active");
        		$("#techLink").removeClass("active");
        		$("#otherLink").removeClass("active");
        		$("#aboutLink").removeClass("active");
        	}
        	function toTech(){
        		$("#homeLink").removeClass("active");
        		$("#techLink").addClass("active");
        		$("#otherLink").removeClass("active");
        		$("#aboutLink").removeClass("active");
        	}
        	function toOther(){
        		$("#homeLink").removeClass("active");
        		$("#techLink").removeClass("active");
        		$("#otherLink").addClass("active");
        		$("#aboutLink").removeClass("active");
        	}
        	function toAbout(){
        		$("#homeLink").removeClass("active");
        		$("#techLink").removeClass("active");
        		$("#otherLink").removeClass("active");
        		$("#aboutLink").addClass("active");
        	}
        </script>
      </div>
    </div>

    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">JASON YANG</h1>
        <p class="lead blog-description">千磨万击还坚劲，任尔东西南北风。</p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">
          <div class="blog-post">
          	<c:forEach items="${articleList }" var="article">
	      		<h2 class="blog-post-title">${article.title}</h2>
	            <p class="blog-post-meta">
	            	<!-- 日期 -->
	            	<fmt:formatDate pattern="yyyy-MM-dd" value="${article.createTime }" /> 
	            	<!-- 作者 -->
	            	by <a href="<%=basePath%>">${article.author}</a>
				</p>
          			${article.content}
          		<hr>
			</c:forEach>
          </div><!-- /.blog-post -->
			
			<c:choose>
				<c:when test="${totalPages != null }">
					<nav>
			            <ul class="pager">
			              <li><a href="<%=basePath%>/index.html?page=${(page==1)? page : page-1}">Previous</a></li>
			              <li><a href="<%=basePath%>/index.html?page=${page == totalPages ? page : page+1}">Next</a></li>
			            </ul>
		          	</nav>
				</c:when>
			</c:choose>
        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>About</h4>
            <p>
            	<em>Hey, I'm Jason,</em>
			</p>
			<p>
            	<em>A Java programmer,</em>
			</p>
            <p>
            	<em>I love Linux, Python, Freda...</em>
			</p>
			<p>
				<em>except you, man, haha!</em>
			</p>
          </div>
          <div class="sidebar-module">
            <h4>Archives</h4>
            <ol class="list-unstyled">
            	<c:forEach items="${timeList}" var="time">
                	<li><a href="<%=basePath%>/articlesByMonth?month=${time}">${time}</a></li>
            	</c:forEach>
            </ol>
          </div>
          <div class="sidebar-module">
            <h4>Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a target="_blank" href="https://github.com/no-coder">GitHub</a></li>
              <li><a target="_blank" href="http://weibo.com/227307890">Weibo</a></li>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div><!-- /.container -->

    <footer class="blog-footer">
    	
      <p>
      	Copyright © 2016  <a href="http://www.nocoder.org">nocoder.org</a> by <a href="http://www.nocoder.org">@Jason Yang</a>.
      	<!--CNZZ数据统计  -->
		<script type="text/javascript">
			var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
			document.write(unescape("%3Cspan id='cnzz_stat_icon_1257391581'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol 
					+ "s4.cnzz.com/z_stat.php%3Fid%3D1257391581%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
		</script>
      </p>
      <p>
        <a href="<%=basePath%>">↑ Back to top</a>
      </p>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>/bootstrap/js/jquery.min.js"></script>
    <script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<%=basePath%>/bootstrap/js/ie10-viewport-bug-workaround.js"></script>
  

</body></html>