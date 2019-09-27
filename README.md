# BezierSlider
![](https://github.com/oleksandryevdokymov/BezierSlider/blob/master/demo1.gif) ![](https://github.com/oleksandryevdokymov/BezierSlider/blob/master/demo2.gif)

BezierSlider is open source cocoa pod library lets a user create custom slider builded on UIBezierPath(). You can specify a custom thumb and curved shape. Framework also let you receive slider’s current value from delegate method.

## Installation
### CocoaPods
[CocoaPods](https://cocoapods.org) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. 
For information how to use and install, visit their website. To integrate BezierSlider into your Xcode project using CocoaPods, specify it in your Podfile:
```
pod 'BezierSlider'
```
If previous specification does not works, use following:
```
pod 'BezierSlider', :git => 'https://github.com/oleksandryevdokymov/BezierSlider.git'
```

## Requirements
* iOS 10.0+
* Swift 4.2+

## Usage 
1. Add the following import to the top of the file:
```
import BezierSlider
```
2. Use the following to create bezier slider view from UIBezierPath:
```
let bezierSlider =  BezierSlider(curvedPath: <#T##UIBezierPath#>, frame: <#T##CGRect#>)
```
3. Make self as delegate for BezierSlider:
```
bezierSlider.delegate = self
```
4. Append slider as subview to present on screen:
```
view.addSubview(bezierSlider)
```
5. Implement delegate method and comformance to BezierSliderDelegete (method return slider's current value from 0.0 to 1.0): 
```
extension ViewController: BezierSliderDelegate {
    func sliderPositionChanged(value: Float) {
        // use slider’s value when thumb position changed
    }
}
```

## Customization
You can customize the thumb fill and stroke colors, thumb line width and rect, curve stroke color and shape width using the following properties:
```
public var curvedPath: UIBezierPath? { get set }
public var thumbFillColor: UIColor { get set }
public var thumbStrokeColor: UIColor { get set }
public var thumbLineWidth: CGFloat { get set }
public var thumbRect: CGRect { get set }
public var curvedStrokeColor: UIColor { get set }
public var curvedShapeWidth: CGFloat { get set }
```

## Contact info
Easily email me  - [oklahoma0707@gmail.com](oklahoma0707@gmail.com) | *Oleksandr Yevdokymov* 

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
