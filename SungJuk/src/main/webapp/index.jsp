<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.교수, model.성적" %>
<!DOCTYPE html>
<html>
<head>
    <title>성적 관리 시스템 결과</title>
</head>
<body>
    <%
        // 테스트 데이터 설정
        String inputProfId = "inha"; // 교수 ID 체크용
        String studentId = "20240001";
        int javaScore = 95;
        int dbScore = 88;
        int securityScore = 75;

        // 객체 생성
        교수 profObj = new 교수();
        성적 gradeObj = new 성적();

        out.println("<h2>[ 시스템 처리 결과 ]</h2>");

        // === 1. 성적입력 순차도 시나리오 실행 ===
        out.println("<h3>1. 성적입력 시나리오</h3>");
        
        // UI -> 교수: 교수체크("inha")
        if (profObj.교수체크(inputProfId)) {
            // 인증 성공 시 성적입력 수행
            gradeObj.성적입력(studentId, javaScore, dbScore, securityScore);
            
            out.println("결과: 성적 입력 및 계산 완료<br>");
            out.println("- 학생ID: " + gradeObj.get학생id() + "<br>");
            out.println("- 총점: " + gradeObj.get총점() + "<br>");
            out.println("- 평균: " + String.format("%.2f", gradeObj.get평균()) + "<br>");
        } else {
            out.println("결과: 교수 ID가 일치하지 않습니다.<br>");
        }

        out.println("<hr>");

        // === 2. 학점조회 순차도 시나리오 실행 ===
        out.println("<h3>2. 학점조회 시나리오</h3>");
        
        // UI -> 교수: 교수체크("inha")
        if (profObj.교수체크(inputProfId)) {
            // 인증 성공 시 학점조회 수행
            String gradeResult = gradeObj.학점조회();
            
            out.println("결과: 최종 학점 출력<br>");
            out.println("- 판별 학점: <b>" + gradeResult + "</b><br>");
        } else {
            out.println("결과: 조회 권한이 없습니다.<br>");
        }
    %>
</body>
</html>