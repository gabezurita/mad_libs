require 'byebug'

class Solution < ApplicationRecord
  belongs_to :mad_lib

  after_initialize do
    @fields = {}
  end

  def fill_field(labeled_field, value)
    @fields[labeled_field] = value
  end

  def resolve

  end
end
