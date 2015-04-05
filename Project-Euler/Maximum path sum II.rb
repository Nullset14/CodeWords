# https://projecteuler.net/problem=67

tree =  File.read('~/Desktop/p067_triangle.txt').split("\n").map {|row| row.split(' ').map(&:to_i)}

(tree.size - 2).downto(0).each {|index|
  tree[index].each_with_index {|element, _index|
    tree[index][_index] = element + tree[index + 1][_index, 2].max
  }
}

tree.first.first
