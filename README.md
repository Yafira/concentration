# Concentration
A card game for iOS


# Objective

- Recreate the demonstration given in lecture and then make some small enhancements.

- Get experience creating a project in Xcode and typing code in from scratch.

# Required Tasks

- Get the Concentration game working as demonstrated in lectures 1 and 2.

- Add more cards to the game.

- Add a "New Game" button to the UI which ends the current game in progress and begins a brand new game.

- Shuffle the cards in Concentration's init() method.

- Give your game the concept of a "theme". A theme determines the set of emoji from which cards are chosen. All emoji in a given theme are related by that theme. At least 6 different themes and should choose a random theme each time a new game starts.

- The architecture must make it possible to add a new theme in a single line of code.

- Add a game score label to the UI. Score the game by giving 2 points for every match and penalizing 1 point for every previously seen card that is involved in a mismatch.

- Tracking the flip count almost certainly does not belong in the Controller in a proper MVC architecture - fix that.

- All new UI, nicely laid out and looks good in portrait mode on an iPhone X.

# Tools
XCode 10

Swift 5

MVC Architecture

# Resources
Stanford University's CS193p course Developing iOS11 Apps With Swift, Fall 2017-18

Online Document: The Swift Programming Language (Swift 4)

Online Document: Swift API Design Guidelines

![gif](concentration.gif)
