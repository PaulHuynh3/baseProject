//
//  BurgerMenuBuilder.swift
//  Paul Huynh
//
//  Created by Paul Huynh on 2020-09-19.
//  Copyright © 2020 Paul Huynh. All rights reserved.
//

import UIKit

class BurgerMenuBuilder {

    func buildCampaignData() -> BurgerMenuCell.Data {
        return BurgerMenuCell.Data(menuName: "Campaign")
    }

    func buildDriveData() -> BurgerMenuCell.Data {
        return BurgerMenuCell.Data(
            menuName: "Drive With Paul Huynh"
        )
    }

    func buildHelpData() -> BurgerMenuCell.Data  {
        return BurgerMenuCell.Data(menuName: "Help")
    }

}
