require './Task1/unique'
require 'set'

# Author: Roman Schmidt, Daniel Osterholz
#
# Includes Unique model.
# Has a hash method to be comparable in hash.
# Has a eql? method which is defined as an synonym for == to make objects comparable.
class Partner
  include Unique
  alias_method :eql?, :==
  @@registered_elements = Set.new

  attr_reader(:first_name, :last_name)

  def initialize(first_name, last_name)
    raise ArgumentError unless first_name.is_a? String
    first_name.strip!
    raise ArgumentError if first_name.length === 0

    raise ArgumentError unless last_name.is_a? String
    last_name.strip!
    raise ArgumentError if last_name.length === 0

    @first_name = first_name
    @last_name = last_name
    ensure_unique(@@registered_elements)
  end

  def eql?(other)
    unless other.is_a? Partner
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