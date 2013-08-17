class Compare
  def self.by_descending
    return Compare.new.by_descending()
  end
  
  def self.by
    return Compare.new.by()
  end
  
  def initialize()
    @comparison_list = []
  end
  
  def by
    return ComparisonBuilder.new(self)
  end
  
  def by_descending
    return ComparisonBuilder.new(self,:descending)
  end
  
  
  def then
    return self
  end
  
  def add_comparison(comparison)
    @comparison_list << comparison
    self
  end
  
  def compare(item_one,item_two)
    @comparison_list.each do |c_proc|
      c = c_proc.call(item_one,item_two)
      return c unless c == 0
    end
    return 0
  end
end