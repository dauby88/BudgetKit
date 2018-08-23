# BudgetKit

[![Version](https://img.shields.io/cocoapods/v/BudgetKit.svg?style=flat)](https://cocoapods.org/pods/BudgetKit)
[![License](https://img.shields.io/cocoapods/l/BudgetKit.svg?style=flat)](https://cocoapods.org/pods/BudgetKit)
[![Platform](https://img.shields.io/cocoapods/p/BudgetKit.svg?style=flat)](https://cocoapods.org/pods/BudgetKit)

`BudgetKit` is an iOS framework wrapper for the [YNAB (You Need A Budget) Public API](https://api.youneedabudget.com). It manages authentication, network calls, and model objects associated with the API. No need to worry about networking or JSON parsing, simply import `BudgetKit` and start developing your iOS app using the YNAB API!

## Installation

BudgetKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BudgetKit'
```
Install the pod by running `pod install`. You may need to run `pod repo update` first.

Include `BudgetKit` anywhere you need to call the YNAB API or use a YNAB model object with: 

```swift
import BudgetKit
```

## Usage

### Authentication

Refer to the [YNAB Authentication Overview](https://api.youneedabudget.com/#authentication-overview) for guidance on how to obtain a personal access token and/or OAuth client ID.

Login using a personal access token. This is used for testing and has the option to force a failure to test error handling.

```swift
YNAB.login(personalAccessToken: String, shouldFail: Bool = false, authenticated: (() -> Void), failed: @escaping ((Error) -> Void))
```

Login using OAuth. This is the standard method used for logging in to YNAB. You'll use this in any release version of your app. 

```swift
YNAB.login(clientID: String, redirectURI: String, state: String?, authenticated: @escaping (() -> Void), failed: @escaping ((Error) -> Void))
```

### Completion Handlers 
API calls that return data take a `YNABCompletion<T>` which is just a typealias for a closure using a `Result` object. Here are the definitions for each:

```swift
public typealias YNABCompletion<T> = ((Result<T>) -> Void)

public enum Result<T> {
    case success(T)
    case failure(Error)
}
```

Switch on the `result` to handle success and failure cases:

```swift
YNAB.getCategory(budgetID: budgetID, categoryID: categoryID) { (result) in
	switch result {
	case .success(let category):
		// Do something with the category
	case .failure(let error):
		// Handle the error
	}
}
```

### Calling the API
Calls to the API are simple. Here are a few examples:

**Get Budget by ID**  
Returns a single budget with all related entities. This resource is effectively a full budget export.

```swift
YNAB.getBudget(id: UUID, completion: @escaping YNABCompletion<BudgetDetail>)
```

**Get Transactions for a Payee**  
Returns all transactions for a specified payee.  

```swift
YNAB.getTransactionListForPayee(budgetID: UUID, payeeID: UUID, completion: @escaping YNABCompletion<[TransactionDetail]>)
```

## Author

Stuart Daubenmire, dauby88@icloud.com

## License

BudgetKit is available under the MIT license. See the LICENSE file for more info.
