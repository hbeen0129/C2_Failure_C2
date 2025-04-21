//
//  ShowCaseView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct ShowCaseView: View {
    @Query(sort: \FailureRecord.date, order: .reverse)
    private var failureRecords: [FailureRecord]// SwiftData에서 데이터 불러옴
    @Environment(\.modelContext) private var context
    
    
    
    var body: some View {
        // 전체 세로 정렬
        VStack {
            Text("나의 실패 조각 \n 쇼케이스")
                .font(.system(size: 30, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            
            Spacer()
            
            // 쇼케이스 화면
            ZStack {
                Image("ShowcaseImage")
                    .resizable()
                    .frame(width: 360, height: 470)
                
                // 케이크 조각 리스트 (가로 스크롤)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(failureRecords, id: \.self) { failureRecord in
                            NavigationLink(destination: ListDetailView(failureRecord: failureRecord)) {
                                VStack(spacing: 8) {
                                    Image(imageName(for: failureRecord.category))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .clipShape(Circle())
                                    
                                    Text(failureRecord.title)
                                        .font(.caption)
                                        .foregroundStyle(Color.black)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(width: 90) // 한 개당 고정 너비
                            }
                            
                        }
                        
                        
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 130) // 전체 높이 제한
                }
                .frame(width: 340, height: 150)
                .offset(y: 80) // 쇼케이스 이미지 위에 잘 보이도록 위치 조정
                
            }
            
            Spacer()
            
            
        }
        .safeAreaPadding(.vertical, 20)
        .safeAreaPadding(.horizontal, 20)
//        .onAppear {
//            if failureRecords.isEmpty {
//                let dummy = FailureRecord(
//                    date: Date(),
//                    title: "시험 망함",
//                    content: "공부 안 함",
//                    category: "학업",
//                    drink: "아메리카노",
//                    quote: "실패는 또 다른 시작이다"
//                )
//                context.insert(dummy)
//                try? context.save()
//                print("🌟 더미 데이터 저장 완료")
//            } else {
//                print("✅ 불러온 기록 수: \(failureRecords.count)")
//            }
//        }
    }
    
    // 파일 상단에 추가 (import 밑 아무 곳)
    func imageName(for category: String) -> String {
        switch category {
        case "일": return "WorkCake"
        case "대인관계": return "PeopleCake"
        case "일상": return "DailyCake"
        case "학업": return "StudyCake"
        default: return "MainCake"
        }
    }

}


#Preview {
    ShowCaseView()
}

