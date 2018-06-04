<%@page import="net.follow.db.FollowBean"%>
<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/mypage.css" rel="stylesheet" type="text/css">
<link href="./css/followList.css" rel="stylesheet" type="text/css">

<!-- 팔로우 리스트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
function profile(){
	window.open("./UpdateProfile.my","","width=500,height=500,left=600,top=200,scrollbars=yes,resizable=yes,menubar=yes,location=yes");
}
</script>
</head>
<body>
<%
MemberBean memberbean = (MemberBean)request.getAttribute("mb");
int followercount=((Integer)request.getAttribute("followercount"));
int followingcount= ((Integer)request.getAttribute("followingcount"));
List f_followingList = (List)request.getAttribute("f_followingList");
List m_followingList = (List)request.getAttribute("m_followingList");
List f_followerList = (List)request.getAttribute("f_followerList");
List m_followerList = (List)request.getAttribute("m_followerList");
String grade=null;
switch(memberbean.getM_grade()){
case 1 : grade = "정회원"; break;
case 2 : grade = "VIP회원"; break;
}
%>
<!-- 헤더영역 -->
<jsp:include page="../inc/header.jsp"/>
<!-- 헤더영역 -->

<article>

<div class="mypage_follow">
	<div class="mypage_profile">
		<h2>profile</h2>
		
		<div class="follow">
		  <div class="photo">
		    <a href="#" onclick="profile()"><img alt="프로필사진" src="./images/proflie_img/proflie<%=memberbean.getM_pic()%>.png" width="130px" height="130px" title="사진 변경"></a>
		  </div>
		  <ul class="follow_ul">
		    <li class="follower"><a>팔로워<span data-toggle="modal" data-target="#follower"><%=followercount %></span></a></li>
		    <li class="follows"><a>팔로잉<span data-toggle="modal" data-target="#following"><%=followingcount %></span></a></li>
		  </ul>
		</div>
		
<!----------------------------------- 팔로잉 --------------------------------------------------------->  
 <div class="modal fade" id="following">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">팔로잉</h4>
        </div>
        
        <%
        for(int i=0; i<f_followingList.size(); i++) {
        	FollowBean fbean = (FollowBean)f_followingList.get(i);
        	MemberBean mbean = (MemberBean)m_followingList.get(i);
        	List followingCheckList = (List)request.getAttribute("followingCheckList");
        	%>
        	<!--         내가 팔로잉 하는 한 사람  -->
			<div class="follow_div">
	          <div class="photo">
			    <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_following() %>"><img src="./images/proflie_img/proflie<%=mbean.getM_pic() %>.png" width="50px" height="50px"></a>
			  </div>
			  <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_following() %>"><%=fbean.getFo_following() %></a><br>
			  <span><%=mbean.getM_name() %></span>
			  <%
				  
			  
				  if((Integer)followingCheckList.get(i) == 1) {
					  %>
	<!-- 				  서로 팔로우 할때 -->
					  <a id="f_unfollow<%=mbean.getM_name() %>" class="unfollow_a">언팔로우</a>
					  <%
				  }
			  %>

        	<input type="hidden" id="m_id<%=mbean.getM_name() %>" value="<%=memberbean.getM_id() %>">
			<input type="hidden" id="f_id<%=mbean.getM_name() %>" value="<%=fbean.getFo_following() %>">
			  
			  <script type="text/javascript">
			  
		        $(document).ready(function() {
		        	
		        	$('#f_unfollow<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "get",
							url: "./DeleteFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로우 끊기");
								location.reload();
							}
						});
		        	});
		        	
		        });
		        
       		 </script>
			  
			</div>
			<div class="clear"></div>
			<!--         내가 팔로잉 하는 한 사람  -->
        	<%
        }
        %>
		
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!----------------------------------- 팔로잉 ---------------------------------------------------------> 

<!----------------------------------- 팔로워 --------------------------------------------------------->
  <div class="modal fade" id="follower">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">팔로워</h4>
        </div>
        
        <%
        for(int i=0; i<f_followerList.size(); i++) {
        	FollowBean fbean = (FollowBean)f_followerList.get(i);
        	MemberBean mbean = (MemberBean)m_followerList.get(i);
        	List followCheckList = (List)request.getAttribute("followCheckList");
        	%>
        	
        	<!--         나를 팔로잉 하는 한 사람  -->
	        <div class="follow_div">
	          <div class="photo">
			    <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_id() %>"><img src="./images/proflie_img/proflie<%=mbean.getM_pic() %>.png" width="50px" height="50px"></a>
			  </div>
			  <a href="./FollowMyHome.fo?m_id=<%=fbean.getFo_id() %>"><%=fbean.getFo_id() %></a><br>
			  <span><%=mbean.getM_name() %></span>
			  <%
				  
				  if((Integer)followCheckList.get(i) == 1) {
					  %>
	<!-- 				  서로 팔로우 할때 -->
					  <a id="unfollow<%=mbean.getM_name() %>" class="unfollow_a">언팔로우</a>
					  <%
				  }else {
					  %>
	<!-- 				  상대방만 나를 팔로우 할때 -->
					  <a id="following<%=mbean.getM_name() %>" class="follow_a">팔로잉</a>
					  <%
				  }
			  %>

        	<input type="hidden" id="m_id<%=mbean.getM_name() %>" value="<%=memberbean.getM_id() %>">
			<input type="hidden" id="f_id<%=mbean.getM_name() %>" value="<%=fbean.getFo_id() %>">
			  
			  <script type="text/javascript">
			  
		        $(document).ready(function() {
		        	
		        	$('#unfollow<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "get",
							url: "./DeleteFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로우 끊기");
								location.reload();
							}
						});
		        	});
		        	
		        	$('#following<%=mbean.getM_name() %>').click(function(){
		        		var m_id = $('#m_id<%=mbean.getM_name() %>').val();
						var f_id = $('#f_id<%=mbean.getM_name() %>').val();
						
<%-- 						alert($('#m_id<%=mbean.getM_name() %>').val()); --%>
<%-- 						alert($('#f_id<%=mbean.getM_name() %>').val()); --%>
						
						$.ajax({
							type: "get",
							url: "./InsertFollowerAction.fo",
							dataType: "html",
							data: {
								"m_id": m_id,
								"f_id": f_id,
							},
							success:function(data){
								alert("팔로잉 하기");
								location.reload();
							}
						});
		        	});
		        	
		        	
		        });
		        
       		 </script>
			</div>
			<div class="clear"></div>
			<!--         나를 팔로잉 하는 한 사람  -->
        	<%
        }
        %>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!----------------------------------- 팔로워 --------------------------------------------------------->		
		
		<div class="clear"></div>
		
		<table class="mypage_info">
			<tr>
				<td>아이디</td>
				<td class="content"><%=memberbean.getM_id()%></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td class="content"><%=memberbean.getM_name()%></td>
			</tr>
			<tr>
				<td>등급</td>
				<td class="content"><%=grade%></td>
			</tr>
		</table>
		
		<input type="button" value="정보 수정" class="update_btn" onclick="location.href='./UpdateCheck.my'">
		<input type="button" value="서비스 탈퇴" class="delete_btn" onclick="location.href='./DeleteCheck.my'">
	</div>
	
	
	
	<div class="clear"></div>
</div>

</article>

<!-- 푸터 영역 -->
<jsp:include page="../inc/footer.jsp"/>
<!-- 푸터 영역 -->

</body>
</html>