require './Task2/Error/ambiguous_v2_error'

# Author: Roman Schmidt, Daniel Osterholz
module UniqueV2

  protected

  def ensure_unique(registered_elements)
    if registered_elements.include?(self)
      raise AmbiguousV2Error
    end
    registered_elements.add(self)
  end
end