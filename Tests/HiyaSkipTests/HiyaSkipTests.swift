import XCTest
import OSLog
import Foundation
@testable import HiyaSkip

let logger: Logger = Logger(subsystem: "HiyaSkip", category: "Tests")

@available(macOS 13, *)
final class HiyaSkipTests: XCTestCase {

    func testHiyaSkip() throws {
        logger.log("running testHiyaSkip")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testDecodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("HiyaSkip", testData.testModuleName)
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
