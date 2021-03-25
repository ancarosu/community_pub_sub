require_relative 'lib/community_pub_sub/version'

Gem::Specification.new do |spec|
  spec.name          = "community_pub_sub"
  spec.version       = CommunityPubSub::VERSION
  spec.authors       = ["Anca Rosu"]
  spec.email         = ["anca.rosu@unifiedpost.com"]

  spec.summary       = "Publish events and subscribe to topics on GCP"
  spec.homepage      = "http://www.unifiedpost.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "google-cloud-pubsub"
end
