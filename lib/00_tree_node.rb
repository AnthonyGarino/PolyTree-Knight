class PolyTreeNode
  attr_accessor :children, :value
  attr_reader :parent
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

  def add_child(child_node)
    child_node.parent = self
  end



end