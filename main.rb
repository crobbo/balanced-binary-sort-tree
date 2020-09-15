# 1) Get the Middle of the array and make it root.
# 2) Recursively do same for left half and right half.
#       a) Get the middle of left half and make it left child of the root
#           created in step 1.
#       b) Get the middle of right half and make it right child of the
#           root created in step 1.

require_relative "node.rb"
require_relative "tree.rb"

tree = Tree.new(Array.new(20) { rand(1...999) })
tree = Tree.new([1,2,3, 5, 6,10,7,20,26,16, 12, 5,34,7,2,54,7,43])
puts "\n BALANCED BINARY SEARCH TREE: \n\n"
tree.pretty_print

puts "\n INSERTING A NEW NODE (278): \n\n"
tree.insert(278)
tree.pretty_print

puts "\n DELETING A NODE (3): \n\n"
tree.delete(3)
tree.pretty_print

puts "\n FIND A NODE: \n\n"
p tree.find(8)

puts "\n Level Order Traversal: \n"
p tree.level_order()

puts "\n Pre-Order Traversal: \n"
p tree.preorder

puts "\n In-Order Traversal: \n"
p tree.inorder

puts "\n Post-Order Traversal: \n"
p tree.postorder

puts "\n Find Node Height: \n"
p tree.height(tree.find(20))

puts "\n Find Node Depth: \n"
p tree.depth(tree.find(10))

puts "\n Is tree balanced?: \n"
p tree.balanced?

p tree.rebalance()

tree.pretty_print

p tree.balanced?

