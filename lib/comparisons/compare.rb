class Compare
  def self.by_descending
    return Compare.new.by_descending()
  end
  
  def self.by
    return Compare.new.by()
  end
  
  def by
    return ComparisonBuilder.new(self)
  end
  
  def by_descending
    return ComparisonBuilder.new(self,:descending)
  end
end