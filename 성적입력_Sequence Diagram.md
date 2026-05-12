sequenceDiagram
    autonumber
    actor 교수
    participant UI as Add_SungJuk_UI
    participant Prof as 교수
    participant Grade as 성적

    교수 ->>+ UI: 성적입력 요청(교수id, 학생id, 점수들)
    UI ->>+ Prof: 교수체크("inha")
    
    alt 인증 성공
        Prof -->>- UI: true
        UI ->>+ Grade: 성적입력(학생id, 자바, DB, 보안)
        Note right of Grade: 내부 로직: 총점/평균 계산
        Grade -->>- UI: 입력 완료 응답
        UI -->> 교수: 처리 결과(총점, 평균) 출력
    else 인증 실패
        Prof -->>+ UI: false
        UI -->>- 교수: "교수 ID가 일치하지 않습니다."
    end
