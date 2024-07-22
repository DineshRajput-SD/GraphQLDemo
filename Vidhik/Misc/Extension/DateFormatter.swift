//
//  DateFormatter.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 14/05/24.
//

import Foundation

extension Date {
    /// Converts the date to string based on a relative time language. i.e. just now, 1 minute ago etc...
    func toStringWithRelativeTime(strings:[RelativeTimeStringType:String]? = nil) -> String {
        
        let time = self.timeIntervalSince1970
        let now = Date().timeIntervalSince1970
        let isPast = now - time > 0
        
        let sec:Double = abs(now - time)
        let min:Double = round(sec/60)
        let hr:Double = round(min/60)
        let d:Double = round(hr/24)
        
        if sec < 60 {
            if sec < 10 {
                if isPast {
                    return strings?[.nowPast] ?? NSLocalizedString("just now", comment: "Date format")
                } else {
                    return strings?[.nowFuture] ?? NSLocalizedString("in a few seconds", comment: "Date format")
                }
            } else {
                let string:String
                if isPast {
                    string = strings?[.secondsPast] ?? NSLocalizedString("%.f seconds ago", comment: "Date format")
                } else {
                    string = strings?[.secondsFuture] ?? NSLocalizedString("in %.f seconds", comment: "Date format")
                }
                return String(format: string, sec)
            }
        }
        if min < 60 {
            if min == 1 {
                if isPast {
                    return strings?[.oneMinutePast] ?? NSLocalizedString("1 minute ago", comment: "Date format")
                } else {
                    return strings?[.oneMinuteFuture] ?? NSLocalizedString("in 1 minute", comment: "Date format")
                }
            } else {
                let string:String
                if isPast {
                    string = strings?[.minutesPast] ?? NSLocalizedString("%.f minutes ago", comment: "Date format")
                } else {
                    string = strings?[.minutesFuture] ?? NSLocalizedString("in %.f minutes", comment: "Date format")
                }
                return String(format: string, min)
            }
        }
        if hr < 24 {
            if hr == 1 {
                if isPast {
                    return strings?[.oneHourPast] ?? NSLocalizedString("1 hour ago", comment: "Date format")
                } else {
                    return strings?[.oneHourFuture] ?? NSLocalizedString("next hour", comment: "Date format")
                }
            } else {
                let string:String
                if isPast {
                    string = strings?[.hoursPast] ?? NSLocalizedString("%.f hours ago", comment: "Date format")
                } else {
                    string = strings?[.hoursFuture] ?? NSLocalizedString("in %.f hours", comment: "Date format")
                }
                return String(format: string, hr)
            }
        }
        if d < 7 {
            if d == 1 {
                if isPast {
                    return strings?[.oneDayPast] ?? NSLocalizedString("yesterday", comment: "Date format")
                } else {
                    return strings?[.oneDayFuture] ?? NSLocalizedString("tomorrow", comment: "Date format")
                }
            } else {
                //let intD: Int = Int(d)
                // return "\(intD)"
                
                let string:String
                if isPast {
                    string = strings?[.daysPast] ?? NSLocalizedString("%.f days ago", comment: "Date format")
                } else {
                    string = strings?[.daysFuture] ?? NSLocalizedString("in %.f days", comment: "Date format")
                }
                return String(format: string, d)
                
            }
        }
        if d < 28 {
            if isPast {
                if compare(.isLastWeek) {
                    return strings?[.oneWeekPast] ?? NSLocalizedString("last week", comment: "Date format")
                } else {
                    let string = strings?[.weeksPast] ?? NSLocalizedString("%.f weeks ago", comment: "Date format")
                    return String(format: string, Double(abs(since(Date(), in: .week))))
                }
            } else {
                if compare(.isNextWeek) {
                    return strings?[.oneWeekFuture] ?? NSLocalizedString("next week", comment: "Date format")
                } else {
                    let string = strings?[.weeksFuture] ?? NSLocalizedString("in %.f weeks", comment: "Date format")
                    return String(format: string, Double(abs(since(Date(), in: .week))))
                }
            }
        }
        if compare(.isThisYear) {
            if isPast {
                if compare(.isLastMonth) {
                    return strings?[.oneMonthPast] ?? NSLocalizedString("last month", comment: "Date format")
                } else {
                    let string = strings?[.monthsPast] ?? NSLocalizedString("%.f months ago", comment: "Date format")
                    return String(format: string, Double(abs(since(Date(), in: .month))))
                }
            } else {
                if compare(.isNextMonth) {
                    return strings?[.oneMonthFuture] ?? NSLocalizedString("next month", comment: "Date format")
                } else {
                    let string = strings?[.monthsFuture] ?? NSLocalizedString("in %.f months", comment: "Date format")
                    return String(format: string, Double(abs(since(Date(), in: .month))))
                }
            }
        }
        if isPast {
            if compare(.isLastYear) {
                return strings?[.oneYearPast] ?? NSLocalizedString("last year", comment: "Date format")
            } else {
                let string = strings?[.yearsPast] ?? NSLocalizedString("%.f years ago", comment: "Date format")
                return String(format: string, Double(abs(since(Date(), in: .year))))
            }
        } else {
            if compare(.isNextYear) {
                return strings?[.oneYearFuture] ?? NSLocalizedString("next year", comment: "Date format")
            } else {
                let string = strings?[.yearsFuture] ?? NSLocalizedString("in %.f years", comment: "Date format")
                return String(format: string, Double(abs(since(Date(), in: .year))))
            }
        }
    }
    
    // MARK: Compare Dates
    /// Compares dates to see if they are equal while ignoring time.
    func compare(_ comparison: DateComparisonType) -> Bool {
        switch comparison {
        case .isToday:
            return compare(.isSameDay(as: Date()))
        case .isTomorrow:
            let comparison = Date().adjust(.day, offset:1)
            return compare(.isSameDay(as: comparison))
        case .isYesterday:
            let comparison = Date().adjust(.day, offset: -1)
            return compare(.isSameDay(as: comparison))
        case .isSameDay(let date):
            return component(.year) == date.component(.year)
                && component(.month) == date.component(.month)
                && component(.day) == date.component(.day)
        case .isThisWeek:
            return self.compare(.isSameWeek(as: Date()))
        case .isNextWeek:
            let comparison = Date().adjust(.week, offset:1)
            return compare(.isSameWeek(as: comparison))
        case .isLastWeek:
            let comparison = Date().adjust(.week, offset:-1)
            return compare(.isSameWeek(as: comparison))
        case .isSameWeek(let date):
            if component(.week) != date.component(.week) {
                return false
            }
            // Ensure time interval is under 1 week
            return abs(self.timeIntervalSince(date)) < Date.weekInSeconds
        case .isThisMonth:
            return self.compare(.isSameMonth(as: Date()))
        case .isNextMonth:
            let comparison = Date().adjust(.month, offset:1)
            return compare(.isSameMonth(as: comparison))
        case .isLastMonth:
            let comparison = Date().adjust(.month, offset:-1)
            return compare(.isSameMonth(as: comparison))
        case .isSameMonth(let date):
            return component(.year) == date.component(.year) && component(.month) == date.component(.month)
        case .isThisYear:
            return self.compare(.isSameYear(as: Date()))
        case .isNextYear:
            let comparison = Date().adjust(.year, offset:1)
            return compare(.isSameYear(as: comparison))
        case .isLastYear:
            let comparison = Date().adjust(.year, offset:-1)
            return compare(.isSameYear(as: comparison))
        case .isSameYear(let date):
            return component(.year) == date.component(.year)
        case .isInTheFuture:
            return self.compare(.isLater(than: Date()))
        case .isInThePast:
            return self.compare(.isEarlier(than: Date()))
        case .isEarlier(let date):
            return (self as NSDate).earlierDate(date) == self
        case .isLater(let date):
            return (self as NSDate).laterDate(date) == self
        case .isWeekday:
            return !compare(.isWeekend)
        case .isWeekend:
            let range = Calendar.current.maximumRange(of: Calendar.Component.weekday)!
            return (component(.weekday) == range.lowerBound || component(.weekday) == range.upperBound - range.lowerBound)
        }
    }
    
    // MARK: Adjust dates
    /// Creates a new date with adjusted components
    
    func adjust(_ component: DateComponentType, offset:Int) -> Date {
        var dateComp = DateComponents()
        switch component {
        case .second:
            dateComp.second = offset
        case .minute:
            dateComp.minute = offset
        case .hour:
            dateComp.hour = offset
        case .day:
            dateComp.day = offset
        case .weekday:
            dateComp.weekday = offset
        case .nthWeekday:
            dateComp.weekdayOrdinal = offset
        case .week:
            dateComp.weekOfYear = offset
        case .month:
            dateComp.month = offset
        case .year:
            dateComp.year = offset
        }
        return Calendar.current.date(byAdding: dateComp, to: self)!
    }
    
    // MARK: Time since...
    func since(_ date:Date, in component:DateComponentType) -> Int64 {
        switch component {
        case .second:
            return Int64(timeIntervalSince(date))
        case .minute:
            let interval = timeIntervalSince(date)
            return Int64(interval / Date.minuteInSeconds)
        case .hour:
            let interval = timeIntervalSince(date)
            return Int64(interval / Date.hourInSeconds)
        case .day:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .day, in: .era, for: self)
            let start = calendar.ordinality(of: .day, in: .era, for: date)
            return Int64(end! - start!)
        case .weekday:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekday, in: .era, for: self)
            let start = calendar.ordinality(of: .weekday, in: .era, for: date)
            return Int64(end! - start!)
        case .nthWeekday:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekdayOrdinal, in: .era, for: self)
            let start = calendar.ordinality(of: .weekdayOrdinal, in: .era, for: date)
            return Int64(end! - start!)
        case .week:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .weekOfYear, in: .era, for: self)
            let start = calendar.ordinality(of: .weekOfYear, in: .era, for: date)
            return Int64(end! - start!)
        case .month:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .month, in: .era, for: self)
            let start = calendar.ordinality(of: .month, in: .era, for: date)
            return Int64(end! - start!)
        case .year:
            let calendar = Calendar.current
            let end = calendar.ordinality(of: .year, in: .era, for: self)
            let start = calendar.ordinality(of: .year, in: .era, for: date)
            return Int64(end! - start!)
        }
    }
    
    // MARK: Extracting components
    
    func component(_ component:DateComponentType) -> Int? {
        let components = Date.components(self)
        switch component {
        case .second:
            return components.second
        case .minute:
            return components.minute
        case .hour:
            return components.hour
        case .day:
            return components.day
        case .weekday:
            return components.weekday
        case .nthWeekday:
            return components.weekdayOrdinal
        case .week:
            return components.weekOfYear
        case .month:
            return components.month
        case .year:
            return components.year
        }
    }
    
    // Calculate total numbers of date in a month
    func numberOfDaysInMonth() -> Int {
        let range = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: self)!
        return range.upperBound - range.lowerBound
    }
    
    // Return a integer value of first day of the week
    func firstDayOfWeek() -> Int {
        let distanceToStartOfWeek = Date.dayInSeconds * Double(self.component(.weekday)! - 1)
        let interval: TimeInterval = self.timeIntervalSinceReferenceDate - distanceToStartOfWeek
        return Date(timeIntervalSinceReferenceDate: interval).component(.day)!
    }
    
    // Return a integer value of last day of the week
    func lastDayOfWeek() -> Int {
        let distanceToStartOfWeek = Date.dayInSeconds * Double(self.component(.weekday)! - 1)
        let distanceToEndOfWeek = Date.dayInSeconds * Double(7)
        let interval: TimeInterval = self.timeIntervalSinceReferenceDate - distanceToStartOfWeek + distanceToEndOfWeek
        return Date(timeIntervalSinceReferenceDate: interval).component(.day)!
    }
    
    // MARK: Internal Components for get date from predefine calendar
    internal static func componentFlags() -> Set<Calendar.Component> { return [Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.weekday, Calendar.Component.weekdayOrdinal, Calendar.Component.weekOfYear] }
    internal static func components(_ fromDate: Date) -> DateComponents {
        return Calendar.current.dateComponents(Date.componentFlags(), from: fromDate)
    }
    // MARK: Intervals In Seconds
    internal static let minuteInSeconds:Double = 60
    internal static let hourInSeconds:Double = 3600
    internal static let dayInSeconds:Double = 86400
    internal static let weekInSeconds:Double = 604800
    internal static let yearInSeconds:Double = 31556926
}

// The string keys to modify the strings in relative format
public enum RelativeTimeStringType {
    case nowPast, nowFuture, secondsPast, secondsFuture, oneMinutePast, oneMinuteFuture, minutesPast, minutesFuture, oneHourPast, oneHourFuture, hoursPast, hoursFuture, oneDayPast, oneDayFuture, daysPast, daysFuture, oneWeekPast, oneWeekFuture, weeksPast, weeksFuture, oneMonthPast, oneMonthFuture, monthsPast, monthsFuture, oneYearPast, oneYearFuture, yearsPast, yearsFuture
}

// The type of comparison to do against today's date or with the suplied date.
public enum DateComparisonType {
    
    // Days
    
    /// Checks if date today.
    case isToday
    /// Checks if date is tomorrow.
    case isTomorrow
    /// Checks if date is yesterday.
    case isYesterday
    /// Compares date days
    case isSameDay(as:Date)
    
    // Weeks
    
    /// Checks if date is in this week.
    case isThisWeek
    /// Checks if date is in next week.
    case isNextWeek
    /// Checks if date is in last week.
    case isLastWeek
    /// Compares date weeks
    case isSameWeek(as:Date)
    
    // Months
    
    /// Checks if date is in this month.
    case isThisMonth
    /// Checks if date is in next month.
    case isNextMonth
    /// Checks if date is in last month.
    case isLastMonth
    /// Compares date months
    case isSameMonth(as:Date)
    
    // Years
    
    /// Checks if date is in this year.
    case isThisYear
    /// Checks if date is in next year.
    case isNextYear
    /// Checks if date is in last year.
    case isLastYear
    /// Compare date years
    case isSameYear(as:Date)
    
    // Relative Time
    
    /// Checks if it's a future date
    case isInTheFuture
    /// Checks if the date has passed
    case isInThePast
    /// Checks if earlier than date
    case isEarlier(than:Date)
    /// Checks if later than date
    case isLater(than:Date)
    /// Checks if it's a weekday
    case isWeekday
    /// Checks if it's a weekend
    case isWeekend
    
}

// The date components available to be retrieved or modifed
public enum DateComponentType {
    case second, minute, hour, day, weekday, nthWeekday, week, month, year
}


extension Date {
    func getStrToDate(format:DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let dateStr =  dateFormatter.string(from: self)
        return dateStr
    }
    
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func utcToLocal(format: DateFormate, toFormat:  DateFormate) -> Date? {
        let dateFormatter = DateFormatter()
        let toFormat = toFormat.rawValue == "" ? format.rawValue : toFormat.rawValue
        dateFormatter.dateFormat = format.rawValue //"yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current  // TimeZone(abbreviation: "UTC")
        let dt = dateFormatter.string(from: self)
        dateFormatter.timeZone =  TimeZone.current                     //TimeZone(abbreviation: "en_US_POSIX")
        dateFormatter.dateFormat = toFormat //"h a"
        return dateFormatter.date(from: dt )
    }
    
    func currentDate(formate: String) -> String {
        let dateFromatter = DateFormatter()
        dateFromatter.dateFormat = formate
        let strDate = dateFromatter.string(from: self)
        return strDate
    }
}


extension Date {
    func isBetweeen(date date1: Date, andDate date2: Date) -> Bool {
        return date1.compare(self) == self.compare(date2)
    }
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        // guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 0, to: Date())
    }
    
    
    func dateAt(hours: Int, minutes: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        //get the month/day/year componentsfor today's date.
        var date_components = calendar.components(
            [NSCalendar.Unit.year,
             NSCalendar.Unit.month,
             NSCalendar.Unit.day],
            from: self)
        //Create an NSDate for the specified time today.
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        
        let newDate = calendar.date(from: date_components)!
        return newDate
    }
    
    
    static func getTimeIn12HrsFormate(_ strTime: String) -> String {
        guard strTime != "" else {
            return strTime
        }
        let dateAsString = strTime
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "h:mm a"
        let Date12 = dateFormatter.string(from: date!)
        return Date12
    }
    
    /// FixMe
    
    static func stringFromDate(_ date: Date, format: DateFormat, timeZone: TimeZone = .current) -> String {
        var dateFormatter:DateFormatter {
            switch format {
            case .onlyDate:
                return DateFormatter.dateFormatterOnlyDate
            case .onlyDate6:
                return DateFormatter.dateFormatterOnlyDate6
            case .onlyTime:
                return DateFormatter.dateFormatterOnlyTime
            case .onlyDate1:
                return DateFormatter.dateFormatterOnlyDate1
            case .dayFormat:
                return DateFormatter.dayFormatter
            case .onlyDate2:
                return DateFormatter.dateFormatterOnlyDate2
            case .onlyDate3:
                return DateFormatter.dateFormatterOnlyDate3
            case .onlyTime12:
                return DateFormatter.dateFormatterOnlyTime12
            case .onlyTime24:
                return DateFormatter.dateFormatterOnlyTime24
            case .full:
                return DateFormatter.dateFormatterFullDate
            case .full1:
                return DateFormatter.dateFormatterFullDate1
            case .full2:
                return DateFormatter.dateFormatterFullDate2
            case .onlyDateShort:
                return DateFormatter.dateFormatterOnlyDateShort
            case .onlyMonthShort:
                return DateFormatter.dateFormatterOnlyMonthShort
            case .onlyWeekDay:
                return DateFormatter.dateFormatterOnlyWeekDay
            case .fullDateTimeZone:
                return DateFormatter.dateFormatterFullDateWithTimeZone
            case .dayTimeFormat:
                return DateFormatter.dateFormatterFullDateTime
            case .customFullDate:
                return DateFormatter.customFullDateFormatter
            case .shortTime12:
                return DateFormatter.dateFormatter12HrTime
            }
        }
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: date)
    }
    
    
    static func stringFromDate(_ date:Date, format:DateFormat) -> String {
        var dateFormatter:DateFormatter {
            switch format {
            case .onlyDate:
                return DateFormatter.dateFormatterOnlyDate
            case .onlyDate6:
                return DateFormatter.dateFormatterOnlyDate6
            case .onlyTime:
                return DateFormatter.dateFormatterOnlyTime
            case .onlyDate1:
                return DateFormatter.dateFormatterOnlyDate1
            case .dayFormat:
                return DateFormatter.dayFormatter
            case .onlyDate2:
                return DateFormatter.dateFormatterOnlyDate2
            case .onlyDate3:
                return DateFormatter.dateFormatterOnlyDate3
            case .onlyTime12:
                return DateFormatter.dateFormatterOnlyTime12
            case .onlyTime24:
                return DateFormatter.dateFormatterOnlyTime24
            case .full:
                return DateFormatter.dateFormatterFullDate
            case .full1:
                return DateFormatter.dateFormatterFullDate1
            case .full2:
                return DateFormatter.dateFormatterFullDate2
            case .onlyDateShort:
                return DateFormatter.dateFormatterOnlyDateShort
            case .onlyMonthShort:
                return DateFormatter.dateFormatterOnlyMonthShort
            case .onlyWeekDay:
                return DateFormatter.dateFormatterOnlyWeekDay
            case .fullDateTimeZone:
                return DateFormatter.dateFormatterFullDateWithTimeZone
            case .dayTimeFormat:
                return DateFormatter.dateFormatterFullDateTime
            case .customFullDate:
                return DateFormatter.customFullDateFormatter
            case .shortTime12:
                return DateFormatter.dateFormatter12HrTime
            }
        }
        return dateFormatter.string(from: date).lowercased()
    }
    
    static func dateFromString(_ date:String, format:DateFormat) -> Date? {
        var dateFormatter:DateFormatter {
            
            switch format {
            case .onlyDate:
                return DateFormatter.dateFormatterOnlyDate
            case .onlyDate6:
                return DateFormatter.dateFormatterOnlyDate6
            case .onlyTime:
                return DateFormatter.dateFormatterOnlyTime
            case .onlyDate1:
                return DateFormatter.dateFormatterOnlyDate1
            case .dayFormat:
                return DateFormatter.dayFormatter
            case .dayTimeFormat:
                return DateFormatter.dateFormatterFullDateTime
            case .onlyDate2:
                return DateFormatter.dateFormatterOnlyDate2
            case .onlyDate3:
                return DateFormatter.dateFormatterOnlyDate3
            case .onlyTime12:
                return DateFormatter.dateFormatterOnlyTime12
            case .onlyTime24:
                return DateFormatter.dateFormatterOnlyTime24
            case .full:
                return DateFormatter.dateFormatterFullDate
            case .full1:
                return DateFormatter.dateFormatterFullDate1
            case .full2:
                return DateFormatter.dateFormatterFullDate2
            case .onlyDateShort:
                return DateFormatter.dateFormatterOnlyDateShort
            case .onlyMonthShort:
                return DateFormatter.dateFormatterOnlyMonthShort
            case .onlyWeekDay:
                return DateFormatter.dateFormatterOnlyWeekDay
            case .fullDateTimeZone:
                return DateFormatter.dateFormatterFullDateWithTimeZone
            case .customFullDate:
                return DateFormatter.customFullDateFormatter
            case .shortTime12:
                return DateFormatter.dateFormatter12HrTime
            }
        }
        
        return dateFormatter.date(from: date)
    }
    
    static func getCurrentYearLastTwoDigit() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: date) % 100
    }
    
    static func dateFormatted(_ dateStr: String) -> String? {
        guard dateStr != "" else {
            return nil
        }
        let frmtedDate = Date.dateFromString(dateStr, format: .full)
        return Date.stringFromDate(frmtedDate!, format: .dayTimeFormat)
    }
    
    static func stringFromDateString(_ date: String, sourceFormat: DateFormat, outputFormat: DateFormat , timeZone: TimeZone = .current) -> String? {
        var dateFormatter = sourceFormat.formatter
        dateFormatter.timeZone = timeZone
        guard let convertedDate = dateFormatter.date(from: date) else {
            return nil
        }
        dateFormatter = outputFormat.formatter
        return dateFormatter.string(from: convertedDate)
    }

    static func formatDateWithString(_ inputDateStr: String, inputFormat: DateFormate, outputFormat: DateFormate) -> String{
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = inputFormat.rawValue // Assin raw value of DateFormate to dateformatter object
          guard let inputDate = dateFormatter.date(from: inputDateStr) else { return "" }
          dateFormatter.dateFormat = outputFormat.rawValue
          return dateFormatter.string(from: inputDate)
      }
}

extension Date {
    func UTCDateString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.string(from: self)
    }
    
    func offsetFrom(date: Date) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
        
        let seconds = "\(difference.second ?? 0)s"
        let minutes = "\(difference.minute ?? 0)m" + " " + seconds
        let hours = "\(difference.hour ?? 0)h" + " " + minutes
        let days = "\(difference.day ?? 0)d" + " " + hours
        
        if let day = difference.day, day > 0 { return days }
        if let hour = difference.hour, hour > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
    func getUTCDateFromDateString(_ dateString: String, dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)!
    }
    
    func getStringFromDate(_ date: NSDate, sourceFormat: String, destinationFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = sourceFormat
        dateFormatter.dateFormat = destinationFormat
        let desiredString = dateFormatter.string(from: date as Date)
        return desiredString
    }
}

extension Date {
    static private var ISODateFormatter: ISO8601DateFormatter = {
        return ISO8601DateFormatter()
    }()
    
    static func ISO8601Date(from dateString: String) -> Date? {
        let trimmedIsoString = dateString.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
        let formatter = ISODateFormatter
        return formatter.date(from: trimmedIsoString)
    }
    
    /// Converts the date to string based on a date format, optional timezone and optional locale.
    func toString() -> String {
        let formatter = DateFormatter()
              formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
              return formatter.string(from: self)
    }
}


enum DateFormate: String {
    case ddMMyyyy = "dd-MM-yyyy"
    case yyyyMMdd = "yyyy-MM-dd"
    case fullDate = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//"yyyy-MM-dd'T'HH:mm:ss.SSSZ"//"yyyy-MM-dd'T'HH:mm:ssZ"
    case month  = "MMM"
    case year = "yyyy"
    case date = "dd"
    case weekDay = "EEE"
    case fullWeekDay = "EEEE"
    case monthYear = "MMM, yyyy"
    case dayWithDate = "MMM d, yyyy hh:mm a"
    case dateMonth = "dd MMM"
    case ddMMyyyyHours12 = "dd-MM-yyyy hh:mm a"
    case ddMMyyyyHours24 = "dd-MM-yyyy HH:mm"
    case yyyyMMddHours24 = "yyyy-MM-dd HH:mm" // 2019-09-17 18:21
    case yyyyMMddHours24WithSec = "yyyy-MM-dd HH:mm:ss"
    case mmDDYYYYHours12 = "MMM dd,yyyy hh:mm a"
    case mmDDYYYYHours24 = "MMM dd,yyyy HH:mm"
    case pickerDate = "MMM dd, yyyy"
    case hours24 =  "HH:mm:ss"
    case hours12 =  "hh:mm a"
    case yyyyMMdd12Hours = "yyyy-MM-dd hh:mm a"
    case yyyyMMdd12Hours1 = "yyyy-MM-dd h:mm a"
    case mmmDDYYYYHours12 = "MMM dd, yyyy hh:mm a"
    case dayWithDate12Hours = "MMM d, yyyy hh:mm"
    case mmddyyyy = "MM:dd:yyyy"
    case newddMMyyyy = "dd/MM/yyyy"
    case fullMonthYear = "dd MMMM yyyy hh:mm a"
    case dayWithDateSepratedtime = "d MMM, yyyy (hh:mm a)"
    case mmddyyyyNew = "MM/dd/yyyy"
    case dayWithOutDateSepratedtime = "d MMMM yyyy hh:mm a"
    case dMMMYYYYDate = "d MMM, yyyy"
    case eemmddyy = "dd MMMM, yyyy"
    case newDate = "E, d MMM yyyy HH:mm:ss Z"
     
}

extension String {
    var formettedNumber: String {
        var formattedString: String = ""
        var counter = 0
        let firstStop = 4
        let secondStop = firstStop + 4
        
        self.forEach { (char) in
            if firstStop == counter ||  secondStop == counter {
                formattedString.append(" \(char)")
            } else {
                formattedString.append(char)
            }
            counter += 1
        }
        return formattedString
    }
    
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    var length: Int {
        return self.count
    }
    
//    func isValid(type: RegexType) -> Bool {
//        let regex = type.getRegex()
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
//        return predicate.evaluate(with: self)
//    }
    
    func localizeString() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func utcToLocal(format: DateFormate, toFormat:  DateFormate) -> String {
        let dateFormatter = DateFormatter()
        let toFormat = toFormat.rawValue == "" ? format.rawValue : toFormat.rawValue
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dt = dateFormatter.date(from: self)
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone =  TimeZone.current
        dateFormatter.dateFormat = toFormat //"h a"
        guard let date = dt else { return "" }
        return dateFormatter.string(from: date)
    }
    
    func localToUTC(format: DateFormate, toFormat:  DateFormate) -> String {
        let dateFormatter = DateFormatter()
        let toFormat = toFormat.rawValue == "" ? format.rawValue : toFormat.rawValue
        dateFormatter.dateFormat = format.rawValue
        // new
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        // end
        let dt = dateFormatter.date(from: self)
       // dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = toFormat
        guard let date = dt else { return "" }
        return dateFormatter.string(from: date)
    }
    
    func getStringFromDate(_ date: NSDate, sourceFormat: String, destinationFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        dateFormatter.dateFormat = sourceFormat
        dateFormatter.dateFormat = destinationFormat
        let desiredString = dateFormatter.string(from: date as Date)
        return desiredString
    }
    
    func encodedURL() -> (String) {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
//    func localize() -> String {
//        return NSLocalizedString(self, comment: "")
//    }
}

enum DateFormat {
    case onlyDate, onlyTime, onlyDate1, onlyDate2, onlyDate3, onlyTime12,dayFormat ,onlyTime24, full, full1, full2, onlyDateShort, onlyMonthShort, onlyWeekDay, fullDateTimeZone, dayTimeFormat, onlyDate6, customFullDate, shortTime12
    
    var formatter: DateFormatter {
        
        switch self {
        case .onlyDate:
            return DateFormatter.dateFormatterOnlyDate
        case .onlyDate6:
            return DateFormatter.dateFormatterOnlyDate6
        case .onlyTime:
            return DateFormatter.dateFormatterOnlyTime
        case .onlyDate1:
            return DateFormatter.dateFormatterOnlyDate1
        case .dayFormat:
            return DateFormatter.dayFormatter
        case .onlyDate2:
            return DateFormatter.dateFormatterOnlyDate2
        case .onlyDate3:
            return DateFormatter.dateFormatterOnlyDate3
        case .onlyTime12:
            return DateFormatter.dateFormatterOnlyTime12
        case .onlyTime24:
            return DateFormatter.dateFormatterOnlyTime24
        case .full:
            return DateFormatter.dateFormatterFullDate
        case .full1:
            return DateFormatter.dateFormatterFullDate1
        case .full2:
            return DateFormatter.dateFormatterFullDate2
        case .onlyDateShort:
            return DateFormatter.dateFormatterOnlyDateShort
        case .onlyMonthShort:
            return DateFormatter.dateFormatterOnlyMonthShort
        case .onlyWeekDay:
            return DateFormatter.dateFormatterOnlyWeekDay
        case .fullDateTimeZone:
            return DateFormatter.dateFormatterFullDateWithTimeZone
        case .dayTimeFormat:
            return DateFormatter.dateFormatterFullDateTime
        case .customFullDate:
            return DateFormatter.customFullDateFormatter
        case .shortTime12:
            return DateFormatter.dateFormatter12HrTime
        }
    }
}

extension DateFormatter {
    @nonobjc static let dateFormatterFullDateTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/yyyy hh:mm a"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat =  "MMM d, yyyy"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    
    @nonobjc static let dateFormatterOnlyDate1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MMM/yyyy"
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyDate2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyDate3: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyDate6: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.timeZone = TimeZone.current
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyTime12: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        //formatter.timeZone = TimeZone.current
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyTime24: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    @nonobjc static let dateFormatterFullDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //formatter.timeZone = TimeZone.current
        //  formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    //    @nonobjc static let dateFormatterFullDateWithDateFormate: DateFormatter = {
    //        let formatter = DateFormatter()
    //        formatter.dateFormat = "dd-MM-yyyy h:mm a"
    //        //formatter.timeZone = TimeZone.current
    //        return formatter
    //    }()
    
    
    
    @nonobjc static let dateFormatterFullDate1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        return formatter
    }()
    
    @nonobjc static let dateFormatterFullDate2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy h:mm a"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyDateShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyMonthShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    @nonobjc static let dateFormatterOnlyWeekDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    @nonobjc static let dateFormatterFullDateWithTimeZone: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
    
    static let customFullDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static let dateFormatter12HrTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter
    }()
}


extension String {
    func nsRangeFromRange(range : Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "£ "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.usesGroupingSeparator = false
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }
    
   
    func boolValueFromString() -> Bool {
        return NSString(string: self).boolValue
    }

    func replaceString() -> String {
        
        let strPhone = self.replacingOccurrences(of: "-", with: "")
        return strPhone
    }

    func convertDateFormater(sourceFormat: DateFormate, destinationFormat: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat.rawValue
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = dateFormatter.date(from: self) else {return ""}
         dateFormatter.dateFormat = destinationFormat.rawValue
         return  dateFormatter.string(from: date)
     }
    
    func getDateString(dateFormat: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = dateFormat
        
        let desiredString = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        if desiredString != nil {
            let dateString = dateFormatter.string(from: desiredString!)
            return dateString
        }
        return "-"
    }
}

// MARK: - STRING SUBSCRIPTS EXTENSION
extension String {
    subscript(index: Int) -> String {
        let char = self.index(self.startIndex, offsetBy: index)
        let str = "\(self[char])"
        return str
    }
}



