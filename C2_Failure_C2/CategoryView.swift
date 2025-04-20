//
//  CategoryView.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI
import SwiftData

struct CategoryView: View {
    @ObservedObject var tempFailure = TempFailure()
    
    // 2열 그리드 설정
    // GridItem은 그리드의 행 혹은 열에 대한 디스크립션, flexible은 최소/최대값을 정해두고 뷰 크기에 따라 사이즈 조절 가능
    // spacing을 사용해서 사이 간격 20
    // 여기서 그리드아이템을 flexible하게 두개만 만들었으니까 열은 최대 2개임
    let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    
    // 선택된 카테고리 상태 저장 변수
    @State private var selectedCategory: Category? = nil
    // 네비게이션 이동 여부 (카테고리 선택 시에만 넘어가게)
    @State private var navigationToDrink = false

    
    var body: some View {
        // 확인 누르면 DrinkView로 넘어가기 위한 네비게이션 스택
        NavigationStack {
            // 전체 세로 정렬
            VStack {
                Text("오늘의 실패 \n 한 조각을 선택하세요")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .multilineTextAlignment(.center) // 가운데 정렬
                    .padding(.top, 65)
                
                Spacer()
                
                // 카테고리 버튼 그리드
                // 위에서 2열 만들었으니까 세로 정렬되는 그리드 사용!
                LazyVGrid(columns: columns) {
                    ForEach(categoryList, id: \.self) { category in
                        Button {
                            selectedCategory = category // 버튼 클릭하면 카테고리 선택
                            tempFailure.category = category.name // 선택한 카테고리를 tempFailure에 전달
                        } label: {
                            VStack {
                                Image(category.imageName)
                                    .resizable()
                                    .frame(width: 110, height: 110)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 15)
                                    .background(
                                        Circle()
                                            .fill(selectedCategory == category ? Color.babyPink : Color.white)
                                            .frame(width: 155, height: 155)
//                                            .shadow(radius: selectedCategory == category ? 5 : 0)
                                    )
                                Text(category.name)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.black)
                                    .padding(.vertical, 5)
                            }
                        }
                    }
                }
                
                Spacer()
                
                // 확인 버튼
                Button {
                    // 카테고리 선택된 경우에만 이동
                    if selectedCategory != nil {
                        tempFailure.category = selectedCategory!.name // 카테고리 값 저장
                        navigationToDrink = true
                        
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color.mainPink)
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .cornerRadius(16)
                        Text("확인")
                            .font(.headline)
                            .foregroundStyle(Color.white)
                    }
                }
                NavigationLink(
                    destination: DrinkView(tempFailure: tempFailure),
                    isActive: $navigationToDrink,
                    label: { EmptyView() }
                )
                
                Spacer()
                
            }
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
}

#Preview {
    CategoryView()
}
