//
//  EditProfileView.swift
//  TwiterClone
//
//  Created by Besh P.Yogi on 20.12.22.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State var profileiage: Image?
    @State private var selectedImage: UIImage?
    @State var imagePickerPresented: Bool = false
    
    //User input field
    @State var name = ""
    @State var location = ""
    @State var bio = ""
    @State var website = ""
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Save")
                            .foregroundColor(.black)
                    })
                }//:HS1
                .padding()
                HStack{
                    Spacer()
                    Text("Edit Profile")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer()
                }//:HS2
            }//:zs
            VStack{
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width, height: 180, alignment: .center)
                    .cornerRadius(0)
                HStack{//Profile image hs
                    if profileiage == nil{
                        Button(action: {
                            self.imagePickerPresented.toggle()
                        }, label: {
                            KFImage(URL(string: USER_BYID+"/id/avatar"))
                                .resizable()
                                .placeholder {
                                    Image(systemName: "person.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75, height: 75,alignment: .center)
                                .clipShape(Circle())
                                .padding(8)
                                .background(.white)
                                .clipShape(Circle())
                                .offset(y: -30)
                                .padding(.leading, 12)
                        })
                        .sheet(isPresented: $imagePickerPresented){
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }else if let image = profileiage{
                        VStack{
                            HStack(alignment: .top) {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75, alignment: .center)
                                    .clipShape(Circle())
                                    .padding(8)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .offset(y: -35)
                            }
                            .padding()
                        }//:VS
                        .padding(.leading, 12)
                    }
                    Spacer()
                }//:Profileimage HS
                .padding(.top, -25)
                .padding(.bottom, -10)
                
                //User field
                VStack{
                    //Name
                    Divider()
                    HStack{
                        ZStack{
                            HStack{
                                Text("Name")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $name, placeholder: "Add your name ..")
                                .padding(.leading, 90)
                        }//:zs
                    }//:HS
                    .padding(.horizontal)
                    //Location
                    Divider()
                    HStack{
                        ZStack{
                            HStack{
                                Text("Location")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $location, placeholder: "Add your location ..")
                                .padding(.leading, 90)
                        }//:zs
                    }//:HS
                    .padding(.horizontal)
                    //Bio
                    Divider()
                    HStack{
                        ZStack(alignment: .topLeading){
                            HStack{
                                Text("Bio")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileBioTextField(bio: $bio)
                                .padding(.leading, 86)
                                .padding(.top, -6)
                                
                        }//:zs
                    }//:HS
                    .padding(.horizontal)
                    //Websites
                    Divider()
                    HStack{
                        ZStack{
                            HStack{
                                Text("Website")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                Spacer()
                            }
                            CustomProfileTextField(message: $website, placeholder: "Add your website ..")
                                .padding(.leading, 90)
                        }//:zs
                    }//:HS
                    .padding(.horizontal)
                }//User vs
            }//INVS_M1
            
            Spacer()
            
        }//VSH
        .background(.white)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

extension EditProfileView{
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileiage = Image(uiImage: selectedImage)
    }
}
