require "rails_helper"

RSpec.feature "the admin can create new items", type: :feature do

    let(:dessert) { Category.create(name: "dessert") }

    let(:unicorn) { Item.create(title: "Unicorn on the Cob",
                                description: "A dish as enchanting and rare as the beast itself.",
                                price: 10.50,
                                status: "active",
                                categories: [dessert])}

    let(:arya) { User.create(full_name: "Arya of House Stark",
                             user_name: "Nymeria",
                             email: "arya@winterfell.com",
                             password: "password",
                             role: 1) }

  before(:each) do
    dessert
    unicorn
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(arya)
  end

  scenario "admin can create a new item" do
    visit edit_admin_item_path(unicorn)

    expect(unicorn.title).to eq("Unicorn on the Cob")

    fill_in("item_title", with: "babaganoush")
    fill_in("item_description", with: "eggplant mush with smokey hints")
    fill_in(:item_price, with: 9.95)

    click_button "Finished"

    expect(Item.count).to eq(1)
    expect(Item.first.title).to eq("babaganoush")
  end

  scenario "creating a new item redirects admin to item show" do
    visit edit_admin_item_path(unicorn)

    expect(unicorn.title).to eq("Unicorn on the Cob")

    fill_in("item_title", with: "babaganoush")
    fill_in("item_description", with: "eggplant mush with smokey hints")
    fill_in(:item_price, with: 9.95)

    click_button "Finished"

    expect(current_path).to eq(admin_item_path(unicorn))
    within(".row") do
      expect(page).to have_content("babaganoush")
    end
  end
end
