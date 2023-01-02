require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'returns saved product with all four fields present' do
      @category = Category.new({name: 'ron'}) 
      @product = Product.new({name: 'ron', category: @category, quantity: 6, price: 33})
      @product.save!

      expect(@product.name).to be_present
      expect(@product.category).to be_present
      expect(@product.quantity).to be_present
      expect(@product.price).to be_present
    end

    it 'returns an error message when name is nil' do
      @category = Category.new({name: 'ron'}) 
      @product = Product.new({name: nil, category: @category, quantity: 6, price: 33})
      @product.save

      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it 'returns an error message when category is nil' do
      @product = Product.new({name: 'ron', category: nil, quantity: 6, price: 33})
      @product.save

      expect(@product.errors.full_messages[0]).to eql("Category must exist")
    end

    it 'returns an error message when quantity is nil' do
      @category = Category.new({name: 'ron'}) 
      @product = Product.new({name: 'ron', category: @category, quantity: nil, price: 33})
      @product.save

      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end

    it 'returns an error message when price is nil' do
      @category = Category.new({name: 'ron'}) 
      @product = Product.new({name: 'ron', category: @category, quantity: 6, price: nil})
      @product.save
      
      expect(@product.errors.full_messages[0]).to eql("Price must be greater than 0")
    end

  end
end
