Pod::Spec.new do |s|
  s.name = 'rollupweb3'
  s.version = '0.5.3'
  s.license = 'MIT'
  s.summary = 'Ethereum API for Swift'
  s.homepage = 'https://github.com/rollup-sh/web3.swift'
  s.authors = { 'Julien Niset' => 'julien@argent.xyz', 'Matt Marshall' => 'matt@argent.xyz', 'Miguel Angel Quiñones' => 'miguel@argent.xyz' }
  s.source = { :git => 'https://github.com/rollup-sh/web3.swift.git', :tag => s.version.to_s }
  s.module_name = 'web3'

  s.swift_version = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'web3swift/web3swift.h', 'web3swift/src/**/*.swift', 'web3swift/lib/**/*.{c,h}'
  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]' => '$(PODS_TARGET_SRCROOT)/web3swift/lib/**',
    'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]' => '$(PODS_TARGET_SRCROOT)/web3swift/lib/**'
  }
  s.preserve_paths = 'web3swift/lib/**/module.map'


  # Do not include the C libs in export
  s.public_header_files = 'web3swift/web3swift.h'

  s.dependency 'BigInt', '~> 5.0.0'
  s.dependency 'secp256k1.swift', '~> 0.1'
  s.dependency 'GenericJSON', '~> 2.0'

end
