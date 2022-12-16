//
//  CreateTweetView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 01.12.22.
//

import SwiftUI

struct CreateTweetView: View {
    @ObservedObject var viewModel = CreateTweetViewModel()
    
    @Binding var showCreateTweet: Bool
    @State var text = ""
    
    //image picker
    @State var imagePickerPresented: Bool = false
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 5){//:CreateTweet_VS
            HStack{//:CT_HS
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                Button(action: {
                    if text != ""{
                        self.viewModel.uploadPost(text: text, image: selectedImage)
                    }
                    self.showCreateTweet.toggle()
                }, label: {
                    Text("Tweet")
                        .padding()
                })
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }//:CT_HS
            MultilineTextField(text: $text)
            //Image picker
            if postImage == nil{
                Button(action: {
                    self.imagePickerPresented.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                }).sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                }content: {
                    ImagePicker(image: $selectedImage)
                }
            }
            if let image = postImage{
                ScrollView{
                    VStack{
                        HStack(alignment: .top) {
                            image
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal)
                                .frame(width: width * 0.9, height: height * 0.7)
                                .cornerRadius(16)
                                .clipped()
                        }
                        Spacer()
                    }
                }
            }
        }//:CreateTweet_VS
        .padding()
    }
}

extension CreateTweetView{
    //MARK: Convert UIImage to SwiftUI image
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
