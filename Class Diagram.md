```mermaid
classDiagram
    class Add_SungJuk_UI {
        +display() void
    }
    class Search_SungJuk_UI {
        +display() void
    }
    class 교수 {
        -교수id: String
        +교수체크(교수id: String) boolean
    }
    class 성적 {
        -학생id: String
        -자바: int
        -DB: int
        -보안: int
        -총점: int
        -평균: double
        +성적입력(학생id: String, 자바: int, DB: int, 보안: int) void
        +학점조회() String
    }

    Add_SungJuk_UI ..> 교수
    Search_SungJuk_UI ..> 교수
    교수 "1" -- "N" 성적 : 관리
