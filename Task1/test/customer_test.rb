require 'test/unit'
require './Task1/customer'
require './Task1/partner'
require 'date'
require './Task1/Error/ambiguous_error'

class CustomerTest < Test::Unit::TestCase
  def test_create_succ
    customer = Customer.new('first_name1', 'last_name1', Date.parse('31-12-2010'))
    assert_true(customer.is_a? Customer)
  end

  def test_create_err_double
    customer = Customer.new('first_name2', 'last_name2', Date.parse('31-12-2010'))
    assert_true(customer.is_a? Customer)
    assert_raise(AmbiguousError) do
      Customer.new('first_name2', 'last_name2', Date.parse('31-12-2010'))
    end
  end

  def test_create_err_fname_empty1
    assert_raise(ArgumentError) do
      Customer.new(nil, 'last_name1', Date.parse('31-12-2010'))
    end
  end

  def test_create_err_fname_empty2
    assert_raise(ArgumentError) do
      Customer.new('   ', 'last_name1', Date.parse('31-12-2010'))
    end
  end

  def test_create_err_fname_int
    assert_raise(ArgumentError) do
      Customer.new(1, 'last_name1', Date.parse('31-12-2010'))
    end
  end

  def test_create_err_lname_empty1
    assert_raise(ArgumentError) do
      Customer.new('first_name3', nil, Date.parse('31-12-2010'))
    end
  end

  def test_create_err_lname_empty2
    assert_raise(ArgumentError) do
      Customer.new('first_name4', '   ', Date.parse('31-12-2010'))
    end
  end

  def test_create_err_lname_int
    assert_raise(ArgumentError) do
      Customer.new('first_name5', 1, Date.parse('31-12-2010'))
    end
  end

  def test_create_err_date_empty
    assert_raise(ArgumentError) do
      Customer.new('first_name6', 'last_name1', nil)
    end
  end

  def test_create_err_date_int
    assert_raise(ArgumentError) do
      Customer.new('first_name7', 'last_name1', 'asedf')
    end
  end

  def test_create_succ_eql_part
    customer = Partner.new('first_name8', 'last_name2')
    assert_true(customer.is_a? Partner)
    assert_nothing_raised(AmbiguousError) do
      Customer.new('first_name8', 'last_name2', Date.parse('31-12-2010'))
    end
  end
end