class ComparisonBuilder
  def initialize(compare,order = :ascending)
    @compare = compare
  end
  
  def key(arg,*ordering)
    return self
  end
  
  def map(&block)
    return self
  end
  
  def then
    return @compare
  end
end