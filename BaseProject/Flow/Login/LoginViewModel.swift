//
//  DriverLoginViewModel.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-12.
//  Copyright © 2020 Ayno. All rights reserved.
//

import Foundation

class LoginViewModel {

    var delegate: LoginViewModelDelegate?

    func configure(delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }

}

protocol LoginViewModelDelegate {

}
