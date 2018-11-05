require './Task3/Error/ambiguous_v3_error'

# Author: Roman Schmidt, Daniel Osterholz
module UniqueV3

  protected

  def ensure_unique(registered_elements)
    if registered_elements.include?(self)
      raise AmbiguousV3Error
    end
    registered_elements.add(self)
  end
end