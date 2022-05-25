//
//  Date+Extension.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    static func  timeDifference(lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

extension TimeInterval {
    func toString() -> String {
        let seconds = self.truncatingRemainder(dividingBy: 60)
        var minutes = self / 60
        if Int(minutes) <= 0 {
            return "\(Int(seconds)) seconds"
        } else {
            var hour = minutes / 60
            minutes = minutes.truncatingRemainder(dividingBy: 60)
            if Int(hour) <= 0 {
                return "\(Int(minutes)) minutes"
            } else {
                let day = hour / 24
                hour = hour.truncatingRemainder(dividingBy: 24)
                if Int(day) <= 0 {
                    return "\(Int(hour)) hours"
                } else {
                    return "\(Int(day)) days"
                }
            }
        }
    }
}
