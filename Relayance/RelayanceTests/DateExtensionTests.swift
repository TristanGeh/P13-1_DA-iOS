//
//  DateExtensionTests.swift
//  RelayanceTests
//

import XCTest
@testable import Relayance

final class DateExtensionTests: XCTestCase {
    
    func testDateFromString() {
        // Given
        let validDateString = "2023-09-10"
        let invalidDateString = "invalid-date-string"
        
        // When
        let validDate = Date.dateFromString(validDateString)
        let invalidDate = Date.dateFromString(invalidDateString)
        
        // Then
        XCTAssertNotNil(validDate, "La fonction devrait retourner une date valide.")
        XCTAssertNil(invalidDate, "La fonction devrait retourner nil pour une chaîne de date invalide.")
    }
    
    func testStringFromDate() {
        // Given
        let date = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 10))!
        
        // When
        let dateString = Date.stringFromDate(date)
        
        // Then
        XCTAssertEqual(dateString, "10-09-2023", "La fonction devrait retourner une chaîne de date au format dd-MM-yyyy.")
    }
    
    func testGetDayMonthYear() {
        // Given
        let date = Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 10))!
        
        // When
        let day = date.getDay()
        let month = date.getMonth()
        let year = date.getYear()
        
        // Then
        XCTAssertEqual(day, 10, "La fonction devrait retourner le jour correct.")
        XCTAssertEqual(month, 9, "La fonction devrait retourner le mois correct.")
        XCTAssertEqual(year, 2023, "La fonction devrait retourner l'année correcte.")
    }
}
