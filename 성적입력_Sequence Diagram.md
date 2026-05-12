```mermaid
sequenceDiagram
    autonumber
    actor Prof_User as 교수 (사용자)
    participant UI as Add_SungJuk_UI
    participant P as 교수 (model.prof)
    participant G as 성적 (model.grade)

    Prof_User ->>+ UI: display(교수id, 학생id, 자바, DB, 보안)
    
    UI ->> P: new 교수()
    UI ->>+ P: 교수체크(교수id)
    P -->>- UI: return boolean (true/false)
    
    alt 인증 성공 (true)
        UI ->>+ G: 성적입력(학생id, 자바, DB, 보안)
        
        Note over G: 내부 계산 로직 수행
        G ->> G: 총점 = 자바 + DB + 보안
        G ->> G: 평균 = 총점 / 3.0
        
        G -->>- UI: 입력 및 계산 완료 응답
        UI -->> UI: 결과 메시지 생성 (총점, 평균 포함)
    else 인증 실패 (false)
        UI -->> UI: 결과 메시지 생성 ("ID 일치하지 않음")
    end

    UI -->>- Prof_User: 처리 결과 출력 (HTML String)