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
           ListingImageCarousell()
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
//            listingDetails
            
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 12")
                        .foregroundStyle(.gray)
                   
                    HStack(spacing: 4){
                        Text("$567")
                            .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        Text("Night")
                        .foregroundStyle(.black)
                    }
                }
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                
                .foregroundStyle(.black)
                
            }
            .font(.footnote)
        }
//        .padding()
    }
}

#Preview {
    ListingItemView()
}
