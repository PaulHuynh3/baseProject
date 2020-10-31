//
//  BurgerMenuBuilder.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-19.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

class BurgerMenuBuilder {

    func buildCampaignData() -> BurgerMenuCell.Data {
        return BurgerMenuCell.Data(menuName: "Campaign")
    }

    func buildDriveWithAynoData() -> BurgerMenuCell.Data {
        return BurgerMenuCell.Data(
            menuName: "Drive With Ayno"
        )
    }

    func buildHelpData() -> BurgerMenuCell.Data  {
        return BurgerMenuCell.Data(menuName: "Help")
    }

}
