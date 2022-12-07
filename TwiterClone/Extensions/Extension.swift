//
//  Extension.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 05.12.22.
//

import Foundation
import UIKit

extension UIApplication{
    //MARK: Cancelthe Keyboard
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
