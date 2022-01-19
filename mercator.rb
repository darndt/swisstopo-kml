class Mercator
  @@MERCATOR_RANGE = 256
  @@pixelOrigin_x = @@MERCATOR_RANGE / 2.0
  @@pixelOrigin_y = @@MERCATOR_RANGE / 2.0
  @@pixelsPerLonDegree = @@MERCATOR_RANGE / 360.0
  @@pixelsPerLonRadian = @@MERCATOR_RANGE / (2 * Math::PI)

  def self.fromLatLngToPoint(lat, lng) 
    x = 128 + lng * @@pixelsPerLonDegree
    # NOTE(appleton): Truncating to 0.9999 effectively limits latitude to
    # 89.189.  This is about a third of a tile past the edge of the world tile.
    siny = [[Math::sin(lat*Math::PI/180.0), -0.9999].max, 0.9999].min
    y = 128 + 0.5 * Math::log((1 + siny) / (1 - siny)) * (-1.0*@@pixelsPerLonRadian)
    [x, y]
  end
 
  def self.fromPointToLatLng(x, y)
    lng = (x - 128) / @@pixelsPerLonDegree
    latRadians = (y - 128) / (-1.0 * @@pixelsPerLonRadian)
    lat = (2 * Math.atan(Math::exp(latRadians)) - Math::PI / 2) * 180 / Math::PI
    [lat, lng]
  end
  
  # calculates the coordinate of the upper left corner of the tile
  def self.fromTileXYZoomToLatLng(tile_x, tile_y, zoomlevel)
    return self.fromPointToLatLng(tile_x*256.0/2**zoomlevel, tile_y*256.0/2**zoomlevel)
  end
  
end
