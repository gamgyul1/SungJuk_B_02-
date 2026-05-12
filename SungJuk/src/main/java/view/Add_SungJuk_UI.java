package view;

import model.교수;
import model.성적;

public class Add_SungJuk_UI {
    public String display(String 교수id, String 학생id, int 자바, int DB, int 보안) {
        교수 prof = new 교수();
        성적 grade = new 성적();
        StringBuilder result = new StringBuilder();

        // 1. 교수 체크 (순차도 반영)
        if (prof.교수체크(교수id)) {
            // 2. 성적 입력 및 계산
            grade.성적입력(학생id, 자바, DB, 보안);
            result.append("결과: 성적 입력 및 계산 완료<br>");
            result.append("- 학생ID: ").append(grade.get학생id()).append("<br>");
            result.append("- 총점: ").append(grade.get총점()).append("<br>");
            result.append("- 평균: ").append(String.format("%.2f", grade.get평균())).append("<br>");
        } else {
            result.append("결과: 교수 ID가 일치하지 않습니다.<br>");
        }
        return result.toString();
    }
}