class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    available_items = []
    Item.all.each do |item|
      if item.inventory > 0
        available_items << item
      end
    end
    available_items
  end

end
