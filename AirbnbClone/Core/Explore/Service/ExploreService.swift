//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Andre on 27/07/25.
//

import Foundation

class ExploreService {
    func fetchListings () async throws ->[Listing]{
        return DeveloperPreview.shared.listings
    }
}
