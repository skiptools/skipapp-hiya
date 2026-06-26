import Testing
import Foundation
@testable import HiyaSkipModel

@Suite struct HiyaSkipModelTests {

    @Test func hiyaSkipModel() throws {
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
