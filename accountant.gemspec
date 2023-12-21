require_relative "lib/accountant/version"

Gem::Specification.new do |spec|
  spec.name        = "accountant"
  spec.version     = Accountant::VERSION
  spec.authors     = ["ShiningRay"]
  spec.email       = ["tsowly@hotmail.com"]
  spec.homepage    = "https://github.com/ShiningRay/accountant"
  spec.summary     = "Accountant is a gem for accounting."
  spec.description = "A rails engine for accounting."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ShiningRay/accountant"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.2"
  spec.add_dependency "aasm", ">= 5.0.0"
end
