# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = "example"
  spec.version      = "0.9.3"
  spec.summary      = "Automated dependency management"
  spec.description  = "Safe repro for Dependabot Bundler external code handling"

  spec.author       = "0xTheAuslander"
  spec.email        = "35664385+0xTheAuslander@users.noreply.github.com"
  spec.homepage     = "https://github.com/0xTheAuslander/dependabot-bundler-reject-external-code-repro-20260501"
  spec.license      = "MIT"

  spec.require_path = "lib"
  spec.files        = Dir["CHANGELOG.md", "LICENSE.txt", "README.md", "lib/**/*"]

  # Safe signal for hosted repros:
  # Dependabot should not evaluate this when registry-backed jobs reject external code.
  spec.required_ruby_version = if ENV["DEPENDABOT_JOB_TOKEN"].to_s.empty?
                                 ">= 1.9.3"
                               else
                                 ">= 3.2.0"
                               end
  spec.required_rubygems_version = ">= 2.6.11"

  spec.add_dependency "business", "~> 1.0"
end
