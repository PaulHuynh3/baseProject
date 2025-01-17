//
//  DetailedAuctionItemViewModel.swift
//  BaseProject
//
//  Created by Paul Huynh on 2020-12-28.
//  Copyright © 2020 BaseProject. All rights reserved.
//

import Foundation

class DetailedAuctionItemViewModel {

    var data: Product?
    private var seconds = 0
    private var timer: Timer?
    var delegate: DetailedAuctionItemViewModelDelegate?

    private let builder = DetailedAuctionBuilder()

    func configure(delegate: DetailedAuctionItemViewModelDelegate, data: Product?) {
        self.data = data
        self.delegate = delegate
        seconds = data?.remainingTime ?? 0
        setup()
        builder.configure(delegate: self)
    }

    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }

    func buildOfferData() -> DismissableData {
        builder.buildOfferData(product: data)
    }

    func buildConditionData() -> DismissableData {
        builder.buildConditionData()
    }

    private func setup() {
        timer = Timer()
        runTimer()
    }

    private func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        guard seconds > 1 else {
            delegate?.updateCountDown(with: timeString(time: TimeInterval(0)))
            invalidateTimer()
            return
        }
        seconds -= 1
        delegate?.updateCountDown(with: timeString(time: TimeInterval(seconds)))
    }

    private func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

extension DetailedAuctionItemViewModel: DetailedAuctionBuilderDelegate {
    func updateBid(price: Int) {
        delegate?.updateBid(with: price)
    }
}

protocol DetailedAuctionItemViewModelDelegate {
    func updateCountDown(with timeString: String)
    func updateBid(with price: Int)
}
