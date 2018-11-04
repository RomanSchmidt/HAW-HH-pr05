require './Task1/Error/ambiguous_error'

# Author: Roman Schmidt, Daniel Osterholz
module Unique

  protected

  def ensure_unique(registered_elements)
    if registered_elements.include?(self)
      raise AmbiguousError
    end
    registered_elements.add(self)
  end
end