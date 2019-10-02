Pod::Spec.new do |s|
  s.name         = "curvyRoute"
  s.version      = "0.2"
  s.summary      = "Curvy routes"
  s.description  = "Display curvy lines on a Map on iOS."
  s.homepage     = "https://github.com/metrolab/curvyRoute"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Metropolis:Lab" => "hello@metropolis-lab.io" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/metrolab/CurvyRoute.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
  s.swift_version = '4.2'
end
