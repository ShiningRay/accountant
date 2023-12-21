module Accountant
  class Engine < ::Rails::Engine
    isolate_namespace Accountant
    config.generators.api_only = true
  end
end
