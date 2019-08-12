
Pod::Spec.new do |s|


s.name         = "BezierSlider"
s.ios.deployment_target = '8.0'
s.version      = "0.1.0"
s.summary      = "BezierSlider lets a user create custom slider from UIBezierPath"
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Oleksandr Yevdokymov" => "oklahoma0707@gmail.com" }

s.homepage = "https://github.com/oleksandryevdokymov/BezierSlider"

s.source = { :git => "https://github.com/oleksandryevdokymov/BezierSlider.git",
:tag => "#{s.version}" }

s.framework = "UIKit"

s.source_files = "BezierSlider/**/*.{swift,h,m}"


s.swift_version = "4.2"


end
