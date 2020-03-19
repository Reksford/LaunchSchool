require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end
  
  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
    assert_equal(@todo2, @list.first)
  end
  
  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
    assert_equal(@todo2, @list.last)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
    @todo1.done!
    assert_equal(false, @list.done?)
    @todos.each(&:done!)
    assert_equal(true, @list.done?)
  end
  
  def test_type_error
    assert_raises(TypeError) {@list.add('Not a todo')}
  end
  
  def test_shovel
    @todo4 = Todo.new("New Todo")
    @list << @todo4
    @todos << @todo4
    assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)
  end
  
  def test_add
    @todo4 = Todo.new("New Todo")
    @list.add(@todo4)
    @todos << @todo4
    assert_equal(4, @list.size)
    assert_equal(@todos, @list.to_a)  
  end

  def test_item_at
    assert_equal(@todos[2], @list.item_at(2))
    assert_raises(IndexError) {@list.item_at(5)}
  end
  
  def test_mark_done_at
    @list.mark_done_at(1)
    assert(@todo2.done?)
    assert_raises(IndexError) {@list.mark_done_at(5)}
  end
  
  def test_mark_undone_at
    @todos.each(&:done!)
    @list.mark_undone_at(0)
    refute(@todo1.done?)
    assert_raises(IndexError) {@list.mark_undone_at(5)}
  end
  
  def test_done!
    @list.done!
    assert_equal(@todos, @todos.select(&:done?))
  end
  
  def test_remove_at
    assert_same(@todo1, @list.remove_at(0))
    assert_equal(2, @list.size)
    assert_raises(IndexError) {@list.remove_at(5)}
  end
  
  def test_to_s_none_finished
    output = <<-OUTPUT.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_some_finished
    @todo1.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_finished
    @list.done!
    output = <<~OUTPUT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end
  
  def test_each
    counting = 0
    @list.each {counting += 1}
    assert_equal(3, counting)
    
    @list.each {|todo| todo.done!}
    assert(@list.done?)

    assert_same(@list, @list.each)    
  end
  
  def test_select
    assert_equal(@list.to_a, @list.select {|todo| !todo.done? }.to_a)
    refute_same(@list.select {|todo| !todo.done? }, @list)
  end
  
  
end