require 'byebug'

class MadLib < ApplicationRecord
  has_many :solutions
  
  attr_reader :labeled_fields

  # this finds the parts of speech (fields) within the given text from the MadLib model
  def field_reg_ex
    /\{([^}]+)\}/
  end

  def find_fields
    text.scan(field_reg_ex).flatten
  end

  def count_fields
    find_fields.each_with_object(Hash.new(0)) { |field, count| count[field] += 1}
  end

  def label_fields
    @labeled_fields = []

    count_fields.each do |field, count|
      index = 0
      count.times do
        @labeled_fields << "#{field.capitalize} (#{index += 1}):"
      end
    end
    @labeled_fields
  end

  def has_field?(label)
    label_fields.include? label
  end
end
