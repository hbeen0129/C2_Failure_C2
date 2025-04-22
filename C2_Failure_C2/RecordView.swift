//
//  RecordView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI

struct RecordView: View {
    @StateObject var tempFailure = TempFailure()
    @State private var showAlert = false
    @State private var navigationToNext = false
    var body: some View {
        
        // 다음 페이지로 넘어가기 위한 네비게이션
        NavigationStack {
            // 스크롤 할 수 있는 뷰로 전체 감싸기
            ScrollView {
                
                // 전체 세로 쌓기
                VStack {
                    
                    // 날짜 데이터
                    Text(formattedDate(tempFailure.date))
                        .foregroundStyle(Color.black)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top, 10)

                    
                    // 텍스트 필드, 에디터

                    TextField("제목을 입력하세요", text: $tempFailure.title)
                        .padding()
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16)
                        .padding(.bottom, 10)
                    
                    
                    ZStack(alignment: .leading) {
                        // 뒷 배경
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .cornerRadius(16)
                            .frame(height: 500)
                        
                        // 텍스트 입력 창
                        TextEditor(text: $tempFailure.content)
                            .padding(.all, 12)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                        
                        // 내용을 입력하세요에 대한 조건문
                        if tempFailure.content.isEmpty {
                            Text("내용을 입력하세요")
                                .font(.subheadline)
                                .foregroundStyle(Color.gray.opacity(0.5))
                                .padding(.bottom, 440)
                                .padding(.leading, 17)
                                
                        }
                        
                            
                    }
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 200)
                }
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                .toolbar {
                    NavigationLink(destination: CategoryView(tempFailure: tempFailure)) { // 카테고리로 전달
                        Text("다음")
                            .foregroundStyle(Color.black)
                            .padding(.trailing, 20)
                    }
                    
                }
                
            }
            .safeAreaPadding(.vertical, 20)
            .safeAreaPadding(.horizontal, 20)
        }
    }
    
//    // 데이터 함수
//    func formattedDate(date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy / MM / dd HH:mm"
//        return formatter.string(from: date)
//    }

}
    
    #Preview {
        RecordView()
    }
