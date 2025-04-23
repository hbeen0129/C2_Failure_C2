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
        let reversedRecords = Array(failureRecords.reversed())
        
        // 전체 세로 정렬
        VStack {
            Text("나의 실패 조각 \n 쇼케이스")
                .font(.system(size: 30, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Spacer()
            
            //            // 쇼케이스 화면
            //            ZStack {
            //                Image("ShowcaseImage")
            //                    .resizable()
            //                    .frame(width: 360, height: 470)
            //
            //                // 케이크 조각 리스트 (가로 스크롤)
            //                ScrollView(.horizontal, showsIndicators: false) {
            //                    LazyHStack(spacing: 20) {
            //                        ForEach(failureRecords, id: \.self) { failureRecord in
            //                            NavigationLink(destination: ListDetailView(failureRecord: failureRecord)) {
            //                                VStack(spacing: 8) {
            //                                    Image(imageName(for: failureRecord.category))
            //                                        .resizable()
            //                                        .scaledToFit()
            //                                        .frame(width: 100, height: 100)
            //
            //                                    Text(failureRecord.title)
            //                                        .font(.caption)
            //                                        .foregroundStyle(Color.black)
            //                                        .multilineTextAlignment(.center)
            //                                }
            //                                .frame(width: 50) // 한 개당 고정 너비
            //                            }
            //
            //                        }
            //
            //
            //                    }
            //                    .padding(.horizontal, 20)
            //                    .frame(height: 130) // 전체 높이 제한
            //                }
            //                .frame(width: 340, height: 150)
            //                .offset(y: 150) // 쇼케이스 이미지 위에 잘 보이도록 위치 조정
            //
            //            }
            //            Spacer()
            
            // 쇼케이스 화면
            ZStack {
                Image("ShowcaseImage")
                    .resizable()
                    .frame(width: 360, height: 470)
                
                // 케이크 조각 리스트 (가로 스크롤)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(Array(stride(from: 0, to: reversedRecords.count, by: 2)), id: \.self) { index in
                            VStack(spacing: 20) {
                                // 첫번째 조각
                                if index < reversedRecords.count {
                                    CakePieceView(failureRecord: reversedRecords[index])
                                }
                                // 두번째 조각
                                if index + 1 < reversedRecords.count {
                                    CakePieceView(failureRecord: reversedRecords[index + 1])
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
                .frame(width: 340, height: 300) // 케이크 진열대 안에 맞추기
                .offset(y: -20) // 케이크 위치 조절 y가 크면 클수록 아래로!
                
                
            }
            
            // 쇼케이스와 버튼 사이 떨어뜨리기
            Spacer()
            
            // 조각 모으기 페이지로 넘어가기
            NavigationLink(destination: RecordView()) {
                ZStack {
                    Rectangle()
                        .fill(Color.babyPink)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .cornerRadius(20)
                    
                    Text("조각 모으기")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                }
            }
            
            Spacer()
            
                
            
        }
        .safeAreaPadding(.vertical, 20)
        .safeAreaPadding(.horizontal, 20)
        
        
    }
    // 카테고리 이미지 나오게 호출
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

