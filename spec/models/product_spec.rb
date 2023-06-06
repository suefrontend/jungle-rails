require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should save successfully with all four fields set' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 10.99,
        quantity: 5,
        category: Category.new(name: "Evergreens")
      )
      expect(product.save).to be true
    end

    it 'should check if name is empty' do
      product = Product.new(
        name: nil,
        price_cents: 10.99,
        quantity: 5,
        category: Category.new(name: "Evergreens")
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should check if price is empty' do 
      product = Product.new(
        name: 'Test Product',
        price_cents: nil,
        quantity: 5,
        category: Category.new(name: "Evergreens")
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should check if quantity is empty' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 10.99,
        quantity: nil,
        category: Category.new(name: "Evergreens")
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should check if category is empty' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 10.99,
        quantity: 5,
        category: nil
      )
      expect(product.save).to be false
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
