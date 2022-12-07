//
//  NotificationsView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 25.11.22.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach(0..<9){_ in
                    NotificationCell()
                }
            }//:SV
        }//:VS
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
