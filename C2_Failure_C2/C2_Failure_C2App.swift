//
//  C2_Failure_C2App.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/19/25.
//

import SwiftUI

@main
struct C2_Failure_C2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [FailureRecord.self])
        }
    }
}
