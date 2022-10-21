Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '13.0'
s.name = "HalaanTaskPresentation"
s.summary = "Halal Task Presenter and View"
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Mohamed Eltaweel" => "mohamedmagdy.9080@gmail.com" }

s.homepage = "https://github.com/mohamedmagdy94/HalaanTask"

s.source = { :git => "local only",
             :tag => "#{s.version}" }

s.framework = "UIKit"
s.dependency 'HalaanTaskEntity'

s.source_files = "HalaanTaskPR/**/*.{swift,h,m,xib,storyboard}",  "HalaanTaskPR/Resources/*"
s.resource_bundles = {
    'MyFramework' => ['Pod/Classes/**/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

s.swift_version = "5.0"

end
