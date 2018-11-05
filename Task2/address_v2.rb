require 'set'
require './Task2/unique_v2'
require './Task2/partner_v2'

# Author: Roman Schmidt, Daniel Osterholz
#
# Includes Unique model.
# Has a hash method to be comparable in hash.
# Has a eql? method which is defined as an synonym for == to make objects comparable.
# Has an each_partner method to to iterate over all partners that have this address.
class AddressV2
  include UniqueV2
  attr_reader(:city, :country, :house_no, :street, :zip)
  alias_method :eql?, :==

  private

  @@registered_elements = Set.new

  def initialize(street, house_no, zip, city, country)
    raise ArgumentError unless street.is_a? String
    street.strip!
    raise ArgumentError if street.length === 0

    raise ArgumentError unless (house_no.is_a? Integer) && house_no > 0

    raise ArgumentError unless zip.is_a? String
    zip.strip!
    raise ArgumentError if zip.length === 0

    raise ArgumentError unless city.is_a? String
    city.strip!
    raise ArgumentError if city.length === 0

    raise ArgumentError unless country.is_a? String
    country.strip!
    raise ArgumentError if country.length === 0

    @registered_partners = []
    @street = street
    @house_no = house_no
    @zip = zip
    @city = city
    @country = country
    ensure_unique(@@registered_elements)
  end

  public

  def add_partner(partner)
    raise ArgumentError unless partner.is_a? PartnerV2
    @registered_partners.push(partner)
  end

  def hash
    prime = 31
    (prime + (@street === nil ? 0 : @street.hash)) *
        (prime + (@house_no === nil ? 0 : @house_no.hash)) *
        (prime + (@zip === nil ? 0 : @zip.hash)) *
        (prime + (@city === nil ? 0 : @city.hash)) *
        (prime + (@country === nil ? 0 : @country.hash))
  end

  def eql?(other)
    unless other.is_a? AddressV2
      raise TypeError
    end
    (other.street === @street &&
        other.house_no === @house_no &&
        other.zip === @zip &&
        other.city === @city &&
        other.country === @country
    )
  end

  def each_partner(&block)
    @registered_partners.each(&block)
    self
  end
end