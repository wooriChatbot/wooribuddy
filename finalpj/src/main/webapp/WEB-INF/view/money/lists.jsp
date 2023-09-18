<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.example.demo.dao.MoneyDAO"%>
<%@page import="com.example.demo.model.entity.Money"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br>
<div style="background-color: #eee;">
<input type="hidden" value="${loginUser.id }" readonly="readonly"
   name="userId">

<table class="table table-striped" style="width: 1350px;">
   <tr>
      <td>날짜</td>
      <td>수입/지출</td>
      <td>금액</td>
      <td>분류</td>
      <td></td>

   </tr>
   <c:set var="total" value="0" />
   <c:set var="income_total" value="0" />
   <c:set var="expense_total" value="0" />
   <c:forEach items="${moneyPageInfo.content }" var="money">
      <tr>
         <td>
            <fmt:formatDate value="${money.days }" pattern="yyyy-MM-dd" />
         </td>
         <td>${money.moneyType }</td>
         <td id="money">${money.money }</td>
         <td id="type">${money.type }</td>
         <c:if test="${!empty loginUser && loginUser.id==money.user.id }">
            <td style="border:none;">
               <a
                  href="/money/delete?userId=${loginUser.id }&no=${money.moneyNo }"><input
                  type="button" class="btn btn-primary mb-3" value="삭제"></a>
            </td>
         </c:if>
      </tr>
      <c:if test="${money.moneyType eq 'income'}">
         <c:set var="total" value="${total+money.money }" />
         <c:set var="income_total" value="${income_total+money.money }" />
      </c:if>
      <c:if test="${money.moneyType eq 'expense' }">
         <c:set var="total" value="${total-money.money }" />
         <c:set var="expense_total" value="${expense_total+money.money }" />
      </c:if>
   </c:forEach>
   <tr>
      <td>결과</td>
      <td>총액: ${total}</td>
      <td>수입 총액: ${income_total}</td>
      <td>지출 총액: ${expense_total}</td>
      <td></td>
   </tr>
</table>
</div>
