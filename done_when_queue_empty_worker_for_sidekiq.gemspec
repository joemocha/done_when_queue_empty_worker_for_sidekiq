# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'done_when_queue_empty_worker_for_sidekiq/version'

Gem::Specification.new do |spec|
  spec.name          = "done_when_queue_empty_worker_for_sidekiq"
  spec.version       = DoneWhenQueueEmptyWorkerForSidekiq::VERSION
  spec.authors       = ["Sam Schenkman-Moore"]
  spec.email         = ["samsm@samsm.com"]
  spec.summary       = "Like Sidekiq's standard worker, but will exit when the queue runs dry."
  spec.description   = "Like Sidekiq's standard worker, but will exit when the queue runs dry."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sidekiq", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
