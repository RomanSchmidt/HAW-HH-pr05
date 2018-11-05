require './Task2/address_v2'

# Author: Roman Schmidt, Daniel Osterholz
module AddressableV2

  protected

  def initialize(address)
    raise ArgumentError unless address.is_a? AddressV2
    @address = address
  end

  def add_partner(partner)
    @address.add_partner(partner)
  end
end