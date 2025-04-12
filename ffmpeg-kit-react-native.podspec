require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "ffmpeg-kit-react-native"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source = { :git => "https://github.com/brendan1809/ffmpeg-kit-react-native", :tag => "react.native.v#{s.version}-avrecorder" }

  s.default_subspec   = 'https'

  s.dependency "React-Core"

  s.subspec 'https' do |ss|
      ss.source_files      = '**/FFmpegKitReactNativeModule.m',
                             '**/FFmpegKitReactNativeModule.h'
      ss.dependency 'brendan1809-ffmpeg-kit-ios-video', "6.0.3"
      ss.ios.deployment_target = '15.1'
  end

end