//
//  FailureRecord.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//


// 이 파일은 최종 저장되는 실패 기록

import Foundation
import SwiftData

// SwiftData에서는 구조체가 아니라 클래스로 모델 생성

@Model // SwiftData 모델임을 선언
class FailureRecord {
    var date: Date
    var title: String
    var content: String
    var category: String
    var drink: String
    var quote: String
    var author: String
    
    init(date: Date, title: String, content: String, category: String, drink: String, quote: String, author: String) {
        self.date = date
        self.title = title
        self.content = content
        self.category = category
        self.drink = drink
        self.quote = quote
        self.author = author
    }
}
