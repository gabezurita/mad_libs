class Solution < ApplicationRecord
  belongs_to :mad_lib

  def fields
    return @fields unless @fields.nil?
    @fields = {}
    init_fields_from_values
    @fields
  end

  def label_formatting_regexp
    / \([^()]*\):/
  end

  def set_values_from_params(solution_params)
    self.values = solution_params.to_json
  end

  def values_as_hash
    return {} if values.nil?
    JSON.parse(values)
  end

  def init_fields_from_values
    values_as_hash.each do |label, value|
      fill_field(label, :with => value)
    end
  end

  def fill_field(labeled_field, value)
    fields[labeled_field] = value
  end

  def resolve
    @paragraph = mad_lib.text
    fields.each do |labeled_field, value|
      @paragraph.sub!(labeled_field.downcase.sub!(label_formatting_regexp, ''), value[:with].to_s)
    end
    @paragraph.delete('{}')
  end

  def self.format_value(value)
    value[:with].to_s.downcase
  end

  def self.count_report_fields
    self.all.reduce(Hash.new(0)) do |hash, solution|
      solution.fields.each do |field, value|
        formatted_value = format_value(value)
        hash[formatted_value] += 1
      end
      # hash is accumulator
      hash
    end
  end
end
