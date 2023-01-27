class Tree
  attr_accessor :children, :node_name

  # Children from first parent
  # {"dad"=>{"child 1"=>{}, "child 2"=>{}}, "uncle"=>{"child 3"=>{}, "child 4"=>{}}}
  # I need to make an array out of the hash keys and turn them into individual Trees

  def initialize(treeHash)
    @children = [treeHash[treeHash.keys[0]].each { |key, value| Tree.new(Hash[key, value]) }]
    #@children = treeHash.keys.each {|key| Tree.new({"#{key}" => treeHash[key]})}
    @node_name = treeHash.keys[0]
    puts children
  end

  def visit_all(&block)
    visit &block
    puts children[0].class
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

# Old Format
#ruby_tree = Tree.new( "Ruby", [ Tree.new( "Reia" ), Tree.new( "MacRuby" ) ] )
# New Format
ruby_tree = Tree.new({ 'grandpa' => { 'dad' => { 'child 1' => {}, 'child 2' => {} }, 'uncle' => { 'child 3' => {}, 'child 4' => {} } } })
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

