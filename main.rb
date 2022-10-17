require_relative "product"
require_relative "order"
require_relative "orderProduct"

def getOrderProductByInput(input)
	quantity = input[0, input.index(' ')]
	price = input[input.rindex(' ') + 1, input.length-1]
	productDescription = input[input.index(' ') + 1, input.rindex(' ') - 1]
	productDescription.slice! " at "

	product = Product.new(productDescription, price)
	orderProduct = OrderProduct.new(product, quantity.to_i)
end

def showOrderReceipt(order)
	order.getOrderDescription

	puts 'Sales Taxes: %.2f' % order.getTotalOrderTaxValue
	puts 'Total: %.2f' % order.getTotalOrderValue
end

order = Order.new

while true
	input = STDIN.gets.chomp

	if input == 'q'
		break
	end

	order.addNewProduct(getOrderProductByInput(input))
end

showOrderReceipt(order)
