<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<main class="ui-subpage">
    <section>
        <article>
            <div class="h3-title">
                <h3>세차장 정보</h3>
            </div>
            <div class="content">
                <!-- 데이터가 없을 경우 표시 -->
                <c:if test="${empty carWashDetail}">
                    <div>데이터가 없습니다.</div>
                </c:if> <!-- ✅ 시작 태그 추가 -->

                <c:if test="${not empty carWashDetail}">
                    <div class="ux-divider"></div>
                    <div class="h4 subpage-custom">
                        <div class="content">
                            <div class="item-photo-book">
                                <img src="<c:choose>
                                            <c:when test='${not empty carWashDetail.washImg}'>
                                                ${carWashDetail.washImg}
                                            </c:when>
                                            <c:otherwise>
                                                ${contextPath}/resources/assets/images/default-carwash.jpg
                                            </c:otherwise>
                                          </c:choose>" 
                                     alt="${carWashDetail.washName}" />
                            </div>
                        </div>

                        <div class="content">
                            <div class="custom-flex-box">
                                <div class="group">
                                    <div class="flex">
                                        <h4>${carWashDetail.washName}</h4>
                                        <button class="ux-button icon-menu mt8">
                                            <span class="icon"><i class="fa-regular fa-star"></i></span><span class="label">즐겨찾기</span>
                                        </button>
                                    </div>
                                    <p class="info-location"><span class="icon"></span><span class="label">${carWashDetail.washAddr}</span></p>
                                </div>
                                <div class="dl-list">
                                    <dl>
                                        <dt>세차 타입</dt><dd><span>${carWashDetail.washType}</span></dd>
                                        <dt>세차 가능 차종</dt><dd><span>${carWashDetail.washableCar}</span></dd>
                                        <dt>평점</dt><dd><span>${carWashDetail.rating}</span></dd>
                                        <dt>운영 시간</dt><dd><span>${carWashDetail.openHrs}</span></dd>
                                        <dt>수용 가능 차량 수</dt><dd><span>${carWashDetail.maxCar}</span> 대</dd>
                                    </dl>
                                </div>
                                <form class="check-login-form" action="${contextPath}/carwash/reservationStep1.do" method="post">
                                    <input type="hidden" name="washId" value="${carWashDetail.washId}">
                                    <input type="hidden" name="washName" value="${carWashDetail.washName}">
                                    <div class="ux-button-bar">
                                        <button class="ux-button contained primary" type="submit"><span class="label">바로 예약 하기</span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>매장 소개</h4>
                        </div>
                        <div class="content">
                            <p class="text-intro">${carWashDetail.washInfo}<br /><br /></p>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>고객 상담</h4>
                            <h4 class="info-num"><span>${carWashDetail.washTel}</span></h4>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>스태프 정보</h4>
                        </div>
                        <div class="content">
                            <c:if test="${not empty carWashDetail.staffList}">
                                <ul>
                                    <c:forEach var="staff" items="${carWashDetail.staffList}">
                                        <li>
                                            <strong>Staff ID:</strong> ${staff.staffId} <br />
                                            <strong>User ID:</strong> ${staff.userId} <br />
                                            <strong>Name:</strong> ${staff.userName} <br />
                                            <strong>Experience:</strong> ${staff.experience} <br />
                                            <strong>Rating:</strong> ${staff.rating} <br />
                                            <strong>Info:</strong> ${staff.staffInfo} <br />
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                            <c:if test="${empty carWashDetail.staffList}">
                                <p>스태프 정보가 없습니다.</p>
                            </c:if>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>세차 비용 안내</h4>
                        </div>
                        <div class="content">
                            <table class="data-grid">
                                <caption>세차 비용 테이블</caption>
                                <thead>
                                    <tr>
                                        <th>구분</th>
                                        <th>소형</th>
                                        <th>중형</th>
                                        <th>준중형</th>
                                        <th>대형</th>
                                        <th>SUV</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>기계</th>
                                        <td>10,000</td>
                                        <td>13,000</td>
                                        <td>15,000</td>
                                        <td>20,000</td>
                                        <td>25,000</td>
                                    </tr>
                                    <tr>
                                        <th>전문가</th>
                                        <td>28,000</td>
                                        <td>33,000</td>
                                        <td>38,000</td>
                                        <td>40,000</td>
                                        <td>50,000</td>
                                    </tr>
                                    <tr>
                                        <th>출장</th>
                                        <td>40,000</td>
                                        <td>45,000</td>
                                        <td>50,000</td>
                                        <td>55,000</td>
                                        <td>60,000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>편의시설 및 서비스</h4>
                        </div>
                        <div class="content">
                            <ul class="icon-list col-2">
                                <li><p><i class="fa-regular fa-calendar-check"></i> 예약 가능</p></li>
                                <li><p><i class="fa-solid fa-wifi"></i> 무선 인터넷</p></li>
                                <li><p><i class="fa-solid fa-cat"></i> 반려동물 동반 가능</p></li>
                                <li><p><i class="fa-solid fa-restroom"></i> 남/녀 화장실 구분</p></li>
                                <li><p><i class="fa-solid fa-chair"></i> 대기 공간</p></li>
                                <li><p><i class="fa-solid fa-square-parking"></i> 주차 가능</p></li>
                                <li><p><i class="fa-solid fa-car-side"></i> 발렛 가능</p></li>
                            </ul>
                        </div>
                    </div>

                    <div class="ux-divider"></div>
                    <div class="h4">
                        <div class="h4-title">
                            <h4>예약 전 안내 사항</h4>
                        </div>
                        <div class="content">
                            <ul class="middot-list">
                                <li>예약 시간 5분 이상 지연 시 세차 진행이 어려울 수 있습니다.</li>
                                <li>오염도가 심할 경우 추가 금액이 발생할 수 있습니다.</li>
                                <li>카시트 탈부착은 고객님이 직접 진행해 주세요.</li>
                                <li>트렁크의 짐은 간단히 정리한 후 방문해 주세요.</li>
                                <li>세차 가격은 차량/코스에 따라 다릅니다.</li>
                                <li>차량 내 귀중품은 미리 챙겨 주세요!</li>
                            </ul>
                        </div>
                    </div>
                </c:if>
            </div>
        </article>
    </section>
</main>
