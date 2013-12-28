require 'gosu'
Dir.glob('/*.rb') do |model|
  require_relative model
end