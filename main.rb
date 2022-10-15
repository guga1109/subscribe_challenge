require_relative "product"
require_relative "order"

def getProductByInput(input)
	quantity = input[0, input.index(' ')]
	price = input[input.rindex(' ') + 1, input.length-1]
	product = input[input.index(' ') + 1, input.rindex(' ') - 1]
	product.slice! " at "

	p = Product.new(product, price, quantity)
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

	order.addNewProduct(getProductByInput(input))
end

showOrderReceipt(order)
