class ComparisonBuilder
  def initialize(compare,order = :ascending)
    @compare = compare
    @order = 1
    @order = -1 if order == :descending
  end
  
  def key(field_name, *ordering_list)
    if ordering_list.count == 0
      bare_key(field_name)
    else
      @ordering_list = ordering_list
      create_comparison(lambda {|a|  index_in_ordering(a.send(field_name))})
    end
  end
  
  def map(&block)
    create_comparison(lambda {|a| block.call(a)})
  end
  
  def bare_key(field_name)
    create_comparison(lambda {|a| a.send(field_name)})
  end
  
  def create_comparison(proc)
    @compare.add_comparison(lambda {|a,b| (proc.call(a) <=> proc.call(b)) * @order})
  end
  
  def index_in_ordering(item)
    ind = 0
    @ordering_list.each do |l| 
      return ind if l == item
      ind += 1
    end
    return nil
  end
end