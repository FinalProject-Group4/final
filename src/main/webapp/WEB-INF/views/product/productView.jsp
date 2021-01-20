<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/product_detail.css" rel="stylesheet">

<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>

</head>
<body>
   <c:import url="../common/header.jsp" />
   
    <section class="page-title wb">
       <div class="container" style="padding: 0">
        <div class="product-group"style="display: inline-block; width: 100%;" >
        
      <div class="row">  
       <div class="col-lg-6 col-md-6">
         <div class="product_pictures" style="float: left">
            <!-- 상품 이미지 -->
            <h3 style="margin-bottom: 40px;">
               <i id="icon" class="fa fa-shopping-basket"></i> 상품 > ${product.p_Type }
            </h3>
            <c:forEach items="${productimgList }" var="a" varStatus="vs">
               <c:if test="${ ! empty a.i_ChangeName and vs.index== 0 }">

                  <img
                     src="${pageContext.request.contextPath}/resources/productUpload/${a.i_ChangeName}"
                     width=600px height=500px>
               </c:if>
               <c:if test="${ empty a.i_ChangeName }">
                     X
                  </c:if>
            </c:forEach>
         </div>
       </div>

       <div class="col-lg-6 col-md-6">
         <div class="product-info" style=" margin-top: 80px; width: 80%; float: right;">
            <form action="<%=request.getContextPath()%>/productBuy.do"
               method="post">
               <input type="hidden" name="p_Type" value="${product.p_Type }"
                  readonly />
               <h2 name="p_Name">
                  ${product.p_Name }
               </h2>
               <br>
               <h3>
                  <p type="text" name="p_Content" 
                     style=" width: 430px; font-size: 20px; text-align: justify;">${product.p_Content }</p>
               </h3>
               <input type="hidden" name="p_No" value="${product.p_No}" readonly>
               <hr />
               <div class="option">
                  <div>
                     <h4>배송방법</h4>
                     <span>업체 배송</span>
                  </div>
                  <div>
                     <h4>배송비</h4>
                     <span>2500원</span>
                  </div>
                  <div>
                     <h4>택배사</h4>
                     <span>CJ대한통운</span>
                  </div>
                  <div class="quantity">
                     <h4>수량</h4>
                     <span class="minus">-</span> <input type="text" name="p_Quantity" id="p_Quantity"
                        readonly value="1"> <span class="plus">+</span>
                  </div>
               </div>
               <hr />
               <div class="order_summary">
                  <div class="total_price" style="margin-top: 25px;">
                     <h4>가격</h4>
                     <span class="price"><fmt:formatNumber pattern="###,###,###" value="${product.p_Price}" /> 원</span>
                     <!-- get가격 -->
                     <input type="hidden" name="p_Price" id="p_Price" value="${product.p_Price }">
                     <!-- 상품 등록 시 .quantity클래스 아이디로 받고 여기에서 get 필요할 듯 -->
                  </div>
                  <div class="order_now" style="margin-top: 20px;">
                	<button type="button" class="effect-btn" id="btnCart">장바구니 담기</button> &nbsp;&nbsp;&nbsp;
    			    <button type="submit" class="effect-btn">구매하기</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
    </div>  
   </div>
      <script>
      $(function(){

  		
  	 $("#btnCart").click(function(){
  		        
  			    var c_Amount = $("#p_Quantity").val();   
  			    var c_Price =  ${product.p_Price };
  			    var c_Pno = ${product.p_No};
  			    var c_Mno = ${member.m_No};    // 세션에서 멤버 no가져와야함

   			   
  			   /*  var params = {"coContent" : coContent, "member_bno" : member_bno}; */
  			    var params = {"c_Amount" : c_Amount, "c_Price" : c_Price, "c_Pno" : c_Pno, "c_Mno" : c_Mno};
  			    
  			    $.ajax({
  			        type: "post", //데이터를 보낼 방식
  			        url: "${pageContext.request.contextPath}/cart/insertCart.do", //데이터를 보낼 url
  			        data: params, //보낼 데이터
  			        
  			        success: function(data){//데이터를 보내는 것이 성공했을 시 출력되는 메시지
  			            alert("장바구니에 담겼습니다.");
  			            location.reload();
  			                }
  			            });
  			        });
      });
	</script>

      <div>
            <div>
               <div class="row2">
                  <h1 style="margin-bottom: 7px;">상세설명</h1>
               </div>
               <div class="product_content" style="margin-top: 100px;">
                  <c:forEach items="${productimgList }" var="a" varStatus="vs">
                     <c:if test="${ ! empty a.i_ChangeName and vs.index != 0 }">

                        <img
                           src="${pageContext.request.contextPath}/resources/productUpload/${a.i_ChangeName}"
                           class="big_img">
                     </c:if>
                     <c:if test="${ empty a.i_ChangeName }">
                     X
                  </c:if>
                  </c:forEach>
               </div>
            </div>
            <div class="btn-group">
            <button class="effect-btn btn-back" type="button"
               onclick="location.href='${pageContext.request.contextPath}/product/productList.do'">목록</button>
            <c:if test="${member.m_Id eq 'admin'}">
            <button class="effect-btn btn-update" type="button"
               onclick="location.href='${pageContext.request.contextPath}/product/productUpdateView.do?p_No=${product.p_No}'">
               수정 페이지</button>
            </c:if>
            </div>
         <div class="reviewwrite">
            <h1 class="rviewh1">리뷰 작성</h1>
            <p style="font-size: 18px;">
                           <span>[공지]<br>식품 등의 표시ㆍ광고에 관한 법률에 의거하여 의약품으로 오인될 수
                              있는 효능,질병의 예방 및 치료 효과 등의 단어 및 <br>체험후기 등의 내용은 피해주시고, 이러한
                              내용은 상품과 관련이 없으며 사전공지없이 삭제될수 있음을 알려드립니다.
                           </span>
                        </p>
            <div class="containers"
               style="width: 100%; display: flex; justify-content: center;">
               <div class="review_writearea">
                  <div class="review_writeleft">
                     <div class="review_writelleft">
                        
                        <form
                           action="${pageContext.request.contextPath}/product/insertReview.do"
                           method="post">
                           <!-- 파일, 상품 번호, 리뷰 내용, 회원 번호 넘겨줘야함 -->

                           <input type="hidden" name="m_No" value="${member.m_No}">
                           <input type="hidden" name="p_No" value="${product.p_No}" />
                           <textarea name="r_Content" id="r_Content" cols="120" rows="6"
                              value placeholder="내용을 입력해주세요." style="resize: none; "></textarea>
                     </div>

                  </div>
                  <div class="review_writeright"
                     style="margin-top: 110px; margin-left: 20px;">
                     <button type="submit" class="effect-btn btn-add">리뷰 등록</button>
                     </form>
                     <!-- 리뷰 내용과 파일, 작성자정보 보내야함 -->
                  </div>
               </div>
            </div>
         </div>
      </div>
      <section class="product_review">
         <div class="container">
            <div class="row3">
               <h1 class="rviewh1">제품 리뷰</h1>
            </div>
            <div class="reviewlist">
               <c:forEach items="${prlist}" var="pr">
                  <div class="containers"
                     style="width: 100%; display: flex; justify-content: center;">
                     <div class="review_item">
                        <div class="review_list" style="height: 170px;">
                           <div class="list_left"
                              style="width: 80%; display: flex; margin-left: 40px; margin-top: 30px;">
                              <textarea name="r_Content" id="r_Content" cols="90" rows="5"
                                 style="border: none; resize: none;" readonly>${pr.r_Content }</textarea>
                              <%--         <pre style="margin-top:15px;">${pr.r_Content }</pre> --%>
                           </div>
                           <div class="list_right" style="width: 130px;">
                              <br>
                              <div>
                                 <u style="color: grey">작성자</u><br> <strong>${pr.r_Nick }</strong>
                              </div>
                              <br>
                              <div>
                                 <u style="color: grey">작성일자</u><br> <strong>${pr.r_Date }</strong>
                              </div>
                           </div>
                              <input type="hidden" value="${pr.r_No }" readonly />
                              <button type="button" id="reviewup" onclick="reviewup(this);">수정</button>
                              <button type="button" id="reviewupdate" onclick="reviewupdate(this);" style="display: none;">수정완료</button>
                              <button type="button" id="reviewdelete" onclick="reviewdelete(this);">삭제</button>
            
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </section>
      <script>
         //리뷰 삭제
         function reviewdelete(obj) {
            var r_No = $(obj).siblings('input').val();
            var p_No = '${product.p_No}';
            alert("삭제가 완료되었습니다!");
            location.href = "${pageContext.request.contextPath}/product/deleteReview.do?r_No="
                  + r_No + "&p_No=" + p_No;
         };

         // 수정하기 버튼
         function reviewup(obj) {
            var test = $("#r_Content").val();
            console.log(test);
            $(obj).siblings().find('textarea').removeAttr('readonly');
            $(obj).siblings('#reviewupdate').css('display', 'inline');
            $(obj).css('display', 'none');
         };

         // 수정 완료버튼
         function reviewupdate(obj) {
            var r_Content = $(obj).siblings().find('textarea').val();
            var r_No = $(obj).siblings('input').val();
            var p_No = '${product.p_No}';

            location.href = "${pageContext.request.contextPath}/product/updateReview.do?r_Content="+ r_Content+"&r_No="+ r_No+"&p_No="+ p_No;
            alert("수정이 완료되었습니다!");
         }
      </script>
      <script>
         function fn_goQuestionForm() {
            var q_Pno = ${product.p_No};
            var q_Mno = ${member.m_No};
            location.href = "${pageContext.request.contextPath}/product/QuestionForm.do?q_Pno="+q_Pno+"&q_Mno="+q_Mno;
         }
      </script>
      <section class="product_QA">
         <div class="container">
            <div class="row3">
                  <h1 class="rviewh1">상품 문의</h1>
               <div class="review_writeright" style="font-family: 'InfinitySans-RegularA1';">
                  <button type="submit" class="effect-btn" onclick="fn_goQuestionForm();" style="float: right; margin-bottom: 15px;">작성하기</button>
               </div>
            </div>
            <div class="reviewlist">
               <table id="tbl-board" class="table table table-hover">
                  <tr>
                     <th>펼치기/접기</th>
                     <th>제목</th>
                     <th>작성일</th>
                     <th>작성자</th>
                  </tr>
                  <c:forEach items="${qlist}" var="q">
                     <tr>
                        <td><img
                           src="${pageContext.request.contextPath}/resources/images/open.png"
                           class="glyphicon glyphicon-plus plusIcon" /> <img
                           src="${pageContext.request.contextPath}/resources/images/close.png"
                           class="glyphicon glyphicon-minus plusIcon"
                           style="display: none" />
                        <td>${q.q_Title}</td>
                        <td>${q.q_Date}</td>
                        <td>${q.q_Nick}</td>
                        </td>
                     </tr>
                     <tr style="display: none; margin-left: 15px;">
                        <td colspan="4">
                           <p>${q.q_Content}</p>
                           <p style="color: blue;">관리자 답변 :</p>
                        </td>
                     </tr>

                  </c:forEach>
               </table>
            </div>
         </div>

      </section>
   </div>
   <script>
      $(".plusIcon").on("click", function() {
         var obj = $(this);
         if (obj.hasClass("glyphicon-plus")) {
            obj.hide();
            obj.next().show();
            obj.parent().parent().next().show();
         } else {
            obj.hide();
            obj.prev().show();
            obj.parent().parent().next().hide();
         }
      });
   </script>

   <br>
   <br>
   <br>
   <br>
   <br>
   <c:import url="../common/footer.jsp" />
  </section>
</body>
<script>
   var $productPictures = $('.product_pictures'), $bigImg = $productPictures
         .find('.big_img'), $thumbImgList = $productPictures
         .find('.thumb_img li');

   /*
      1. 리스트를 클릭하면 그 요소에 active 추가한다.
      2. 클릭한 요소의 자식요소 img의 data-target 값을 확인 후 큰 이미지 경로 수정 
    */
   $thumbImgList.click(function() {
      $(this).addClass('active').siblings().removeClass('active');
      var targetImgPath = '../../resources/images/product/'
            + $(this).find('img').attr('data-target');

      $bigImg.attr('src', targetImgPath)
   });

   // 상품 수량 및 총 가격 변경                    // 임의
   var $quantity = $('.quantity'), $unitprice = 3000, $qtyBtn = $quantity
         .find('span'), $qtyInput = $quantity.find('input'), $targetTotal = $('.total_price .price');

   /*
   $qtyBtn 클릭하면 그 요소가 class명 prev가 참이면 (+클릭)
   $qytInput value 기존값에서 1 증가
   거짓이면(- 클릭) 기존값에서 1 감소
    */
   $qtyBtn.click(function() {
      var currentCount = $qtyInput.val();

      if ($(this).hasClass('plus')) {
         currentCount++;
         $qtyInput.val(currentCount);
      } else {
         if (currentCount > 1) {
            currentCount--;
            $qtyInput.val(currentCount);
         }
      }
      // 수량*단가 변수 total에 저장하고 그걸 .price 값으로 변경
      var total = (currentCount * $unitprice).toLocaleString('en') + '원';
      $targetTotal.text(total);

   });
</script>
</html>