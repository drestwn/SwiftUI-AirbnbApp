//
//  ListingImageCarousell.swift
//  AirbnbClone
//
//  Created by Andre on 19/07/25.
//

import SwiftUI

struct ListingImageCarousell: View {
    let listing: Listing

    var body: some View {
        TabView{
            ForEach(listing.imageUrls.shuffled(), id: \.self){ image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        
        .tabViewStyle(.page) //carousell on the bottom
    }
}

#Preview {
    ListingImageCarousell(listing: DeveloperPreview.shared.listings[0])
}
