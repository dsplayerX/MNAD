//
//  ContentView.swift
//  Meowa
//
//  Created by Dumindu Sameendra on 2024-10-23.
//

import SwiftUI

struct ContentView: View {
//    @State var allBreedsData: [BreedDTO] = []
//    @State var isLoading: Bool = true
//    
//    @State var searchResults: [BreedDTO] = []
//    @State var searchQuery: String = ""
    
    @StateObject var catViewModel: CatViewModel
    
    var body: some View {
        NavigationView {
        VStack {
            if catViewModel.isLoading {
                ProgressView().scaleEffect(2.0)
            } else {
                    List(catViewModel.filteredBreeds, id: \.self) { cat in
                        NavigationLink(
                            destination: CatDetailsView(catViewModel: catViewModel, cat: cat)
                        ) {
                            HStack {
                                AsyncImage(url: URL(string: catViewModel.createImageURL(imageId: cat.referenceImageID))) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                    } else if phase.error != nil {
                                        Image(systemName: "cat.fill").resizable()
                                            .aspectRatio(contentMode: .fit).padding(20).frame(width: 100, height: 100)
                                    } else {
                                        ProgressView().frame(width: 100, height: 100)
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text(cat.name).font(.headline)
                                    Text(cat.temperament).font(.subheadline)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    /// Search UI
                    .searchable(
                        text: $catViewModel.searchQuery,
                              placement: .automatic,
                              prompt: "Search for a cat"
                          )
                    .textInputAutocapitalization(.never)
                    
                    /// Filtering
                    .onChange(of: catViewModel.searchQuery) {
                        self.catViewModel.fetchSearchResults(for: catViewModel.searchQuery)
                    }
                    
                    /// Search empty state
                    .overlay {
                        if catViewModel.filteredBreeds.isEmpty {
                            ContentUnavailableView(
                                "Cat missing!",
                                systemImage: "cat.fill",
                                description: Text("No results for \(catViewModel.searchQuery)")
                            )
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await catViewModel.fetchBreeds()
            }
        }.navigationBarTitle("Meowa")
    }
    
}


#Preview {
    ContentView(catViewModel: CatViewModel())
}
