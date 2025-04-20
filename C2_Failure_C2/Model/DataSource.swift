//
//  DataSource.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/20/25.
//


// 이 파일은 카테고리, 명언, 음료 데이터를 모아두는 파일 참조 데이터들!

import Foundation

// 명언 구조와 리스트
struct Quote {
    let text: String
    let author: String
}

let quoteList: [Quote] = [
    Quote(text: "실패는 성공으로 가는 디딤돌이다.", author: "토마스 에디슨"),
    Quote(text: "넘어졌다면 일어날 이유가 생긴 것이다.", author: "조엘 오스틴"),
    Quote(text: "실패 없는 삶은 성장 없는 삶이다.", author: "말콤 포브스"),
    Quote(text: "가장 큰 실패는 도전하지 않는 것이다.", author: "조지우드베리"),
    Quote(text: "오늘의 눈물은 내일의 꽃이 된다.", author: "엘리자베스 쿠블러 로스")
]
// 음료 구조와 리스트
struct Drink {
    let name: String
    let imageName: String
}

let drinkList: [Drink] = [
    // 예시: Drink(name: "아메리카노", imageName: "americano")
    Drink(name: "따뜻한 아메리카노", imageName: "Coffee"),
    Drink(name: "레몬에이드", imageName: "Lemonade"),
    Drink(name: "수박 주스", imageName: "WaterMelon"),
    Drink(name: "오렌지 주스", imageName: "OrangeJuice"),
    Drink(name: "딸기 주스", imageName: "StrawberryJuice")
]

// 카테고리 구조와 리스트
struct Category: Hashable {
    let name: String
    let imageName: String
}

let categoryList: [Category] = [
    Category(name: "일", imageName: "WorkCake"),
    Category(name: "대인관계", imageName: "PeopleCake"),
    Category(name: "일상", imageName: "DailyCake"),
    Category(name: "학업", imageName: "StudyCake")
]
