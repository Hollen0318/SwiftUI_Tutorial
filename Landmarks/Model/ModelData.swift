//
//  ModelData.swift
//  Landmarks
//
//  Created by Hollen Zhang on 9/26/23.
//

import Foundation
import Combine

//Declare a new model type that conforms to the ObservableObject protocol from the Combine framework.


final class ModelData: ObservableObject {
    var landmarks: [Landmark] = load("landmarkData.json")
}

//SwiftUI subscribes to your observable object, and updates any views that need refreshing when the data changes.

func load<T: Decodable> (_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
    
}
