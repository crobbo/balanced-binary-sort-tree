require 'pry'

class Tree

  attr_accessor :root, :array

  def initialize(array)
    @root = build_tree(array)
    @array = array
  end

  def height(current_node=root, count=0, results=[])
    return nil if current_node.nil?
    return results.push(count) if current_node.left.nil? && current_node.right.nil?
    count += 1
    left_side = height(current_node.left, count, results)
    right_side = height(current_node.right, count,results)
    result = results
    result.max
  end

  def postorder(current_node=root, result = [])
    return nil if current_node.nil?
    preorder(current_node.left, result)
    preorder(current_node.right, result)
    result.push(current_node.data)
    result.max()
  end

  def inorder(current_node=root, result = [])
    return nil if current_node.nil?
    preorder(current_node.left, result)
    result.push(current_node.data)
    preorder(current_node.right, result)
    result
  end

  def preorder(current_node=root, result = [])
    return nil if current_node.nil?
    result.push(current_node.data)
    preorder(current_node.left, result)
    preorder(current_node.right, result)
    result
  end

  def level_order(current_node=root, output=[], result=[], count = 1, continue = true)
    output.push(current_node.left) if current_node.left
    output.push(current_node.right) if current_node.right
    first_node = output[0]    
    count += 1
    result.push(current_node.data)
    if output.empty?      
      continue = false
    end
    output.shift
    if continue
      continue = true
      level_order(first_node, output, result, count, continue)
    else
      result
    end
  end 

  def find(value, current_node = root)
    return current_node if current_node.nil? || value == current_node.data
    return find(value, current_node.left) if current_node.data > value
    return find(value, current_node.right) if current_node.data < value  
  end

  def delete(value, current_node = root)
    return nil if current_node.nil?   
    current_node.left = delete(value, current_node.left) if current_node.data > value
    current_node.right = delete(value, current_node.right) if current_node.data < value

    if current_node.data == value
      return current_node.right if current_node.left.nil?
      return current_node.left if current_node.right.nil?
      temp = find_minimum(current_node.right)
      current_node.right = delete(temp.data, current_node.right)
      current_node.data = temp.data
    end
    current_node
  end

  def find_minimum(current_node)
    return current_node if current_node.left.nil?
    find_minimum(current_node.left)
  end

  def insert(value, current_node = root)
    return Node.new(value) if current_node.nil?
    current_node.left = insert(value, current_node.left)  if current_node.data > value
    current_node.right = insert(value, current_node.right) if current_node.data <= value
    current_node
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
