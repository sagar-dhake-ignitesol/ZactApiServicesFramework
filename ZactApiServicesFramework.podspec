#
#  Be sure to run `pod spec lint ZactApiServicesFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name             = 'ZactApiServicesFramework'
    s.version          = '0.0.1'
    s.summary          = 'A CocoaPods library written in Swift'

    s.description      = <<-DESC
A CocoaPods library written in Swift for calling api.
                       DESC

    s.homepage         = 'https://github.com/sagar-dhake-ignitesol/ZactApiServicesFramework'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { "Sagar" => "sagar.dhake@ignitesol.com" }
    s.source           = { :git => 'https://github.com/sagar-dhake-ignitesol/ZactApiServicesFramework.git', :tag => s.version.to_s }

    s.ios.deployment_target = '10.0'
    s.swift_version = '5.0'
    s.source_files = 'ZactApiServicesFramework/Classes/**/*'

    s.dependency 'Alamofire', '~> 5.6'

end
