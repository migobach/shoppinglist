# ------------ Menu ----------------
# menu
# add an item to the shopping list
# print the list
# delete an item from the list
# edit an item from the list
# Exit

@shop_list = [
  {name: "rice", price: 5.87},
  {name: "oatmeal", price: 2.30},
  {name: "chicken", price: 8.00},
  {name: "green pepper", price: 9.00},
  {name: "banana", price: 8.75}
]

def instructions
  puts "*" * 60
  puts "Let's go shpping! What would you like to do?"
  puts "\t1) Add an item to the shopping list"
  puts "\t2) Print the shopping list"
  puts "\t3) Delete an item from the shopping list"
  puts "\t4) Edit an item from the shopping list"
  puts "\t5) Exit"
  puts "*" * 60
  menu
end

def add_item
  puts "What would you like to add?"
  puts "Enter the item, and the price:"
  to_list = gets.strip
  arr = to_list.split
  first_item = arr[0]
  price = arr[1]
  result = "#{first_item}, $#{price}"
  @shop_list << {name: first_item, price: price}
  instructions
end

def print_list
  puts "Here is your shopping list:"
  @shop_list.each_with_index do |item, value|
    list_index = value + 1
    puts "\t#{list_index}) #{item[:name]}, $#{item[:price]}"
  end
  instructions
end

def delete_item
  puts "Which item would you like to delete?"
  @shop_list.each_with_index do |item, value|
    list_index = value + 1
    puts "\t#{list_index}) #{item[:name]}, $#{item[:price]}"
  end
  delete_item = gets.strip.to_i - 1
  puts "Are you sure you would like to delete? this item? [Y/N]"
  puts @shop_list[delete_item]
  answer = gets.strip
    if answer == "Y" || answer == "y"
      @shop_list.delete_at(delete_item)
      puts "Your item has been deleted"
    else
      delete_item
    end
  instructions
end

def edit_item_boolean
  puts "Would you like to edit an item? [Y/N]"
  answer = gets. strip
  if answer == "Y" || answer == "y"
    edit_item
  else
    instructions
  end
end

def edit_item
  puts "Which item would you like to edit?"
  @shop_list.each_with_index do |item, value|
    list_index = value + 1
    puts "\t#{list_index}) #{item[:name]}, $#{item[:price]}"
  end
  edit_select = gets.strip.to_i - 1
  @shop_list.delete_at[edit_select]
  puts "Enter the new item:"
  item_new = gets.strip
  puts "Enter the new price:"
  price_new = gets.strip.to_f
  result = "#{item_new}, $#{price_new}"
  @shop_list[edit_select] == {name: item_new, price: price_new}
  instructions
end


# puts `clear` to clear the terminal


 def menu
   selection = gets.strip.to_i
  case selection
    when 1
      add_item
    when 2
      print_list
    when 3
      delete_item
    when 4
      edit_item_boolean
    when 5
      puts "Goodbye"
      exit
    else
      puts "Invalid, try again."
  end
end

instructions
