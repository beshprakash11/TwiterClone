//
//  EditProfileViewModel.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 23.12.22.
//

import SwiftUI

class EditProfileViewModel: ObservableObject{
    var user: User
    
    @Published var uploadComplete: Bool = false
    
    init(user: User){
        self.user = user
    }
    
    func save(name: String?, bio: String?, website: String?, location: String?){
        guard let userNewName = name else { return }
        guard let userNewBio = bio else { return }
        guard let userNewWebsite = website else { return }
        guard let userNewLocation = location else { return }
        
        self.user.name = userNewName
        self.user.bio = userNewBio
        self.user.website = userNewWebsite
        self.user.location = userNewLocation
        self.uploadComplete.toggle()
        
    }
    
    func uploadProfileImage(text: String, image: UIImage?){
        guard let user = AuthViewModel.shared.curretnUser else { return }
        
        let urlPath = "/users/me/avatar"
        
        if let image = image{
            ImageUploader.uploadImage(paramName: "avatar", fileName: "image1", image: image, urlPath: urlPath)
        }
    }
    
    func uploadUserData(name: String?, bio: String?, website: String?, location: String?){
        let userId = user.id
        let urlPath = USER_BYID + "\(userId)"
        let url = URL(string: urlPath)!
        
        AuthServices.makePatchRequestWithAuth(urlString: url, reqBody: ["name": name, "bio": bio, "website": website, "location": location]) { result in
            DispatchQueue.main.async {
                self.save(name: name, bio: bio, website: website, location: location)
                self.uploadComplete = true
            }
        }
    }
}
