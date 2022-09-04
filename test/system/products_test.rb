require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
  #   visit products_url
    visit root_url
    # save_and_open_screenshot
    assert_selector "h1", text: "Awesome Products"
    # assert_selector ".card-product", count: Product.count
  end

  test "displays the correnct number of products" do
    visit root_url
    assert_selector ".card-product", count: Product.count
    # save_and_open_screenshot
  end

  test "lets a signed in user create a new product" do
    login_as users(:george) # Warden::TestHelpers
    visit "/products/new"
    # save_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_screenshot

    click_on "Create Product"
    # save_screenshot

    assert_text "Change your life: Learn to code"
    save_screenshot
  end

end
