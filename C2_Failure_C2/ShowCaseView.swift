//
//  ShowCaseView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct ShowCaseView: View {
    @Query var failureRecords: [FailureRecord] // swiftData 불러오기
    
    
    var body: some View {
        NavigationStack {
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
                }
//                .padding(.bottom, 40)
                
                // 케이크 조각 리스트 (가로 스크롤)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
//                        ForEach(failureRecords.chunked(into: 4), id: \.self) { chunk in
//                            VStack {
//                                ForEach(chunk, id: \.self) { FailureRecord in
//                                    Image(FailureRecord.category)
//                                        .resizable()
//                                        .frame(width: 150, height: 150)
//                                    Text(FailureRecord.title)
//                                }
//                            }
//                        }
                        ForEach(failureRecords, id: \.self) { failureRecord in
                            NavigationLink(destination: ListDetailView(failureRecord: failureRecord)) {
                                VStack(spacing: 20) {
                                    Image(failureRecord.category)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text(failureRecord.title)
                                        .font(.caption)
                                        .foregroundStyle(Color.black)
                                }
                                .frame(width: 70)
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            .safeAreaPadding(.vertical, 20)
            .safeAreaPadding(.horizontal, 20)
        }
    }
}
#Preview {
    ShowCaseView()
}
