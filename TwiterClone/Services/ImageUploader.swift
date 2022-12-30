//
//  ImageUploader.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 15.12.22.
//

import SwiftUI

struct ImageUploader {
    static func uploadImage(paramName: String, fileName: String, image: UIImage, urlPath: String){
        let url = URL(string: BASE_URL + "\(urlPath)")!
        let boundary = UUID().uuidString
        let session = URLSession.shared
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        //Authenticatoin
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken")!
        
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var data = Data()
        
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        
        if let imageData = image.jpegData(compressionQuality: 0.1){
            data.append(imageData)
        }
        //data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        session.uploadTask(with: urlRequest, from: data, completionHandler: {responseData, response, error in
            if error ==  nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String : Any]{
                    print(json)
                }
            }
            
        }).resume()
    }
}
