# ButterflySample

## Requirements

- Swift 5.0 +
- iOS 13.0+
- Xcode 12.1

## Getting Started

1. Just download the repo or clone the repo
2. Open Terminal and go inside the folder,e.g cd [path to inside the repo folder]

4. Go to the folder,Just open the .xcodeproj
5. Switch to the enviroment that you want to test [How to guide here](#how-to-switch-environments)
6. Run the project

    - Note: For M1 Mac - The build should be excluded for arm64 on (Any iOS Simulator SDK) and build only active architecture should be set to true.
    
##Screenshot
![Simulator Screen Shot - iPhone 11 - 2023-03-11 at 10 07 33](https://user-images.githubusercontent.com/25385776/224444989-37837d9d-4e2a-49d4-8bb1-b8d869850ff8.png)
![Simulator Screen Shot - iPhone 11 - 2023-03-11 at 10 07 43](https://user-images.githubusercontent.com/25385776/224445004-0214e449-42eb-4b82-822e-0c038552284c.png)
![Simulator Screen Shot - iPhone 11 - 2023-03-11 at 10 07 55](https://user-images.githubusercontent.com/25385776/224445012-98497182-8224-4921-9e03-829525ebbad9.png)



## Codebase

1. Architecture
    - MVVM - C
        - Model: -  Model refers either to a domain model, which represents real state content (an object-oriented approach), or to the data access layer, which represents content (a data-centric approach)
        
        - View: - As in the model–view–controller (MVC) and model–view–presenter (MVP) patterns, the view is the structure, layout, and appearance of what a user sees on the screen. It displays a representation of the model and receives the user's interaction with the view (mouse clicks, keyboard input, screen tap gestures, etc.), and it forwards the handling of these to the view model via the data binding (properties, event callbacks, etc.) that is defined to link the view and view model.
        
        - ViewModel: - The view model is an abstraction of the view exposing public properties and commands. Instead of the controller of the MVC pattern, or the presenter of the MVP pattern, MVVM has a binder, which automates communication between the view and its bound properties in the view model. The view model has been described as a state of the data in the model.
        
        - Coordinator: - A coordinator is an object (Class type in Swift) which has the sole responsibility, as it’s name implies, to coordinate the App’s navigation. Basically which screen should be shown, what screen should be shown next, etc.
        
        For more detail, check this [wiki](https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518) 
