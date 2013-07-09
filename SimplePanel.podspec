Pod::Spec.new do |s|
  s.name         = "SimplePanel"
  s.version      = "0.0.1"
  s.summary      = "iOS: Simple modal panel library."
  s.homepage     = "https://github.com/azu/SimplePanel"
  s.license      = 'MIT'
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = { :git => "https://github.com/azu/SimplePanel.git", :commit => "bd0a368e1184c5f318c246e6a0bfeca342eaf4c5" }
  s.platform     = :ios, '5.0'
  s.source_files = 'SimplePanel/**/*.{h,m,xib}'
  s.framework  = 'QuartzCore'
  s.requires_arc = true
end
