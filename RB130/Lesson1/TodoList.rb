# ===COPIED FROM ASSIGNMENT===
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end
# ===========================

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    #Should only take a todo object.
    if todo.class != Todo
      raise TypeError, "Can only add Todo objects"
    end
    todos << todo
  end
  
  alias :<< :add
  
  def size
    todos.size
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end
  
  def to_a
    # returns array of whole list
    todos.clone
  end
  
  def done?
    # returns true if all todos in list are true
    todos.all? {|todo| todo.done? }
  end

  def item_at(index)
    size_enforcement(index)
    todos[index]
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def done!
    # mark all items done
    todos.each {|todo| todo.done! }
  end
  
  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end
  
  def remove_at(index)
    # remove and return
    size_enforcement(index)
    todos.slice!(index)
  end
  
  def each
    index = 0
    
    while index < self.size
      yield(item_at(index))
      index += 1
    end
    self
  end
  
  def select
    result = TodoList.new(title)
    self.each do |item|
      if yield(item)
        result << item
      end
    end
    result
  end
  
  def find_by_title(search)
    #Return first todo obj that matches or nil
    each do |todo|
      return todo if todo.title == search
    end
    nil
  end
  
  def all_done
    #new TodoList with only done items
    select do |todo|
      todo.done?
    end
  end
  
  def all_not_done
    #new TodoList with only undone items
    select do |todo|
      !todo.done?
    end
  end
  
  def mark_done(search)
    each do |todo|
      if todo.title == search
        todo.done!
        break
      end
    end
  end
  
  def mark_all_done
    done!
  end
  
  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
  
  private
  
  attr_reader :todos
  
  def size_enforcement(index)
    # raise IndexError if outside size of todos list
    if index >= self.size || index < -(self.size)
      raise IndexError
    end
  end

  def to_s
    str = "---- Today's Todos ----\n"
    todos.each {|todo| str << "#{todo.to_s}\n" }
    str
  end
end
