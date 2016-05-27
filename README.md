## Swift-LeftMenu
A generic Left Menu Controller to be used with Drawer Controllers.

**Usage:**

**Create Left Menu Controller**
```swift
let controller:LeftMenuViewController = LeftMenuViewController(nibName: "LeftMenuViewController", bundle: nil)
```

**Assign datasource and delegate object(s)**
```swift
controller.dataSource = dataManager

controller.delegate = dataManager
```

**And That's it. You are good to go.**
```swift
self.navigationController?.pushViewController(controller, animated: true)
```
