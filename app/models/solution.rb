class Solution < ApplicationRecord
  belongs_to :mad_lib

  after_initialize do
    @fields = {}
  end

  def fill_field(labeled_field, value)
    @fields[labeled_field] = value
  end

  def label_formatting_regexp
    / \([^()]*\):/
  end

  def resolve
    @paragraph = mad_lib.text
    @fields.each do |labeled_field, value|
      @paragraph.sub!(labeled_field.downcase.sub!(label_formatting_regexp, ''), value[:with].to_s)
    end
    @paragraph.delete('{}')
  end
end
