require 'set'
require './Task3/unique_v3'
require './Task3/customer_v3'

# Author: Roman Schmidt, Daniel Osterholz
class AddressV3
  include UniqueV3
  attr_reader(:city, :country, :house_no, :street, :zip)
  alias_method :eql?, :==

  private

  @@registered_elements = Set.new

  def initialize(customer, street, house_no, zip, city, country)
    raise ArgumentError unless street.is_a? String
    street.strip!
    raise ArgumentError if street.length === 0

    raise ArgumentError unless (house_no.is_a? Integer) && house_no > 0
    raise ArgumentError unless (customer.is_a? CustomerV3)

    raise ArgumentError unless zip.is_a? String
    zip.strip!
    raise ArgumentError if zip.length === 0

    raise ArgumentError unless city.is_a? String
    city.strip!
    raise ArgumentError if city.length === 0

    raise ArgumentError unless country.is_a? String
    country.strip!
    raise ArgumentError if country.length === 0

    @street = street
    @house_no = house_no
    @zip = zip
    @city = city
    @country = country
    @customer = customer
    ensure_unique(@@registered_elements)
  end

  def hash
    prime = 31
    (prime + (@street === nil ? 0 : @street.hash)) *
        (prime + (@house_no === nil ? 0 : @house_no.hash)) *
        (prime + (@zip === nil ? 0 : @zip.hash)) *
        (prime + (@city === nil ? 0 : @city.hash)) *
        (prime + (@country === nil ? 0 : @country.hash))
  end

  public

  def eql?(other)
    unless other.is_a? AddressV3
      raise TypeError
    end
    (other.street === @street &&
        other.house_no === @house_no &&
        other.zip === @zip &&
        other.city === @city &&
        other.country === @country
    )
  end
end