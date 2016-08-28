class String
  @@colors = {black: 30, red: 31, green: 32, yellow: 33, blue: 34, pink: 35, light_grey: 37, white: 97, light_blue: 94}
  
  def self.colors
    return @@colors.keys
  end

  def self.code
  	@@colors.code
  end


  def self.create_colors
  	@@colors.map do |color, code|
      define_method(color.to_s) do
          "\e[#{code}m#{self}\e[0m"
      end
  	end
  end



  def self.sample_colors
  	self.colors.each do |color|
  		puts "This color is ".send(color) + color.to_s.send(color)
  	  # puts color.to_s.send(color)
  	end
  end
end

puts String.create_colors

