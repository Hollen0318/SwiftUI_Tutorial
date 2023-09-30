//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Hollen Zhang on 9/26/23.
//

import SwiftUI

struct LandmarkList: View {
//    Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as private.
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter {
            landmark in (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
//        Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                } label : {
                    LandmarkRow(landmark: landmark)
                }
            }
        }
        .navigationTitle("Landmarks")
    }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
