//
//  NotificationCellViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 12.01.23.
//

import Foundation

class NotificationViewModel: ObservableObject{
    @Published var notifications = [Notification]()
    let user: User
    
    init(user: User){
        self.user = user
        fetchNotifications()
    }
    
    func fetchNotifications(){
        RequestServices.requestDomain = NOTIFICATION_URL + "\(self.user.id)"
        
        RequestServices.fetchData { result in
            switch result{
            case .success(let data):
                guard let notifications = try? JSONDecoder().decode([Notification].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.notifications = notifications
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
