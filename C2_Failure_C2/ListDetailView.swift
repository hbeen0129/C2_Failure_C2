//
//  ListDetailView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct ListDetailView: View {
    var failureRecord: FailureRecord
    
    @State private var isFlipped = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        VStack {
            if !isFlipped {
                //앞면
                Text("제목: \(failureRecord.title)")
                Text("내용: \(failureRecord.content)")
                Text("카테고리: \(failureRecord.category)")
                
            } else {
                // 뒷면
                Text("음료: \(failureRecord.drink)")
                Text("명언: \(failureRecord.quote)")
            }
            
            
            // 수정, 삭제 버튼
            HStack {
                Button("수정") {
                    // 수정 처리
                }
                .padding()
                Button("삭제") {
                    showDeleteAlert = true
                }
                .padding()
                .foregroundStyle(.red)
//                .alert("정말 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
//                    Button("삭제", role: .destructive) {
//                        context.delete(failureRecord)
//                        try? context.save()
//                        dismiss()
//                    }
//                }
                
            }
            
        }
        
    }
}

//#Preview {
//    ListDetailView(failureRecord: FailureRecord)
//    
//}
