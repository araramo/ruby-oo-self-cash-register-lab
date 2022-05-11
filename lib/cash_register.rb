class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        @total = self.total + (price*quantity)
        @items ||= []
        quantity.times do
            @items << title
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total = total - total * discount / 100
            return "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.total - @last_transaction
    end

end