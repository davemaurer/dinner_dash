class Cart
  attr_reader :contents
  
  def initialize(contents)
    @contents = contents || {}
  end
  
  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end
  
  def remove_item(item_id)
    contents[item_id.to_s] -= 1
    contents.delete(item_id.to_s) if contents[item_id.to_s] == 0
  end
  
  def item_quantities
    contents.inject({}) do |memo, (item_id, qty)| 
      memo[Item.find(item_id)] = qty
      memo
    end
  end
  
  def count_all
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end
  
  def reset
    contents.clear
  end
end
