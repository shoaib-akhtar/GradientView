Pod::Spec.new do |s|
  s.name         = "GradientView"
  s.version      = "1.0"
  s.summary      = "Use gradient view easily from interface builder or code."
  s.homepage     = "https://github.com/shoaib-akhtar/GradientView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Shoaib Akhtar" => "shoaib.akhtar1@live.com" }
  s.source       = { :git => "https://github.com/shoaib-akhtar/GradientView.git", :branch => "master",
                     :tag => s.version.to_s }
  s.platform     = :ios, '11.0'
  s.requires_arc = true
  s.source_files = "GradientView/*.swift"
  s.resource_bundles = { "GradientView" => "GradientView/*.{lproj,storyboard,png}" }
  s.resource = 'GradientView/*.{storyboard,png}'
  s.frameworks   = 'Foundation', 'UIKit'
  s.swift_version = '5.0'
end
