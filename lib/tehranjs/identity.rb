module Tehranjs
  # Gem identity information.
  module Identity
    def self.name
      "tehranjs"
    end

    def self.label
      "Tehran JS"
    end

    def self.version
      "0.0.1"
    end

    def self.version_label
      "#{label} #{version}"
    end

    def self.file_name
      ".#{name}rc"
    end
  end
end
