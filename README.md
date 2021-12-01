# AnchorKit
Hated how you need to add constraints one by one so this simple tool let's you add them by taking an array of the constraints you want to add, it's an old one and the code might be badly organized, PR's are welcomed.

Installation:

***Just drop the "anchorkit" folder in your project.***

Usage:

```swift
yourView.addAnchors(with: [.top(to: view.safeAreaLayoutGuide.topAnchor, constant: 0), .centerX(to: view.centerXAnchor, constant: 0), .size(.init(width: 50, height: 50))])
```
