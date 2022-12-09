//
//  BlurView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 07.12.22.
//

import SwiftUI
import UIKit
struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
