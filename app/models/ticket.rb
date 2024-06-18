class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy

  class CoordinateTransformer
    attr_accessor :original_lon, :original_lat, :new_lon, :new_lat

    def initialize(original_lon, original_lat)
      @original_lon = original_lon
      @original_lat = original_lat
      @new_lon, @new_lat = transform_coordinate(@original_lon, @original_lat)
    end

    private
    def transform_coordinate(lon, lat)
      [ lon.round(3), lat.round(3) ]
    end
  end

  def self.convert_polygon(original_polygon)
    coordinates_str = original_polygon.match(/\(\((.*)\)\)/)[1]
    coordinates = coordinates_str.split(", ").map { |coord| coord.split(" ").map(&:to_f) }
    transformers = coordinates.map { |lon, lat| CoordinateTransformer.new(lon, lat) }
    new_coordinates = transformers.map { |transformer| [ transformer.new_lon, transformer.new_lat ] }
    "POLYGON((" + new_coordinates.map { |lon, lat| "#{lon} #{lat}" }.join(", ") + "))"
  end
end
