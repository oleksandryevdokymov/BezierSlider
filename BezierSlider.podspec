Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "BezierSlider"
s.summary = "BezierSlider lets crete custom slider from UIBezierPath"
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Oleksandr Yevdokymov" => "oklahoma0707@gmail.com" }
s.homepage = "https://github.com/oleksandryevdokymov/BezierSlider"
s.source = { :git => "https://github.com/oleksandryevdokymov/BezierSlider.git",
:tag => "#{s.version}" }
s.framework = "UIKit"
s.source_files = "BezierSlider/**/*"
s.swift_version = "4.2"

end
