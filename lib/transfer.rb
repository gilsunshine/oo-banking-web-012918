class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
      @sender.balance -= self.amount
      @receiver.balance += self.amount
    if @sender.valid? && @status == "pending"
      @status = "complete"
    else
      @status = "rejected"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      @status = "reversed"
    end
  end

end
