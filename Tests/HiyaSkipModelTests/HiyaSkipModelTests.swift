import XCTest
import OSLog
import Foundation
import SkipBridge
@testable import HiyaSkipModel

let logger: Logger = Logger(subsystem: "HiyaSkipModel", category: "Tests")

@available(macOS 13, *)
final class HiyaSkipModelTests: XCTestCase {
    override func setUp() {
        #if os(Android)
        // needed to load the compiled bridge from the transpiled tests
        loadPeerLibrary(packageName: "skipapp-hiya", moduleName: "HiyaSkipModel")
        #endif
    }

    func testHiyaSkipModel() throws {
        logger.log("running testHiyaSkipModel")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testViewModel() async throws {
        let vm = ViewModel()
        vm.items.append(Item(title: "ABC"))
        XCTAssertFalse(vm.items.isEmpty)
        XCTAssertEqual("ABC", vm.items.last?.title)

        vm.clear()
        XCTAssertTrue(vm.items.isEmpty)
    }

}
