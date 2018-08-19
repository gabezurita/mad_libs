require 'byebug'

class MadLib < ApplicationRecord
  attr_reader :formatted_fields

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

  def format_fields
    @formatted_fields = []
    count_fields.each {|field, count| @formatted_fields << "#{field.first.capitalize} (#{count}):"}
  end

  def has_field?(field)
    byebug
    format_fields
    @formatted_fields.include? field
  end
end
