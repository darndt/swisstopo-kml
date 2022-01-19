require 'sinatra'
require "erb"
require "./mercator"

get '/' do
  'Hello world!'
end

get '/api' do
  tiles = {
    8 => {:tile_x_start => 131, :tile_x_end => 136, :tile_y_start => 88, :tile_y_end => 92},
    9 => {:tile_x_start => 262, :tile_x_end => 271, :tile_y_start => 177, :tile_y_end => 183},
    10 => {:tile_x_start => 528, :tile_x_end => 541, :tile_y_start => 356, :tile_y_end => 365},
    11 => {:tile_x_start => 1057, :tile_x_end => 1083, :tile_y_start => 713, :tile_y_end => 730},
    12 => {:tile_x_start => 2115, :tile_x_end => 2167, :tile_y_start => 1427, :tile_y_end => 1460},
    13 => {:tile_x_start => 4231, :tile_x_end => 4335, :tile_y_start => 2854, :tile_y_end => 2921},
    14 => {:tile_x_start => 8462, :tile_x_end => 8670, :tile_y_start => 5708, :tile_y_end => 5842},
    15 => {:tile_x_start => 16925, :tile_x_end => 17341, :tile_y_start => 11416, :tile_y_end => 11684},
  }

  # template = File.dirname(__FILE__) + '/api/kml_template.rhtml'

  # erb = ERB.new(File.read(template).gsub(/^\s+/, ""), 0, "%<>")

  if params[:z].nil?
    x_range = tiles[8][:tile_x_start]..tiles[8][:tile_x_end]
    y_range = tiles[8][:tile_y_start]..tiles[8][:tile_y_end]
    erb :kml, :locals => {:x_range => x_range, :y_range => y_range, :z => 8}
  else

    z = params[:z].to_i  # assumes z>=9
    x, y = params[:x].to_i, params[:y].to_i

    x_range = (x*2)..(x*2+1)
    y_range = (y*2)..(y*2+1)
    erb :kml, :locals => {:x_range => x_range, :y_range => y_range, :z => z+1}
  end

end
