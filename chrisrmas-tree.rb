COLORS = {red: "31", yellow: "33", blue: "34", purple: "35"}
GREEN = "32"
WIDTH = 80

def draw
  tree = ''
  ((1..6).to_a+(3..9).to_a+(6..12).to_a+[2]*4).each{|i| tree+="#{('#'*i*4).center(WIDTH)}\n" };
  puts_star
  turn_on_light(tree)
  puts colorize "Feliz Natal!".center(WIDTH), :red
end


def turn_on_light(tree)  
  tree.each_char do |leaf|
      printf (Random.rand(10)==1 and leaf=='#' ) ? blink : leaf
  end
end

def puts_star  
  puts colorize "★".center(WIDTH), :yellow
end

def blink
  colorize "0", COLORS.keys.sample
end

def colorize(string, color)
  "\e[#{COLORS[color]}m#{string}\e[#{GREEN}m"
end

while true
  draw
  sleep(1)
  system('clear')
end