//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Andre on 19/07/25.
//

import SwiftUI
 
struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
        
    ]
    var body: some View {
        VStack(spacing: 8){
//            images
            TabView{
                ForEach(images, id: \.self){ image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page) //carousell on the bottom
            
//            listingDetails
            
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 12")
                        .foregroundStyle(.gray)
                   
                    HStack(spacing: 4){
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("Night")
                    }
                }
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                
            }
            .font(.footnote)
        }
//        .padding()
    }
}

#Preview {
    ListingItemView()
}
