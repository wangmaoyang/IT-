<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/pintuer.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">会员管理</strong></div>
 
  <table class="table table-hover text-center">
    <tr>
      <th width="30%">会员编号</th>
      <th width="30%">会员名</th>
      <th width="30%">密码</th>
     
    </tr>
        <c:forEach var="user" items="${userList}">
    <tr>

      <td>${user.uid }</td>
      <td>${user.uname }</td>
      <td>${user.upass }</td>
      <td><div class="button-group">
 
    
    </tr>
      </c:forEach>
   
      <tr>
      <td colspan="8"><div class="pagelist"> 
       <a href="${pageContext.request.contextPath }/admin?method=selectUser&currentPage=1">首页</a>
      <c:choose>
       <c:when test="${currentPage le 1 }"><a href="#">上一页</a></c:when>
       <c:otherwise>
         <a href="${pageContext.request.contextPath }/admin?method=selectUser&currentPage=${currentPage-1}">上一页</a>
       </c:otherwise>
      </c:choose>
        <c:forEach begin="1" end="${totalPage }" var="index">
          <c:choose>
            <c:when test="${index eq currentPage }">
               <span class="current">${index}</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath }/admin?method=selectUser&currentPage=${index}">${index}</a>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        
       <c:choose>
         <c:when test="${currentPage ge totalPage }"><a href="#">下一页</a></c:when>
         <c:otherwise>
             <a href="${pageContext.request.contextPath }/admin?method=selectUser&currentPage=${currentPage+1}">下一页</a>
         </c:otherwise>
       </c:choose>

         <a href="${pageContext.request.contextPath }/admin?method=selectUser&currentPage=${totalPage}">尾页</a>
          </div></td>
      </tr>
     
  </table>
</div>
<script type="text/javascript">
function deleteAdmin(id){
	if(window.confirm("确定删除吗？")){
		location.href="${pageContext.request.contextPath}/admin?id="+id+"&method=delete";
	}
	
}
</script>

</body>
</html>