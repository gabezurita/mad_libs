require 'byebug'

class MadLib < ApplicationRecord
  # this finds the parts of speech (fields) within the given text from the MadLib model
  def field_reg_ex
    /\{([^}]+)\}/
  end

  def find_fields
    text.scan(field_reg_ex)
  end

  def count_fields
    find_fields.each_with_object(Hash.new(0)) { |field, count| count[field] += 1 }
  end

  def has_field?(field)
    byebug
    field
  end
end
