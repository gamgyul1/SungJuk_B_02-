sequenceDiagram
    autonumber
    actor 교수
    participant UI as Search_SungJuk_UI
    participant Prof as 교수
    participant Grade as 성적

    교수 ->>+ UI: 학점조회 요청(교수id, 학생id)
    UI ->>+ Prof: 교수체크("inha")

    alt 인증 성공
        Prof -->>- UI: true
        UI ->>+ Grade: 학점조회()
        Note right of Grade: 평균 기준 학점 부여<br/>(90↑:A, 80↑:B, 80↓:C)
        Grade -->>- UI: 학점 결과 반환
        UI -->> 교수: 최종 학점 출력
    else 인증 실패
        Prof -->>+ UI: false
        UI -->>- 교수: "조회 권한이 없습니다."
    end