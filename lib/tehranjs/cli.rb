require "tehranjs/identity"
require "thor"
require "thor/actions"
require "thor_plus/actions"
require 'tehranjs/cli/serve'

module Tehranjs
  # The Command Line Interface (CLI) for the gem.
  class CLI < Thor
    include Thor::Actions


    package_name Identity.version_label
    namespace :default

    register(
      Serve,
      "serve", "process server",
      "Process for run server",
      hide: true
    )


    def initialize args = [], options = {}, config = {}
      super args, options, config
    end

    desc "-v, [--version]", "Version."
    map %w[-v --version] => :version
    def version
      say Identity.version_label
    end

  end
end