require_relative '../order'
require_relative '../product'
require_relative '../orderProduct'

describe Order do
	context 'given an order with a single product return correct total order value' do
		it 'returns 24.98' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('book', '12.49'), 2))
			expect(order.getTotalOrderValue).to eq(24.98)
		end

		it 'returns 16.49' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('music CD', '14.99'), 1))
			expect(order.getTotalOrderValue).to eq(16.49)
		end

		it 'returns 0.85' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('chocolate bar food', '0.85'), 1))
			expect(order.getTotalOrderValue).to eq(0.85)
		end

		it 'returns 10.50' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported box of chocolates food', '10.00'), 1))
			expect(order.getTotalOrderValue).to eq(10.50)
		end

		it 'returns 54.65' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '47.50'), 1))
			expect(order.getTotalOrderValue).to eq(54.65)
		end

		it 'returns 32.19' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '27.99'), 1))
			expect(order.getTotalOrderValue).to eq(32.19)
		end

		it 'returns 20.89' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('bottle of perfume', '18.99'), 1))
			expect(order.getTotalOrderValue).to eq(20.89)
		end

		it 'returns 9.75' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('packet of headache pills medical', '9.75'), 1))
			expect(order.getTotalOrderValue).to eq(9.75)
		end

		it 'returns 35.55' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported boxes of chocolates food', '11.25'), 3))
			expect(order.getTotalOrderValue).to eq(35.55)
		end
	end

	context 'given an order with more than one product return correct total order value' do
		it 'returns 42.32' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('book', '12.49'), 2))
			order.addNewProduct(OrderProduct.new(Product.new('music CD', '14.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('chocolate bar food', '0.85'), 1))

			expect(order.getTotalOrderValue).to eq(42.32)
		end

		it 'returns 65.15' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported box of chocolates food', '10.00'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '47.50'), 1))

			expect(order.getTotalOrderValue).to eq(65.15)
		end

		it 'returns 98.38' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '27.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('bottle of perfume', '18.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('packet of headache pills medical', '9.75'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('imported boxes of chocolates food', '11.25'), 3))

			expect(order.getTotalOrderValue).to eq(98.38)
		end
	end

	context 'given an order with more than one product return correct total order tax value' do
		it 'returns 1.50' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('book', '12.49'), 2))
			order.addNewProduct(OrderProduct.new(Product.new('music CD', '14.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('chocolate bar food', '0.85'), 1))

			expect(order.getTotalOrderTaxValue).to eq(1.50)
		end

		it 'returns 7.65' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported box of chocolates food', '10.00'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '47.50'), 1))

			expect(order.getTotalOrderTaxValue).to eq(7.65)
		end

		it 'returns 7.90' do
			order = Order.new
			order.addNewProduct(OrderProduct.new(Product.new('imported bottle of perfume', '27.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('bottle of perfume', '18.99'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('packet of headache pills medical', '9.75'), 1))
			order.addNewProduct(OrderProduct.new(Product.new('imported boxes of chocolates food', '11.25'), 3))

			expect(order.getTotalOrderTaxValue).to eq(7.90)
		end
	end
end