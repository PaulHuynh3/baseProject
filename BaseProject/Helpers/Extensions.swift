//
//  Extensions.swift
//  Ayno
//
//  Created by Paul Huynh on 2020-09-20.
//  Copyright © 2020 Ayno. All rights reserved.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cell identifier: T.Type, in tableView: UITableView, for indexPath: IndexPath) -> T {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: identifier), for: indexPath) as! T
    }
}

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
