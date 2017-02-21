require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com" )
    @recipe = @chef.recipes.build(name: "Chicken Parm", summary: "Nice saucy and spicy dish.",
              description: "Saute the chicken right and season it well then add you prepared sauce.")
  end
  
  test "chef_id should be pestent" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "recipe should be valid?" do
    assert @recipe.valid?
  end
  
  test "recipe name could be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name should not be too long" do
    @recipe.name = "bitchy" * 20
    assert_not @recipe.valid?
  end
  
  test "name should not be too short" do
    @recipe.name = "isht"
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary lenght should not be too short" do
    @recipe.summary = "assh"
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = "c" * 501
    assert_not @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description = "crum"
    assert_not @recipe.valid?
  end
  
end