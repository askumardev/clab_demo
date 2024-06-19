class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  validates :request_number, presence: true

  def self.convert_polygon(original_polygon)
    coordinates_str = original_polygon.match(/\(\((.*)\)\)/)[1]
    coordinates = coordinates_str.split(", ").map { |coord| coord.split(" ").map(&:to_f) }
    # transformers = coordinates.map { |lon, lat| [ lon.round(3), lat.round(3) ] }
    coordinates.map { |lon, lat| [ lon.round(3), lat.round(3) ] }
    # transformers.map { |lon, lat| "#{lon} #{lat}" }.join(", ")
    # "POLYGON((" + transformers.map { |lon, lat| "#{lon} #{lat}" }.join(", ") + "))"
  end
end
