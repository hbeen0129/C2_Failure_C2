//
//  Date.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/22/25.
//

import Foundation

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy / MM / dd HH:mm"
    return formatter.string(from: date)
}
