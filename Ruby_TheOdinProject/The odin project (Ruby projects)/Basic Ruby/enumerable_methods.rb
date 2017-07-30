module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    i = 0
    while i < self.size
      yield(self[i] , i)
      i+=1
    end
  end

  def my_select
    return self unless block_given?
    tmp = self
    output = tmp.clear
    self.my_each {|e|output << e if yield(e)}
    output
  end

  def my_all?
    return true unless block_given?
    self.my_each {|e| return false unless yield(e)}
    true
  end

  def my_any?
    return true unless block_given?
    self.my_each {|e| return true if yield(e) }
    true
  end

  def my_none?
    return false unless block_given?
    self.my_each {|e| return false if yield(e) }
    true
  end

  def my_count
    return self.size unless block_given?
    count = 0
    self.my_each {|e| count+= 1 if yield(e)}
    count
  end
  def my_map(block)
        output=[]
        if block
            self.my_each {|i| output << block.call(i)}
            return output
        else
            return self
        end
    end

    def my_inject(num=0)
        accum = num
        self.my_each {|i| accum=yield(accum,i)}
        accum
    end

end

def multiply_els(arr)
        arr.my_inject(1) {|r,e| r*e}
end
end
