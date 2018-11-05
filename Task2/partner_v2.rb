require './Task2/unique_v2'
require 'set'

# Author: Roman Schmidt, Daniel Osterholz
class PartnerV2
  include UniqueV2
  alias_method :eql?, :==
  @@registered_elements = Set.new

  attr_reader(:first_name, :last_name)

  def initialize(first_name, last_name, address)
    raise ArgumentError unless first_name.is_a? String
    first_name.strip!
    raise ArgumentError if first_name.length === 0

    raise ArgumentError unless last_name.is_a? String
    last_name.strip!
    raise ArgumentError if last_name.length === 0
    raise ArgumentError unless address.is_a? AddressV2

    @first_name = first_name
    @last_name = last_name

    ensure_unique(@@registered_elements)
    @address = address
    @address.add_partner(self)
  end

  public

  def eql?(other)
    unless other.is_a? PartnerV2
      raise TypeError
    end
    other.first_name === @first_name && other.last_name === @last_name
  end

  def hash
    prime = 31
    (prime + (@first_name === nil ? 0 : @first_name.hash)) *
        (prime + (@last_name === nil ? 0 : @last_name.hash))
  end
end