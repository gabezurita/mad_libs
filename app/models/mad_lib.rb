class MadLib < ApplicationRecord
  has_many :solutions

  # this finds the parts of speech (fields) within the given text from the MadLib model
  def field_regexp
    /\{([^}]+)\}/
  end

  def find_fields
    text.scan(field_regexp).flatten
  end

  def count_fields
    find_fields.each_with_object(Hash.new(0)) do |field, count|
      count[field] += 1
    end
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

  def self.format_field(field)
    field.split(',', 2).first.pluralize.capitalize
  end

  def self.count_report_fields
    self.all.reduce(Hash.new(0)) do |hash, mad_lib|
      mad_lib.find_fields.each do |field|
        formatted_field = format_field(field)
        hash[formatted_field] += 1
      end
      # hash is accumulator
      hash
    end
  end
end
