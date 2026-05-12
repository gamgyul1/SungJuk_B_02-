sequenceDiagram
    participant User as 사용자/JSP
    participant UI as Search_SungJuk_UI
    participant P as 교수 (prof)
    participant G as 성적 (gradeObj)

    User->>UI: display(교수id, gradeObj)
    activate UI

    UI->>P: new 교수()
    
    UI->>P: 교수체크(교수id)
    activate P
    P-->>UI: return boolean
    deactivate P

    alt 교수 인증 성공 (true)
        UI->>G: 학점조회()
        activate G
        
        %% 성적 객체 내부의 조건문 판별 로직 시각화
        alt 평균 >= 90
            G-->>UI: return "A학점"
        else 평균 >= 80
            G-->>UI: return "B학점"
        else 평균 < 80
            G-->>UI: return "C학점"
        end
        deactivate G
        
        UI->>UI: 결과 메시지 생성 (학점 포함)
    else 교수 인증 실패 (false)
        UI->>UI: 결과 메시지 생성 ("조회 권한 없음")
    end

    UI-->>User: return result (HTML String)
    deactivate UI