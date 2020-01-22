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
  end
  
  alias :<< :add
  
  def size
  
  end
  
  def first
  
  end
  
  def last
  
  end
  
  def to_a
    # returns array of whole list
  end
  
  def done?
    # returns true if all todos in list are true
  end

  def item_at(index)
    # zero-indexed; raise IndexError if outside size
  end
  
  def mark_done_at(index)
    # marks done; raise IndexError if outside size
  end
  
  def mark_undone_at(index)
    # marks undone; raise IndexError if outside size;
  end
  
  def done!
    # mark all items done
  end
  
  def shift
    # remove and return first item
  end
  
  def pop
    # remove and return last item
  end
  
  def remove_at(index)
    # remove and return; raise IndexError if outside size
  end
  
  def to_s
    #"---- Today's Todos ----" ; each todo on new line
  end
end