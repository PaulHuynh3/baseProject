//
//  Category.swift
//  BaseProject
//
//  Created by Paul Huynh on 2021-01-01.
//  Copyright © 2021 BaseProject. All rights reserved.
//

import Foundation

enum CategoryType {
    case clothingAccessories
    case electronics
    case entertainmentHobbies
    case healthBeauty
    case homeGarden
    case miscellaneous

    var category: [Category] {
        switch self {
        case .clothingAccessories:
            return [.jewelyAccessories ,.menClothingAndShoes, .womenClothingAndShoes, .kidsClothing, .handBags]
        case .electronics:
            return [.cellphoneAccessories, .computerElectronics, .videoGamesConsoles]
        case .entertainmentHobbies:
            return [.artsCraft, .booksMoviesMusic, .sportingGoods]
        case .healthBeauty:
            return [.menHealthBeauty, .womenHealthBeauty]
        case .homeGarden:
            return [.furniture, .gardenOutdoor, .householdSupplies, .kitchenDining]
        case .miscellaneous:
            return [.officeSupplies, .petSupplies, .miscellaneous]
        }
    }

    var title: String {
        switch self {
        case .clothingAccessories:
            return "Clothing & Accessories"
        case .electronics:
            return "Electronics"
        case .entertainmentHobbies:
            return "Entertainment & Hobbies"
        case .healthBeauty:
            return "Health & Beauty"
        case .homeGarden:
            return "Home & Garden"
        case .miscellaneous:
            return "Miscellaneous"
        }
    }
}

enum Category {
    //ClothingAccessories
    case handBags
    case jewelyAccessories
    case kidsClothing
    case menClothingAndShoes
    case womenClothingAndShoes
    //electronics
    case cellphoneAccessories
    case computerElectronics
    case videoGamesConsoles
    //entertainmentHobbies
    case artsCraft
    case booksMoviesMusic
    case sportingGoods
    //Health&Beauty
    case menHealthBeauty
    case womenHealthBeauty
    //HomeGarden
    case furniture
    case gardenOutdoor
    case householdSupplies
    case kitchenDining
    //miscellaneous
    case officeSupplies
    case petSupplies
    case miscellaneous

    var title: String {
        switch self {
        case .handBags:
            return "HandBags"
        case .jewelyAccessories:
            return "Jewelry & Accessories"
        case .kidsClothing:
            return "Kids Clothing"
        case .menClothingAndShoes:
            return "Men's Clothing & Shoes"
        case .womenClothingAndShoes:
            return "Women's Clothing & Shoes"
        case .cellphoneAccessories:
            return "Cell Phones & Accessories"
        case .computerElectronics:
            return "Computers & Other Electronics"
        case .videoGamesConsoles:
            return "Video Games & Console"
        case .artsCraft:
            return "Arts & Crafts"
        case .booksMoviesMusic:
            return "Books, Movies & Music"
        case .sportingGoods:
            return "Sporting Goods"
        case .menHealthBeauty:
            return "Men's Health & Beauty"
        case .womenHealthBeauty:
            return "Women's Health & Beauty"
        case .furniture:
            return "Furniture"
        case .gardenOutdoor:
            return "Garden & Outdoor"
        case .householdSupplies:
            return "Household supplies"
        case .kitchenDining:
            return "Kitchen & Dining"
        case .officeSupplies:
            return "Office Supplies"
        case .petSupplies:
            return "Pet Supplies"
        case .miscellaneous:
            return "miscellaneous"
        }
    }
}
