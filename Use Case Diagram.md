```mermaid
graph LR
    subgraph 성적관리시스템
        UC1(성적입력)
        UC2(학점조회)
        UC3(교수체크)
        
        UC1 -.->|&lt;&lt;include&gt;&gt;| UC3
        UC2 -.->|&lt;&lt;include&gt;&gt;| UC3
    end
    
    교수((교수)) --> UC1
    교수((교수)) --> UC2