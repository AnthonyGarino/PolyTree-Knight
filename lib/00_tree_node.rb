require 'byebug'
class PolyTreeNode
  attr_accessor :children
  attr_reader :parent ,  :value
  def initialize(value, parent = nil)
    @children = []
    @parent = parent
    @value = value
  end

  def parent=(node)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = node
    node.children << self unless node.nil?
  end

  def add_child(*child_node)
    child_node.each do |child|
      child.parent = self
    end
  end

  def remove_child(child)
    if child.parent == nil
      raise "oh shit that's not a kid, thats an orphan!"
    else
      child.parent=nil  
    end
  end

  def dfs(target=nil,&prc)
    raise "Need a proc or target" if [target, prc].none?
    prc ||= Proc.new{|node| node.value == target}
    return self if prc.call(self)
    self.children.each do |child|
      result = child.dfs(&prc)
      return result unless result.nil?
    end
   nil
  end
  def inspect
    @value.inspect
  end

  def bfs(node_value)
    queue = []
    queue << self
    until queue.length == 0
      ele = queue.shift
      if ele.value == node_value
        return ele
      end
      queue += ele.children
    end
    return nil
  end

end
  # def dfs(target = nil, &prc)
  #   raise "Need a proc or target" if [target, prc].none?
  #   prc ||= Proc.new { |node| node.value == target }

  #   return self if prc.call(self)

  #   children.each do |child|
  #     result = child.dfs(&prc)
  #     return result unless result.nil?
  #   end

  #   nil
  # end
# def dfs(target_value)
#     return self if self.value == target_value

#     children.each do |node|
#       value = node.dfs(target_value)
#       if value == target_value
#         return target_value
#       end
#     end

#     nil
#   end

