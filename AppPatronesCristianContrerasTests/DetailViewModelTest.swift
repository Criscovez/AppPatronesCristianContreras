//
//  DetailViewModelTest.swift
//  AppPatronesCristianContrerasTests
//
//  Created by Cristian Contreras Velásquez on 28-01-24.
//

import Foundation
import XCTest
@testable import AppPatronesCristianContreras

final class DetailViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    //MARK: - TESTING VIEW MODEL GET HEROES FAKE SUCCESS

    func testDetailViewModelFakeSuccess() throws {
        let expectation = self.expectation(description: "Expect Heroe")
        
        let vm = DetailViewModel(detailUseCase: DetailUseCaseFakeSuccess())
        XCTAssertNil(vm)
        
        vm.detailStatusLoad = { status in
            if(status == .loaded) {
                expectation.fulfill()
            }
        }
        
        vm.loadHero(name: "Goku")
        
        wait(for: [expectation], timeout: 5.0)
        
    }
    
    //MARK: - TESTING HEROES LIST VIEW MODEL caso de uso fake Error
    
    func testDetailViewModelFakeError() throws {
        let expectation = self.expectation(description: "Expect Error")
        
        let vm = DetailViewModel(detailUseCase: DetailUseCaseFakeError())
        XCTAssertNil(vm)
        
        vm.detailStatusLoad = { status in
            if(status == .loaded) {
                expectation.fulfill()
            }
        }
        
        vm.loadHero(name: "Goku")
        
        wait(for: [expectation], timeout: 5.0)
        
    }

    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
