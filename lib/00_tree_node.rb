class PolyTreeNode
  attr_accessor :parent, :children, :value
  def initialize(value, parent = nil)
    @children = []
    @parent = parent
    @value = value
  end

end