//
//  DrinkView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct DrinkView: View {
    @ObservedObject var tempFailure: TempFailure
    
    @Environment(\.modelContext) private var context
    
    // 화면 전환 제어
    @State private var navigationToShowCase = false
    
    // 랜덤 음료/명언 선택
    let randomDrink = drinkList.randomElement()!
    let randomQuote = quoteList.randomElement()!
    
    
    
    var body: some View {
        //        Text("선택된 카테고리: \(tempFailure.category)")
        
        // 네비게이션으로 화면 전환
        NavigationStack {
            // 전체 세로 정렬
            VStack {
                Text("선택한 실패 한 조각과 \n 잘 어울리는 음료를 \n 추천할게요")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                Spacer()
                
                // 음료 이미지
                Image(randomDrink.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 180, maxHeight: 180)
                    .padding(.bottom, 5)
                
                // 음료 이름
                Text(randomDrink.name)
                    .font(.headline)
                    .padding(.bottom, 20)
                
                // 명언
                ZStack {
                    Rectangle()
                        .fill(Color.babyPink.opacity(0.5))
                        .frame(maxWidth: 300, maxHeight: 100)
                        .cornerRadius(16)
                    
                    VStack(spacing: 10) {
                        Text("\(randomQuote.text)")
                            .italic()
                            .multilineTextAlignment(.center)
                        Text("- \(randomQuote.author) -")
                            .font(.caption)
                            .foregroundStyle(Color.black)
                    }
                    
                }
                
                Spacer()
                
                // 저장 버튼
                Button {
                    let newFailure = FailureRecord(
                        date: tempFailure.date,
                        title: tempFailure.title,
                        content: tempFailure.content,
                        category: tempFailure.category,
                        drink: randomDrink.name,
                        quote: randomQuote.text
                    )
                    context.insert(newFailure)
                    try? context.save()
                    
                    // 저장 후 화면 전환
                    navigationToShowCase = true
                    
                } label: {
                    Text("쇼케이스에 담기")
                        .foregroundStyle(Color.white)
//                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.mainPink)
                        .cornerRadius(16)
                    
                    
                }
                
                Spacer()
                
            }
            .safeAreaPadding(.vertical, 20)
            .safeAreaPadding(.horizontal, 20)
            // NavigationLink를 여기서 사용하여 화면 전환을 처리
            NavigationLink(destination: ShowCaseView(), isActive: $navigationToShowCase) {
                EmptyView()
            }
        }
        
    }
    
}

#Preview {
    DrinkView(tempFailure: TempFailure())
}
