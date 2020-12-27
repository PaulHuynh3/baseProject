//
//  DetailedAuctionItemViewController.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-26.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import UIKit

class DetailedAuctionItemViewController: UIViewController {
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!

    private var timer: Timer?
    private var seconds: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidDisappear(_ animated: Bool) {
        invalidateTimer()
    }

    private func setup() {
        timer = Timer()
        runTimer()
    }

    func configure(data: MarketProduct) {
        seconds = data.remainingTime
    }

    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        guard seconds ?? 0 > 1 else {
            countDownLabel.text = timeString(time: TimeInterval(0))
            invalidateTimer()
            return
        }
        seconds! -= 1
        countDownLabel.text = timeString(time: TimeInterval(seconds ?? 0))
    }

    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

}
