$:.unshift File.dirname(__FILE__) + "/ruby"

%w{ basics }.each do |file|
  require file
end
