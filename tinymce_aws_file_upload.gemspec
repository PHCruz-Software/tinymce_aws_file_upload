# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinymce_aws_file_upload/version'

Gem::Specification.new do |spec|
  spec.name          = "tinymce_aws_file_upload"
  spec.version       = TinymceAwsFileUpload::VERSION
  spec.authors       = ["Ariel Schvartz"]
  spec.email         = ["ari.shh@gmail.com"]
  spec.summary       = %q{TinyMCE AWS file upload}
  spec.description   = %q{Add file upload functionality to TinyMCE rich text editor using aws direct upload.}
  spec.homepage      = "https://github.com/arielschvartz/tinymce_aws_file_upload"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'tinymce-rails'
  spec.add_runtime_dependency 'coffee-rails'
  spec.add_dependency 'railties', '~> 5'
end
