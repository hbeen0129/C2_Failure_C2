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
    
    @State private var selectedDrink: Drink?
    @State private var selectedQute: Quote?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context // swift data 저장용
    
    
    var body: some View {
//        Text("선택된 카테고리: \(tempFailure.category)")
        // 전체 세로 정렬
        VStack {
            Text("선택한 실패 한 조각과 \n 잘 어울리는 음료를 \n 추천할게요")
                .font(.system(size: 30, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .padding(.top, 65)
            
            Spacer()
            
            if let drink = selectedDrink {
                
            }
            
            
        }
        
    }
}

#Preview {
    DrinkView(tempFailure: TempFailure())
}
