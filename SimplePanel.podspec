Pod::Spec.new do |s|
  s.name         = "SimplePanel"
  s.version      = "0.0.1"
  s.summary      = "iOS: Simple modal panel library."
  s.homepage     = "https://github.com/azu/SimplePanel"
  s.license      = 'MIT'
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = { :git => "https://github.com/azu/SimplePanel.git", :commit => "56aa3d2cb5965cecd7bd44b05f6f10d9021ea356" }
  s.platform     = :ios, '5.0'
  s.source_files = 'SimplePanel/**/*.{h,m,xib}'
  s.framework  = 'QuartzCore'
  s.requires_arc = true
end
