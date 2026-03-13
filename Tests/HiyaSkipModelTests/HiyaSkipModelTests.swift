import Testing
import OSLog
import Foundation
import SkipBridge
@testable import HiyaSkipModel

let logger: Logger = Logger(subsystem: "HiyaSkipModel", category: "Tests")

@Suite struct HiyaSkipModelTests {
    init() {
        #if SKIP
        // needed to load the compiled bridge when the tests are transpiled
        loadPeerLibrary(packageName: "skipapp-hiya", moduleName: "HiyaSkipModel")
        #endif
    }

    @Test func hiyaSkipModel() throws {
        logger.log("running testHiyaSkipModel")
        #expect(1 + 2 == 3, "basic test")
    }

    @Test func viewModel() async throws {
        let vm = ViewModel()
        vm.items.append(Item(title: "ABC"))
        #expect(!vm.items.isEmpty)
        #expect(vm.items.last?.title == "ABC")

        vm.clear()
        #expect(vm.items.isEmpty)
    }

}
