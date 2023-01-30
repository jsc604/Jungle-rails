require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before do
      @category = Category.create(:name => "new category")
      @product = Product.new(:name => "test plant", :price_cents => 2000, :quantity => 10, :category_id => @category.id)
      @product.save!
    end

    it "saves successfully" do
      expect(@product.save).to be true
    end
  end
  
  describe "without a name" do
    before do
      @category = Category.create(:name => "new category")
      @product = Product.new(:name => nil, :price_cents => 2000, :quantity => 10, :category_id => @category.id)
    end
  
    it "has name error" do
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end
  
  describe "without a price" do
    before do
      @category = Category.create(:name => "new category")
      @product = Product.new(:name => "test plant", :price_cents => nil, :quantity => 10, :category_id => @category.id)
    end
  
    it "has price error" do
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price cents is not a number")
    end
  end
  
  describe "without a quantity" do
    before do
      @category = Category.create(:name => "new category")
      @product = Product.new(:name => "test plant", :price_cents => 2000, :quantity => nil, :category_id => @category.id)
    end
  
    it "has quantity error" do
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
  
  describe "without a category" do
    before do
      @product = Product.new(:name => "test plant", :price_cents => 2000, :quantity => 10, :category_id => nil)
    end
  
    it "has category error" do
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category must exist")
    end
  end
  
end
