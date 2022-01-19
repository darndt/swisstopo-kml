require 'sinatra'
require "erb"
require "./mercator"

get '/' do
  erb :about, :locals => {
    kml_link: "http#{'s' if request.secure?}://#{request.host_with_port}/kml"
  }
end

get '/kml' do
  tiles = {
    8 => {x_start: 131, x_end: 136, y_start: 88, y_end: 92},
  }

  if params[:z]
    @z = params[:z].to_i
    @x, @y = params[:x].to_i, params[:y].to_i
    @z = @z + 1
    @x_range = @x*2 .. @x*2+1
    @y_range = @y*2 .. @y*2+1
  else
    @z = 8
    @x_range = tiles[8][:x_start] .. tiles[8][:x_end]
    @y_range = tiles[8][:y_start] .. tiles[8][:y_end]
  end

  @tile_url = "https://wmts10.geo.admin.ch/1.0.0/ch.swisstopo.pixelkarte-farbe/default/current/3857/%{z}/%{x}/%{y}.jpeg"
  @kml_url = "http#{'s' if request.secure?}://#{request.host_with_port}/api?z=%{z}&amp;x=%{x}&amp;y=%{y}"

  erb :kml

end
