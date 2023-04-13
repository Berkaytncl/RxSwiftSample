//
//  ListViewModel.swift
//  RxSwiftSample
//
//  Created by Berkay Tuncel on 13.04.2023.
//

import Foundation
import RxSwift
import RxCocoa

class ListViewModel {
    
    var listItems = PublishSubject<[ListModel]>()
    
    func fetchItems() {
        let items = [ListModel(model: "Model S", brand: "Tesla"),
                     ListModel(model: "M6", brand: "BMW"),
                     ListModel(model: "S Class", brand: "Mercedes"),
                     ListModel(model: "R8", brand: "Audi")]
        listItems.onNext(items)
    }
}
