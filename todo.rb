class ToDoItem

  def initialize
    @mark_done = false
  end

  def title
    return @title
  end

  def title=(title)
    @title = title
  end

  def description
      return @description
  end

  def description=(description)
    @description = description
  end

  def print
    if @mark_done == true
    return "Title: " + @title.to_s + " " + "Description: " + @description.to_s + " Done"


    else
      return "Title: " + @title.to_s + " " + "Description: " + @description.to_s
    end
  end

  def mark_done
    @mark_done = true
  end

  def is_done?
    @mark_done
  end

end

##########################################

class ToDoList

  def initialize
      @items = []
    end

  def add_item(to_do_item)
    @items << to_do_item
  end

  def add_date(due_date)
    @items << due_date
  end

  def show_completed
    return @items.select{|e| e.is_done? }.map{|e| e.print}.join("/n")
  end

  def show_not_completed
    return @items.select{|e| e.is_done? == false}.map{|e| e.print}.join("/n")
  end

  def due_today
    return @items.select{|e| e.due_date == Date.today }.select{|e| !e.is_done?}.map{|e| e.print_date}.join("/n")
  end

end

#################################

class DueItem < ToDoItem

  def due_date
    return @due_date
  end

  def due_date=(date)
    @due_date = date
  end

  def print_date
    return "Title: " + @title.to_s + " " + "Description: " + @description.to_s + " Date: " + @due_date.to_s
  end


end
