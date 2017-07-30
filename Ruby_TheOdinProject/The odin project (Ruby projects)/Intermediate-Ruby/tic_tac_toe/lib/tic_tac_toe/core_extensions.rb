class Array
  def all_empty?
    self.all? {|e| e.to_s.empty?}
  end
  def all_same?
    self.all? { |element| element == self[0] }
  end
  def any_empty?
    return true if self.size == 0
    self.any? { |element| element.to_s.empty? }
  end
  def none_empty?
    !any_empty?
  end
end
