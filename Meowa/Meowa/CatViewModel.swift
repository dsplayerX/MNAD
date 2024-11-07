//
//  CatViewModel.swift
//  Meowa
//
//  Created by Dumindu Sameendra on 2024-10-23.
//

import SwiftUI

struct BreedDTO: Codable, Hashable {
    let weight: WeightDTO
    let id, name: String
    let cfaURL: String?
    let vetstreetURL: String?
    let vcahospitalsURL: String?
    let temperament, origin, countryCodes, countryCode: String
    let description, lifeSpan: String
    let indoor, lap: Int?
    let altNames: String?
    let adaptability, affectionLevel, childFriendly, dogFriendly: Int
    let energyLevel, grooming, healthIssues, intelligence: Int
    let sheddingLevel, socialNeeds, strangerFriendly, vocalisation: Int
    let experimental, hairless, natural, rare: Int
    let rex, suppressedTail, shortLegs: Int
    let wikipediaURL: String?
    let hypoallergenic: Int?
    let referenceImageID: String?

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor, lap
        case altNames = "alt_names"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
    }
}

struct WeightDTO: Codable, Hashable {
    let imperial, metric: String
}


class CatViewModel: ObservableObject {
    @Published var allBreedsData: [BreedDTO] = []
    @Published var isLoading: Bool = true
    @Published var searchResults: [BreedDTO] = []
    @Published var searchQuery: String = ""
    
    var filteredBreeds: [BreedDTO] {
        if searchQuery.isEmpty {
            return allBreedsData
            } else {
                return searchResults
            }
        }
    
    
    func fetchBreeds() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        // Create URL
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        
        guard let unwrappedUrl = url else {
            print("Invalid URL")
            return
        }
        
        // Initialize URL session
        do {
            let (data, response) = try await URLSession.shared.data(from: unwrappedUrl)

            // Check if valid response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response.")
                return
            }

            // Decode data as an array of BreedDTO
            let decodedData = try JSONDecoder().decode([BreedDTO].self, from: data)
//            print(decodedData)
            
            // When you are doing any ui updates from a backgorund thread we need to pass that to main thread
            DispatchQueue.main.async { // This here we tell to take it to main thread.
                self.allBreedsData = decodedData
                self.isLoading = false
            }
            print("Fetched successfully")
        } catch {
            print("Something went wrong: \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    func fetchSearchResults(for query: String) {
            searchResults = allBreedsData.filter { cat in
                cat.name
                    .lowercased()
                    .contains(searchQuery)
            }
    }
    
    func createImageURL(imageId: String?) -> String{
        guard let imageId else {
            print("No image ID listed")
            return ""
        }
        return "https://cdn2.thecatapi.com/images/\(imageId).jpg"
    }
}
