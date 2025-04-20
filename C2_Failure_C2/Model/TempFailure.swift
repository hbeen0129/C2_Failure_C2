//
//  TempFailure.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

// data : 자동으로 현재 날짜 설정
// title : 실패 제목 입력 받음 (RecordView)
// content : 실패 내용 입력 받음 (RecordView)
// category : 카테고리 선택 값 (CategoryView)
// drink : 랜덤 음료 (DrinkView)
// quote : 랜덤 명언 (DrinkView)
// Published를 붙인 이유는 값들이 바뀔 때마다 뷰에 반영되도록 하기 위함
// View에서 이 객체들을 @ObservedObject로 받아오면 됨

// 이 파일은 임시 저장되는 작성 중 데이터

import Foundation

class TempFailure: ObservableObject {
    @Published var date: Date = Date()
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var category: String = ""
    @Published var drink: String = ""
    @Published var quote: String = ""
}
