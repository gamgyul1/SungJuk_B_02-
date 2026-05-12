<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="view.Add_SungJuk_UI, view.Search_SungJuk_UI, model.성적" %>
<!DOCTYPE html>
<html>
<head>
    <title>성적 관리 시스템 결과</title>
</head>
<body>
    <%
        // 테스트 데이터
        String inputProfId = "inha";
        String studentId = "20240001";
        int java = 95; int db = 88; int security = 75;

        // Boundary 객체 생성
        Add_SungJuk_UI addUI = new Add_SungJuk_UI();
        Search_SungJuk_UI searchUI = new Search_SungJuk_UI();

        // 데이터 전달을 위한 임시 성적 객체 (Search_UI에 전달용)
        // 실제 환경에선 세션이나 DB에서 가져오게 됩니다.
        model.성적 tempGrade = new model.성적();
        tempGrade.성적입력(studentId, java, db, security);

        out.println("<h2>[ 시스템 처리 결과 ]</h2>");

        // === 1. 성적입력 UI 호출 ===
        out.println("<h3>1. 성적입력 시나리오</h3>");
        out.print(addUI.display(inputProfId, studentId, java, db, security));

        out.println("<hr>");

        // === 2. 학점조회 UI 호출 ===
        out.println("<h3>2. 학점조회 시나리오</h3>");
        out.print(searchUI.display(inputProfId, tempGrade));
    %>
</body>
</html>