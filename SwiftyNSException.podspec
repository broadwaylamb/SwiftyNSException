#
#  Be sure to run `pod spec lint SwiftyNSException.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name = "SwiftyNSException"
  s.version = "1.0.0"
  s.summary = "A tiny library that lets you catch Objective-C NSExceptions right in your Swift code."

  s.description = <<-DESC
                  SwiftyNSException provides a single function that wraps a closure that can throw
                  an Objective-C exception and rethrows the exception as a proper Swift error.
                  DESC

  s.homepage = "https://github.com/broadwaylamb/SwiftyNSException"

  s.license = { :type => "MIT", :file => "LICENSE" }

  s.author = { "Sergej Jaskiewicz" => "jaskiewiczs@icloud.com" }
  s.social_media_url  = "http://twitter.com/broadway_lamb"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source = { :git => "https://github.com/broadwaylamb/SwiftyNSException.git", :tag => s.version.to_s }
  
  s.source_files  = "SwiftyNSException/NSException+Swift.h", "SwiftyNSException/SwiftyNSException.h", "SwiftyNSException/Wrapper.swift"

end
