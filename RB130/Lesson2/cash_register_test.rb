require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction1 = Transaction.new(10)
    @transaction2 = Transaction.new(0)
    @transaction3 = Transaction.new(30)
    @transaction4 = Transaction.new(40)
  end
  
  def test_accept_money
    cash_register = CashRegister.new(100)
    @transaction1.amount_paid = 10
    
    cash_register.accept_money(@transaction1)
    assert_equal(110, cash_register.total_money)
  end
  
  def test_change
    cash_register = CashRegister.new(1000)
    @transaction1.amount_paid = 100
    cash_register.change(@transaction1)
    cash_register.accept_money(@transaction1)
    
    assert_equal(90, cash_register.change(@transaction1))
    assert_equal(1100, cash_register.total_money) 
  end
  
  def test_give_receipt
    cash_register = CashRegister.new(100)

    assert_output( "You've paid $30.\n" ) do
      cash_register.give_receipt(@transaction3)
    end
  end

  def test_prompt_for_payment_sets_amount_paid
    input = StringIO.new('40\n')
    output = StringIO.new
    @transaction4.prompt_for_payment(input: input, output: output)
    assert_equal(40, @transaction4.amount_paid)
  end
end