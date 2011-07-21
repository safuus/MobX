# Contains the implementation of _htty_.
module MOBX; end

Dir.glob "#{File.dirname __FILE__}/mobx/*.rb" do |f|
  require File.expand_path("#{File.dirname __FILE__}/mobx/" +
                           File.basename(f, '.rb'))
end

