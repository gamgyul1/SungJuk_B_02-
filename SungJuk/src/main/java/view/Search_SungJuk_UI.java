package view;

import model.교수;
import model.성적;

public class Search_SungJuk_UI {
    // 성적 객체를 매개변수로 받아 학점을 조회하는 구조
    public String display(String 교수id, 성적 gradeObj) {
        교수 prof = new 교수();
        StringBuilder result = new StringBuilder();

        // 1. 교수 체크 (순차도 반영)
        if (prof.교수체크(교수id)) {
            // 2. 학점 조회
            String 학점 = gradeObj.학점조회();
            result.append("결과: 최종 학점 출력<br>");
            result.append("- 판별 학점: <b>").append(학점).append("</b><br>");
        } else {
            result.append("결과: 조회 권한이 없습니다.<br>");
        }
        return result.toString();
    }
}