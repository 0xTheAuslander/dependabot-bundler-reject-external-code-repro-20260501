# Dependabot Bundler external-code safeguard repro

This repository is a benign public repro for testing whether Bundler update checks
evaluate repository-controlled `.gemspec` code even when Dependabot is configured
with registry access and `insecure-external-code-execution` is left at its default.

The `.gemspec` uses a safe conditional:

- if `DEPENDABOT_JOB_TOKEN` is present, it returns a newer Ruby requirement
- otherwise it returns the old static requirement

If Dependabot opens a PR that inserts a newer `ruby` line into the `Gemfile`,
that is evidence the update path evaluated the expression in-process.
