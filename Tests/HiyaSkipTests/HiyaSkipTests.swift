import Testing
import OSLog
import Foundation
@testable import HiyaSkip

let logger: Logger = Logger(subsystem: "HiyaSkip", category: "Tests")

@Suite struct HiyaSkipTests {

    @Test func hiyaSkip() throws {
        logger.log("running testHiyaSkip")
        #expect(1 + 2 == 3, "basic test")
    }

    @Test func decodeType() throws {
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try #require(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        #expect(testData.testModuleName == "HiyaSkip")
    }

}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
