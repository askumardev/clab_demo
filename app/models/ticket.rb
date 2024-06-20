class Ticket < ApplicationRecord
  has_one :excavator, dependent: :destroy
  validates :request_number, presence: true, uniqueness: true

  def self.convert_polygon(original_polygon)
    coordinates_str = original_polygon.match(/\(\((.*)\)\)/)[1]
    coordinates = coordinates_str.split(", ").map { |coord| coord.split(" ").map(&:to_f) }
    coordinates.map { |lon, lat| [ lon.round(3), lat.round(3) ] }
  end
end
