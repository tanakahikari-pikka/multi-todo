class List < ApplicationRecord
  belongs_to :category
  validates_presence_of :todo

  def self.multi_update(lists_params)
    lists_params.to_h.map do |id, list_param|
      list = self.find(id)
      list.update_attributes!(list_param)
    end
  end
end
