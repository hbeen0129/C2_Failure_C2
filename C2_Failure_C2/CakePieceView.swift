//
//  CakePieceView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/22/25.
//

import SwiftUI

struct CakePieceView: View {
    let failureRecord: FailureRecord
    
    var body: some View {
        NavigationLink(destination: ListDetailView(failureRecord: failureRecord)) {
            VStack(spacing: 8) {
                Image(imageName(for: failureRecord.category))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text(failureRecord.title)
                    .font(.caption)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 100)
        }
    }
    
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

