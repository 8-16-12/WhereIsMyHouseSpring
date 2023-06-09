<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.ssafy.dto.*"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body>
	<div class="container p-4">
		<%-- 카카오 지도 --%>
		<div class="container row" style="float: none; margin: 0 auto;">
			<div id="map" style="width: 1100px; height: 600px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23658ec81df716d953dc7efcbbbfde05"></script>
			<script>
       var mapContainer = document.getElementById('map'), 
       mapOption = { 
         center: new kakao.maps.LatLng(${houses[0].lat}, ${houses[0].lng}),
         level: 3
       };
       var map = new kakao.maps.Map(mapContainer, mapOption);
       
		// ************************************************************************
		// 마커가 표시될 위치입니다 
		<c:forEach items="${houses}" var="house" varStatus="vs">
			var aptmarkerPosition  = new kakao.maps.LatLng(${house.lat}, ${house.lng}); 
			// 마커를 생성합니다
			var aptmarker = new kakao.maps.Marker({
				position: aptmarkerPosition
			});
			// 마커가 지도 위에 표시되도록 설정합니다
			aptmarker.setMap(map);
		</c:forEach>
		// ************************************************************************		
       </script>
		</div>
		<%-- 카카오 지도 --%>
		
		
		<%-- 출력 내용 --%>
		<table class='table'>
			<thead>
				<tr class="text-center">
					<th>순번</th>
					<th>시·도</th>
					<th>군·구</th>
					<th>법정동</th>
					<th>지번</th>
					<th>아파트</th>
					<th>층수</th>
					<th>평수</th>
					<th>매매가</th>
					<th>거래 연</th>
					<th>거래 월</th>
					<th>거래 일</th>
					<th>관심지역 설정</th>
				</tr>
			</thead>

			<tbody>
			
				<c:choose>
					<c:when test="${not empty userinfo}">
						<h4 class="text-center mt-3 mb-3" style="font-family: Open Sans"> 관심지역을 등록해서 여러 정보를 확인하세요!</h4>
						
						<div style=" text-align: center;">
							<a class="btn btn-primary mx-1 mb-3" href="sortingAlgorithm.do" role="button"> 매매가 낮은 순으로 보기 </a>
						</div>
						

					</c:when>
					<c:otherwise>
						<h4 class="text-center mt-3 mb-3" style="font-family: Open Sans">로그인 후 관심지역을 등록할 수 있어요!</h4>
					</c:otherwise>
				</c:choose>
				
				<c:forEach items="${houses}" var="house" varStatus="vs">
					<tr class="text-center">
						<td>${vs.count}</td>
						<td>${house.sidoName}</td>
						<td>${house.gugunName}</td>
						<td>${house.dongName}</td>
						<td>${house.jibun}</td>
						<td>${house.aptName}</td>
						<td>${house.floor}</td>
						<td>${house.area}</td>
						<td>${house.dealAmount}</td>
						<td>${house.dealYear}</td>
						<td>${house.dealMonth}</td>
						<td>${house.dealDay}</td>
						
						<c:choose>
							<c:when test="${not empty userinfo}">
								<td><a class="btn btn-primary mx-1" href="registInterest.do?id=${userinfo.id}
																							&aptName=${house.aptName}
																							&sidoName=${house.sidoName}
																							&gugunName=${house.gugunName}
																							&dongName=${house.dongName}" role="button"> 좋아요 </a></td>
							</c:when>
							<c:otherwise>
								<td><button type="button" disabled>불가능</button></td>
							</c:otherwise>
						</c:choose>
						
					</tr>
				</c:forEach>
			</tbody>

			<tfoot>
				<tr class="text-center">
					<th>순번</th>
					<th>시·도</th>
					<th>군·구</th>
					<th>법정동</th>
					<th>지번</th>
					<th>아파트</th>
					<th>층수</th>
					<th>평수</th>
					<th>매매가</th>
					<th>거래 연</th>
					<th>거래 월</th>
					<th>거래 일</th>
					<th>관심지역 설정</th>
				</tr>
			</tfoot>

		</table>
	</div>
	<%-- 출력 내용 --%>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>