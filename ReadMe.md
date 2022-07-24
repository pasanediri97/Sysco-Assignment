# Sysco LABS | Mobile Hiring Assignment
## _Pasan Induwara Edirisooriya_

## Appliation Overview

- I have used swift and UIKit, Autolayout for the UI development.
- TableView is used for show the list in the main screen.
- TableView is binded by RxSwift.
- Card images are just sample images from picsum.com.
- The app pagination/ load more feature is built with PullToRefreshKit pakckage
- Loading indicators are done with RappleProgressHUD.
- Network api calls are done using Alamofire.

## Tech

I have used few cocoapods package for the app.

- [RxSwift](https://github.com/ReactiveX/RxSwift) - Reactive programming in swift
- [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP networking library written in Swift.
- [RappleProgressHUD](https://github.com/rjeprasad/RappleProgressHUD) - Progress indicator view
- [PullToRefreshKit](https://github.com/LeoMobileDeveloper/PullToRefreshKit) - Pull to refresh and load more functions

## Installation


```sh
cd PasanEdirisooriya-Assignment
pod install
```

## Development

File struture is changed to manage easier.
MVVM artitechture followed
View Controller created in the storyboard and added the tableview in it with binded class with same name.
View Model is cretaed.
Cell class is created with xib file.
Network integration is done with the API service class inside Netowrk folder.
Extensions, Helpers added seperately to manage easier.
API Urls are stored in the CONSTANTS class.
Compliation handlers added for easier to manage the api calls made.
Becasue of the pagination that apis had, The loadmore feature is added for get more data calling the api.
