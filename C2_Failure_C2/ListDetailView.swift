//
//  ListDetailView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct ListDetailView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isFlipped = false
    @State private var showDeleteAlert = false
    @State private var isEditing = false
    
    @State private var editedTitle: String
    @State private var editedContent: String
    
    var failureRecord: FailureRecord
    
    init(failureRecord: FailureRecord) {
        self.failureRecord = failureRecord
        _editedTitle = State(initialValue: failureRecord.title)
        _editedContent = State(initialValue: failureRecord.content)
    }
    
    var body: some View {
        
        // 전체 세로 정렬
        VStack {
            // 카드 배경
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.2))
                    .shadow(radius: 6)
                
                Group {
                    if isFlipped {
                        backView
                    } else {
                        frontView
                    }
                }
                .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .animation(.easeInOut(duration: 0.5), value: isFlipped)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .onTapGesture {
                withAnimation {
                    isFlipped.toggle()
                }
            }
            
            .toolbar {
                // 상단 저장 버튼
                ToolbarItem(placement: .navigationBarTrailing) {
                    if isEditing {
                        Button("저장") {
                            failureRecord.title = editedTitle
                            failureRecord.content = editedContent
                            try? context.save()
                            isEditing = false
                        }
                    }
                }
            }
            
            // 수정, 삭제 버튼
            HStack {
                // 수정 버튼
                Button {
                    isEditing = true
                } label: {
                    Text("수정")
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.babyPink)
                        .cornerRadius(16)
                }
                // 삭제 버튼
                Button {
                    showDeleteAlert = true
                    
                } label: {
                    Text("삭제")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.mainPink)
                        .cornerRadius(16)
                }
                .foregroundStyle(.red)
                .alert("정말 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                    Button("삭제", role: .destructive) {
                        context.delete(failureRecord)
                        try? context.save()
                        dismiss()
                    }
                    Button("취소", role: .cancel) {}
                }
                
            }
            
        }
        .safeAreaPadding(.vertical, 20)
        .safeAreaPadding(.horizontal, 20)
        
    }
    
    // 카드 화면 앞면 뷰
    var frontView: some View {
        ScrollView {
            VStack(spacing: 12) {
                // 작성한 날짜 불러오기
                Text("\(formattedDate(failureRecord.date))")
                
                Spacer()
                
                // 카테고리
                Image(imageName(for: failureRecord.category))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                if isEditing {
                    TextField("", text: $editedTitle)
                        .textFieldStyle(PlainTextFieldStyle()) // 기본 스타일 없애기
                        .padding(.all, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                    ZStack {
                        // 뒷 배경
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(10)
                            .frame(height: 300)
                        
                        // 텍스트 입력 창
                        TextEditor(text: $editedContent)
                            .padding(.all, 10)
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)
                    }
                    
                } else {
                    Text("\(failureRecord.title)") // 제목
                        .font(.title2).bold()
                    Text("\(failureRecord.content)") // 내용
                }
                
                Spacer()
                
            }
            .padding()
            
        }
    }
    
    // 카드 화면 뒷변 뷰
    var backView: some View {
        VStack(spacing: 12) {
            Image(drinkImageName(for: failureRecord.drink))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("\(failureRecord.quote)")
            Text("- \(failureRecord.author) -")
        }
        .padding()
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0)) // 뒷면 뒤집힘
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
    
    // 음료 이미지 나오게 호출
    func drinkImageName(for drink: String) -> String {
        switch drink {
        case "따뜻한 아메리카노": return "Coffee"
        case "레몬에이드": return "Lemonade"
        case "수박 주스": return "WaterMelon"
        case "오렌지 주스": return "OrangeJuice"
        case "딸기 주스": return "StrawberryJuice"
        default: return "Coffee"
        }
    }
}
