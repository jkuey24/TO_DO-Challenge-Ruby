require 'rspec'
require 'date'
require_relative 'todo'

# Story: As a developer, I can create a ToDoItem.

describe 'ToDoItem' do

  it "can create a ToDoItem class" do
  expect{ToDoItem.new}.to_not raise_error

  end

# Story: As a developer, I can give a ToDoItem a title and retrieve it.
  it "can have a title" do
    item = ToDoItem.new
    expect{item.title}.to_not raise_error

    end

  it "can retrieve the title" do
    item = ToDoItem.new
    item.title=("NewTitle")
    expect(item.title).to eq "NewTitle"
  end

# Story: As a developer, I can give a ToDoItem a description and retrieve it.
  it "can have a description" do
    item = ToDoItem.new
    expect{item.description}.to_not raise_error
  end

  it "can retrieve the description" do
    item = ToDoItem.new
    item.description = "NewDescription"
    expect(item.description).to eq "NewDescription"

end

#Story: As a developer, I can print a ToDoItem with field labels and values.

  it "can print an item" do
      item = ToDoItem.new
      item.title = "myTitle"
      item.description = "myDescription"
      expect{item.print}.to_not raise_error
      expect(item.print).to be_a String
      expect(item.print).to eq "Title: myTitle Description: myDescription"
    end

# Story: As a developer, I can mark a ToDoItem done.
  it "can be marked done" do
    item = ToDoItem.new
    expect{item.mark_done}.to_not raise_error
  end

#Story: As a developer, when I print a ToDoItem is done status is shown.

  it "can print the completion of an item" do
    item = ToDoItem.new
    expect(item.print).to_not include("Done")
    item.mark_done
    expect(item.print).to include("Done")

  end

end #the final end
#############################################
#Story: As a developer, I can add all of my ToDoItems to a ToDoList.

describe ToDoList do
  it "Can create a new ToDoList" do
    expect{ToDoList.new}.to_not raise_error
  end

  it "can add ToDoItems" do
    list = ToDoList.new
    expect{list.add_item(ToDoItem.new)}.to_not raise_error
  end

#Story: As a developer with a ToDoList, I can show all the completed items.

  it "can show all the completed items" do
    list = ToDoList.new
    item1 = ToDoItem.new
    item1.mark_done
    item2 = ToDoItem.new
    list.add_item(item1)
    list.add_item(item2)
    item1.title="title1"
    item2.title="title2"
    item1.description = "description1"
    item2.description = "description2"


    expect(list.show_completed).to eq "Title: title1 Description: description1 Done"

    puts list.show_completed
  end

  # Story: As a developer with a ToDoList, I can show all the not completed items.

  it "can show all not completed items" do
    list = ToDoList.new
    item1 = ToDoItem.new
    item1.mark_done
    item2 = ToDoItem.new
    list.add_item(item1)
    list.add_item(item2)
    item1.title="title1"
    item2.title="title2"
    item1.description = "description1"
    item2.description = "description2"

    expect(list.show_not_completed).to eq "Title: title2 Description: description2"

    puts list.show_not_completed
  end


end #final end

# Story: As a developer, I can create a to do item with a due date, which can be changed.
# Hint: Use the Date class

describe DueItem do
  it "Can create a new item with a due date" do
    item = DueItem.new
    item.due_date= ("myDate")
    expect{item}.to_not raise_error
    expect(item.due_date).to eq "myDate"
  end

  it "can be changed" do
    item = DueItem.new
    item.due_date= ("March 2")
    expect(item.due_date).to eq "March 2"

  end

  # Story: As a developer, I can print an item with a due date with field labels and values.
  it "can print an item with a due date with labels and values" do
    item = DueItem.new
    item.title = "myTitle"
    item.description = "myDescription"
    item.due_date = "myDate"
    expect{item.print_date}.to_not raise_error
    expect(item.print_date).to be_a String
    expect(item.print_date).to eq "Title: myTitle Description: myDescription Date: myDate"
    end

    #Story: As a developer, I can add items with due dates to my ToDoList.
    # Hint: Consider keeping items with due dates separate from the other items.
    it "can add items with due dates to ToDoList" do
      list = ToDoList.new
      expect{list.add_date(DueItem.new)}.to_not raise_error
    end

    #Story: As a developer with a ToDoList, I can list all the not completed items that are due today.

    it "can list all the not completed items that are due today" do
      list = ToDoList.new

      item1 = DueItem.new
      list.add_date(item1)

      item2 = DueItem.new
      list.add_date(item2)

      item1.title="title1"
      item2.title="title2"
      item1.description = "description1"
      item2.description = "description2"

      item1.due_date="2016,4,1"
      item2.due_date= Date.today

      expect(list.due_today).to eq "Title: title2 Description: description2 Date: " + Date.today.to_s

      puts list.due_today


    end



end# the final end
