//
//  Extension.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import Foundation
import UIKit
import SwiftUI

extension UIApplication{
    //MARK: Cancelthe Keyboard
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
