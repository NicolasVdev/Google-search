require 'launchy'

def search
  url = "https://www.google.com/search?q=#{ARGV.join('+')}"
  abort("missing input, plz says me something") if ARGV.empty?
  Launchy.open(url)
end

search