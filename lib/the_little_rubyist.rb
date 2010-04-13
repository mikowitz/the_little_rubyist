$:.unshift File.dirname(__FILE__) + "/ruby"

Dir["lib/ruby/**/*.rb"].each do |file|
  require file
end
