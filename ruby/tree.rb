class Tree
  attr_accessor :children, :node_name

  def initialize(treeHash)
    childArray = []
    treeHash.values[0].each { |key, value| childArray << Tree.new(Hash[key, value]) }
    @children = childArray
    @node_name = treeHash.keys[0]
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# New Format
ruby_tree = Tree.new({ 'grandpa' => { 'dad' => { 'child 1' => { "grandchild 1" => {} }, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } })
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

