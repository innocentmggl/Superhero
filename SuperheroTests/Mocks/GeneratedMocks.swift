// MARK: - Mocks generated from file: Superhero/Scenes/SearchSuperhero/SearchViewModel.swift at 2020-05-23 23:58:23 +0000

//
//  SearchViewModel.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Cuckoo
@testable import Superhero

import Foundation


 class MockSearchViewModelInput: SearchViewModelInput, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewModelInput
    
     typealias Stubbing = __StubbingProxy_SearchViewModelInput
     typealias Verification = __VerificationProxy_SearchViewModelInput

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewModelInput?

     func enableDefaultImplementation(_ stub: SearchViewModelInput) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func search(superhero: String?)  {
        
    return cuckoo_manager.call("search(superhero: String?)",
            parameters: (superhero),
            escapingParameters: (superhero),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.search(superhero: superhero))
        
    }
    
    
    
     func selectedItem(at index: Int)  {
        
    return cuckoo_manager.call("selectedItem(at: Int)",
            parameters: (index),
            escapingParameters: (index),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.selectedItem(at: index))
        
    }
    

	 struct __StubbingProxy_SearchViewModelInput: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func search<M1: Cuckoo.OptionalMatchable>(superhero: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String?)> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: superhero) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModelInput.self, method: "search(superhero: String?)", parameterMatchers: matchers))
	    }
	    
	    func selectedItem<M1: Cuckoo.Matchable>(at index: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModelInput.self, method: "selectedItem(at: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SearchViewModelInput: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func search<M1: Cuckoo.OptionalMatchable>(superhero: M1) -> Cuckoo.__DoNotUse<(String?), Void> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: superhero) { $0 }]
	        return cuckoo_manager.verify("search(superhero: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func selectedItem<M1: Cuckoo.Matchable>(at index: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return cuckoo_manager.verify("selectedItem(at: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SearchViewModelInputStub: SearchViewModelInput {
    

    

    
     func search(superhero: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func selectedItem(at index: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockSearchViewModelOutput: SearchViewModelOutput, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewModelOutput
    
     typealias Stubbing = __StubbingProxy_SearchViewModelOutput
     typealias Verification = __VerificationProxy_SearchViewModelOutput

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewModelOutput?

     func enableDefaultImplementation(_ stub: SearchViewModelOutput) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var items: Box<[Superhero]> {
        get {
            return cuckoo_manager.getter("items",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.items)
        }
        
    }
    
    
    
     var error: Box<String> {
        get {
            return cuckoo_manager.getter("error",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.error)
        }
        
    }
    
    
    
     var loading: Box<Bool> {
        get {
            return cuckoo_manager.getter("loading",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loading)
        }
        
    }
    
    
    
     var message: Box<String> {
        get {
            return cuckoo_manager.getter("message",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.message)
        }
        
    }
    
    
    
     var route: Box<Router> {
        get {
            return cuckoo_manager.getter("route",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.route)
        }
        
    }
    

    

    

	 struct __StubbingProxy_SearchViewModelOutput: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var items: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModelOutput, Box<[Superhero]>> {
	        return .init(manager: cuckoo_manager, name: "items")
	    }
	    
	    
	    var error: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModelOutput, Box<String>> {
	        return .init(manager: cuckoo_manager, name: "error")
	    }
	    
	    
	    var loading: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModelOutput, Box<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loading")
	    }
	    
	    
	    var message: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModelOutput, Box<String>> {
	        return .init(manager: cuckoo_manager, name: "message")
	    }
	    
	    
	    var route: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModelOutput, Box<Router>> {
	        return .init(manager: cuckoo_manager, name: "route")
	    }
	    
	    
	}

	 struct __VerificationProxy_SearchViewModelOutput: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var items: Cuckoo.VerifyReadOnlyProperty<Box<[Superhero]>> {
	        return .init(manager: cuckoo_manager, name: "items", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var error: Cuckoo.VerifyReadOnlyProperty<Box<String>> {
	        return .init(manager: cuckoo_manager, name: "error", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var loading: Cuckoo.VerifyReadOnlyProperty<Box<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loading", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var message: Cuckoo.VerifyReadOnlyProperty<Box<String>> {
	        return .init(manager: cuckoo_manager, name: "message", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var route: Cuckoo.VerifyReadOnlyProperty<Box<Router>> {
	        return .init(manager: cuckoo_manager, name: "route", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class SearchViewModelOutputStub: SearchViewModelOutput {
    
    
     var items: Box<[Superhero]> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<[Superhero]>).self)
        }
        
    }
    
    
     var error: Box<String> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<String>).self)
        }
        
    }
    
    
     var loading: Box<Bool> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<Bool>).self)
        }
        
    }
    
    
     var message: Box<String> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<String>).self)
        }
        
    }
    
    
     var route: Box<Router> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<Router>).self)
        }
        
    }
    

    

    
}



 class MockSearchViewModel: SearchViewModel, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchViewModel
    
     typealias Stubbing = __StubbingProxy_SearchViewModel
     typealias Verification = __VerificationProxy_SearchViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchViewModel?

     func enableDefaultImplementation(_ stub: SearchViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var items: Box<[Superhero]> {
        get {
            return cuckoo_manager.getter("items",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.items)
        }
        
    }
    
    
    
     var error: Box<String> {
        get {
            return cuckoo_manager.getter("error",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.error)
        }
        
    }
    
    
    
     var loading: Box<Bool> {
        get {
            return cuckoo_manager.getter("loading",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.loading)
        }
        
    }
    
    
    
     var message: Box<String> {
        get {
            return cuckoo_manager.getter("message",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.message)
        }
        
    }
    
    
    
     var route: Box<Router> {
        get {
            return cuckoo_manager.getter("route",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.route)
        }
        
    }
    

    

    
    
    
     func search(superhero: String?)  {
        
    return cuckoo_manager.call("search(superhero: String?)",
            parameters: (superhero),
            escapingParameters: (superhero),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.search(superhero: superhero))
        
    }
    
    
    
     func selectedItem(at index: Int)  {
        
    return cuckoo_manager.call("selectedItem(at: Int)",
            parameters: (index),
            escapingParameters: (index),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.selectedItem(at: index))
        
    }
    

	 struct __StubbingProxy_SearchViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var items: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModel, Box<[Superhero]>> {
	        return .init(manager: cuckoo_manager, name: "items")
	    }
	    
	    
	    var error: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModel, Box<String>> {
	        return .init(manager: cuckoo_manager, name: "error")
	    }
	    
	    
	    var loading: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModel, Box<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loading")
	    }
	    
	    
	    var message: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModel, Box<String>> {
	        return .init(manager: cuckoo_manager, name: "message")
	    }
	    
	    
	    var route: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSearchViewModel, Box<Router>> {
	        return .init(manager: cuckoo_manager, name: "route")
	    }
	    
	    
	    func search<M1: Cuckoo.OptionalMatchable>(superhero: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String?)> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: superhero) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModel.self, method: "search(superhero: String?)", parameterMatchers: matchers))
	    }
	    
	    func selectedItem<M1: Cuckoo.Matchable>(at index: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Int)> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchViewModel.self, method: "selectedItem(at: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SearchViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var items: Cuckoo.VerifyReadOnlyProperty<Box<[Superhero]>> {
	        return .init(manager: cuckoo_manager, name: "items", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var error: Cuckoo.VerifyReadOnlyProperty<Box<String>> {
	        return .init(manager: cuckoo_manager, name: "error", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var loading: Cuckoo.VerifyReadOnlyProperty<Box<Bool>> {
	        return .init(manager: cuckoo_manager, name: "loading", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var message: Cuckoo.VerifyReadOnlyProperty<Box<String>> {
	        return .init(manager: cuckoo_manager, name: "message", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var route: Cuckoo.VerifyReadOnlyProperty<Box<Router>> {
	        return .init(manager: cuckoo_manager, name: "route", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func search<M1: Cuckoo.OptionalMatchable>(superhero: M1) -> Cuckoo.__DoNotUse<(String?), Void> where M1.OptionalMatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String?)>] = [wrap(matchable: superhero) { $0 }]
	        return cuckoo_manager.verify("search(superhero: String?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func selectedItem<M1: Cuckoo.Matchable>(at index: M1) -> Cuckoo.__DoNotUse<(Int), Void> where M1.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: index) { $0 }]
	        return cuckoo_manager.verify("selectedItem(at: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SearchViewModelStub: SearchViewModel {
    
    
     var items: Box<[Superhero]> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<[Superhero]>).self)
        }
        
    }
    
    
     var error: Box<String> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<String>).self)
        }
        
    }
    
    
     var loading: Box<Bool> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<Bool>).self)
        }
        
    }
    
    
     var message: Box<String> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<String>).self)
        }
        
    }
    
    
     var route: Box<Router> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<Router>).self)
        }
        
    }
    

    

    
     func search(superhero: String?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func selectedItem(at index: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Superhero/Scenes/ShowSuperhero/ShowDetailsViewModel.swift at 2020-05-23 23:58:23 +0000

//
//  ShowDetailsViewModel.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Cuckoo
@testable import Superhero

import Foundation


 class MockShowDetailsViewModelOutput: ShowDetailsViewModelOutput, Cuckoo.ProtocolMock {
    
     typealias MocksType = ShowDetailsViewModelOutput
    
     typealias Stubbing = __StubbingProxy_ShowDetailsViewModelOutput
     typealias Verification = __VerificationProxy_ShowDetailsViewModelOutput

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ShowDetailsViewModelOutput?

     func enableDefaultImplementation(_ stub: ShowDetailsViewModelOutput) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var superhero: Superhero {
        get {
            return cuckoo_manager.getter("superhero",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.superhero)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ShowDetailsViewModelOutput: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var superhero: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockShowDetailsViewModelOutput, Superhero> {
	        return .init(manager: cuckoo_manager, name: "superhero")
	    }
	    
	    
	}

	 struct __VerificationProxy_ShowDetailsViewModelOutput: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var superhero: Cuckoo.VerifyReadOnlyProperty<Superhero> {
	        return .init(manager: cuckoo_manager, name: "superhero", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ShowDetailsViewModelOutputStub: ShowDetailsViewModelOutput {
    
    
     var superhero: Superhero {
        get {
            return DefaultValueRegistry.defaultValue(for: (Superhero).self)
        }
        
    }
    

    

    
}



 class MockShowDetailsViewModel: ShowDetailsViewModel, Cuckoo.ProtocolMock {
    
     typealias MocksType = ShowDetailsViewModel
    
     typealias Stubbing = __StubbingProxy_ShowDetailsViewModel
     typealias Verification = __VerificationProxy_ShowDetailsViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ShowDetailsViewModel?

     func enableDefaultImplementation(_ stub: ShowDetailsViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var superhero: Superhero {
        get {
            return cuckoo_manager.getter("superhero",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.superhero)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ShowDetailsViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var superhero: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockShowDetailsViewModel, Superhero> {
	        return .init(manager: cuckoo_manager, name: "superhero")
	    }
	    
	    
	}

	 struct __VerificationProxy_ShowDetailsViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var superhero: Cuckoo.VerifyReadOnlyProperty<Superhero> {
	        return .init(manager: cuckoo_manager, name: "superhero", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ShowDetailsViewModelStub: ShowDetailsViewModel {
    
    
     var superhero: Superhero {
        get {
            return DefaultValueRegistry.defaultValue(for: (Superhero).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: Superhero/Service/SuperheroRepository.swift at 2020-05-23 23:58:23 +0000

//
//  SuperheroRepository.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Cuckoo
@testable import Superhero

import Foundation
import Moya


 class MockSuperheroRepository: SuperheroRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = SuperheroRepository
    
     typealias Stubbing = __StubbingProxy_SuperheroRepository
     typealias Verification = __VerificationProxy_SuperheroRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SuperheroRepository?

     func enableDefaultImplementation(_ stub: SuperheroRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var provider: MoyaProvider<SuperheroApi> {
        get {
            return cuckoo_manager.getter("provider",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.provider)
        }
        
    }
    
    
    
     var requests: Box<[Cancellable]> {
        get {
            return cuckoo_manager.getter("requests",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.requests)
        }
        
    }
    

    

    
    
    
     func searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)  {
        
    return cuckoo_manager.call("searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)",
            parameters: (name, completion),
            escapingParameters: (name, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.searchSuperhero(name: name, completion: completion))
        
    }
    

	 struct __StubbingProxy_SuperheroRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var provider: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSuperheroRepository, MoyaProvider<SuperheroApi>> {
	        return .init(manager: cuckoo_manager, name: "provider")
	    }
	    
	    
	    var requests: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockSuperheroRepository, Box<[Cancellable]>> {
	        return .init(manager: cuckoo_manager, name: "requests")
	    }
	    
	    
	    func searchSuperhero<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(name: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (Result<[Superhero], ApiError>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (Result<[Superhero], ApiError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[Superhero], ApiError>) -> Void)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSuperheroRepository.self, method: "searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SuperheroRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var provider: Cuckoo.VerifyReadOnlyProperty<MoyaProvider<SuperheroApi>> {
	        return .init(manager: cuckoo_manager, name: "provider", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var requests: Cuckoo.VerifyReadOnlyProperty<Box<[Cancellable]>> {
	        return .init(manager: cuckoo_manager, name: "requests", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func searchSuperhero<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(name: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (Result<[Superhero], ApiError>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (Result<[Superhero], ApiError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (Result<[Superhero], ApiError>) -> Void)>] = [wrap(matchable: name) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SuperheroRepositoryStub: SuperheroRepository {
    
    
     var provider: MoyaProvider<SuperheroApi> {
        get {
            return DefaultValueRegistry.defaultValue(for: (MoyaProvider<SuperheroApi>).self)
        }
        
    }
    
    
     var requests: Box<[Cancellable]> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Box<[Cancellable]>).self)
        }
        
    }
    

    

    
     func searchSuperhero(name: String, completion: @escaping (Result<[Superhero], ApiError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Superhero/Utils/SearchManager.swift at 2020-05-23 23:58:23 +0000

//
//  SearchManager.swift
//  Superhero
//
//  Created by Innocent Magagula on 2020/05/22.
//  Copyright © 2020 Innocent Magagula. All rights reserved.
//

import Cuckoo
@testable import Superhero

import Foundation


 class MockSearchManager: SearchManager, Cuckoo.ProtocolMock {
    
     typealias MocksType = SearchManager
    
     typealias Stubbing = __StubbingProxy_SearchManager
     typealias Verification = __VerificationProxy_SearchManager

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: SearchManager?

     func enableDefaultImplementation(_ stub: SearchManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func debounce(forSearch: String, action: @escaping (() -> Void))  {
        
    return cuckoo_manager.call("debounce(forSearch: String, action: @escaping (() -> Void))",
            parameters: (forSearch, action),
            escapingParameters: (forSearch, action),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.debounce(forSearch: forSearch, action: action))
        
    }
    

	 struct __StubbingProxy_SearchManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func debounce<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forSearch: M1, action: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (() -> Void))> where M1.MatchedType == String, M2.MatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (() -> Void))>] = [wrap(matchable: forSearch) { $0.0 }, wrap(matchable: action) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockSearchManager.self, method: "debounce(forSearch: String, action: @escaping (() -> Void))", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_SearchManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func debounce<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forSearch: M1, action: M2) -> Cuckoo.__DoNotUse<(String, (() -> Void)), Void> where M1.MatchedType == String, M2.MatchedType == (() -> Void) {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (() -> Void))>] = [wrap(matchable: forSearch) { $0.0 }, wrap(matchable: action) { $0.1 }]
	        return cuckoo_manager.verify("debounce(forSearch: String, action: @escaping (() -> Void))", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class SearchManagerStub: SearchManager {
    

    

    
     func debounce(forSearch: String, action: @escaping (() -> Void))   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

