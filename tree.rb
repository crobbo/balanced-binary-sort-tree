require 'pry'

class Tree

  attr_accessor :root, :array

  def initialize(array)
    @root = build_tree(array)
    @array = array
  end

  def insert(value)

    right_node = false
    left_node = false

    new_root = @root

    until new_root.left.nil? || new_root.right.nil?

      if value > @root.data
        new_root = new_root.right
        right_node = true
        left_node = false
      else
        new_root = new_root.left
        right_node = false
        left_node = true
      end
    end

    if right_node
      new_root.right = Node.new(value)
    else
      new_root.left = Node.new(value)
    end
  end

  def build_tree(array)
    sorted_array = array.sort.uniq
    array_length = sorted_array.length
    first = sorted_array.index(sorted_array.first)
    last  = sorted_array.index(sorted_array.last)
   
    if array_length == 0
      nil
    elsif array_length == 1
      Node.new(sorted_array[0])
    else
      mid = array.length / 2
      left = build_tree(sorted_array[first..(mid-1)])
      right = build_tree(sorted_array[(mid+1)..last])
      @root = Node.new(sorted_array[mid],left,right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
