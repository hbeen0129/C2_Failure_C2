//
//  ContentView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

// 버튼 두개 덩어리
enum ButtonType: String, CaseIterable {
    case top = "쇼케이스 보기"
    case bottom = "조각 모으기"
    
    // 백그라운드 컬러
    var returnBgColor: Color {
        switch self {
        case .top:
            return Color.mainPink
        case .bottom:
            return Color.babyPink
            
        }
    }
    
    // 텍스트 컬러
    var returnTextColor: Color {
        switch self {
        case .top:
            return Color.white
        case .bottom:
            return Color.black
            
        }
    }
}

struct ContentView: View {
    // TempFailure 객체 생성 (데이터를 관리하기 위해 사용하는 코드)
    @StateObject var tempFailure = TempFailure()
    
    
    var body: some View {
        
        // 네비게이션 스택으로 전체 네비게이션 뷰로 넘길 버튼 생성을 위한 틀 잡기
        NavigationStack {
            
            // 전체 세로로 쌓기 spacing 뷰 내부 간격
            VStack(spacing: 20) {
                
                // 타이틀
                Text("오늘은 어떤\n실패를 하였나요?")
                    .font(.system(size: 34, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.top, 65)
                
                Spacer() // 화면 비율 맞추기 위함
                
                // 메인 케이크 화면
                cakeView
                
                Spacer()
                
                // 쇼케이스, 조각 버튼
                buttonBotton
                
                Spacer()

                
            }
            .safeAreaPadding(.vertical, 20)
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
    
    // 케이크 뷰를 만들어서 위에 호출
    private var cakeView: some View {
        Image("MainCake")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .background {
                Circle()
                    .fill(Color.babyPink)
            }
    }
    
    // 아래 버튼 뷰
    private var buttonBotton: some View {
        VStack(spacing: 10) {
            // 쇼케이스 버튼 네비게이션
            NavigationLink(destination: ShowCaseView(), label: {
                btnGroup(btn: .top)
            })
            
            // 조각 모으기 버튼 네비게이션
            NavigationLink(destination: RecordView(), label: {
                btnGroup(btn: .bottom)
            })
        }
    }
    
    
    // 버튼 그룹핑 (모양 잡고 텍스트 넣기)
    private func btnGroup(btn: ButtonType) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(btn.returnBgColor)
                .frame(maxWidth: .infinity, maxHeight: 60)
            
            Text(btn.rawValue)
                .font(.headline)
                .foregroundStyle(btn.returnTextColor)
        }
    }
    
}

#Preview {
    ContentView()
}
