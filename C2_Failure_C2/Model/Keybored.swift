//
//  Keybored.swift
//  C2_Failure_C2
//
//  Created by 이혜빈 on 4/20/25.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
