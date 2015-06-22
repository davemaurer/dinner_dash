require "rails_helper"

RSpec.feature "the admin can retire an item" do
  
    let(:category)  {Category.create(name: "Category")}
  
    let(:admin)  {User.create(full_name: "Admin",
                     email: "admin@admin.com",
                     password: "password",
                     role: 1)}
    let(:user)   {User.create(full_name: "User",
                     email: "user@user.com",
                     password: "password",
                     role: 0)}
    
    let(:active)   {Item.create(title: "Active Item",
                       description: "I'm active!",
                       price: 9.99,
                       categories: [category])}
    let(:retired)  {Item.create(title: "Retired Item",
                       description: "I'm retired!",
                       price: 8.99,
                       categories: [category],
                       status: "retired")}
    
    before(:each) do
      category
      admin
      user
    end
  
  scenario "and its status changes to 'retired'" do
    active
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    
    visit admin_items_path
    
    expect(page).to have_content "Active Item"
    
    first(:button, "Edit Item").click
    
    expect(current_path).to eq(edit_admin_item_path(active))
    expect(page).to have_content("Status")

    select "retired", :from => "item[status]"
    click_button "Finished"
    
    expect(page).to have_content("This item has been retired")
  end
    
  scenario "and it remains on the admin user items index view" do
    active
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_items_path

    expect(page).to have_content "Active Item"

    first(:button, "Edit Item").click

    expect(current_path).to eq(edit_admin_item_path(active))
    expect(page).to have_content("Status")

    select "retired", :from => "item[status]"
    click_button "Finished"
    
    expect(current_path).to eq(admin_item_path(active))
    
    visit admin_items_path
    
    expect(page).to have_content("Active Item")
  end
  
  scenario "and it disappears from the user items index view" do
    active
    retired
    
    visit items_path
    
    expect(page).to have_content("Active Item")
    expect(page).not_to have_content("Retired Item")
  end
end
