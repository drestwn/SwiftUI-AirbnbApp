//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Andre on 19/07/25.
//

import SwiftUI
 
struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8){
//            images
            ListingImageCarousell(listing: listing)
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
//            listingDetails
            
            HStack(alignment:.top){
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 12")
                        .foregroundStyle(.gray)
                   
                    HStack(spacing: 4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        Text("Night")
                        .foregroundStyle(.black)
                    }
                }
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("\(listing.rating ?? 1)")
                }
                
                .foregroundStyle(.black)
                
            }
            .font(.footnote)
        }
//        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
