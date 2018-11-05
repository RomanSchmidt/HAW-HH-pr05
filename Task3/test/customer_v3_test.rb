require 'test/unit'
require './Task3/customer_v3'
require './Task3/partner_v3'
require 'date'
require './Task3/Error/ambiguous_v3_error'

class CustomerV3Test < Test::Unit::TestCase
  def test_create_succ
    customer = CustomerV3.new('first_name1', 'last_name1', Date.parse('31-12-2010'), 'street_v3_cust_1', 1, 'zip', 'city', 'country')
    assert_true(customer.is_a? CustomerV3)
  end

  def test_create_err_double
    customer = CustomerV3.new('first_name2', 'last_name2', Date.parse('31-12-2010'), 'street_v3_cust_2', 1, 'zip', 'city', 'country')
    assert_true(customer.is_a? CustomerV3)
    assert_raise(AmbiguousV3Error) do
      CustomerV3.new('first_name2', 'last_name2', Date.parse('31-12-2010'), 'street_v3_cust_3', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_fname_empty1
    assert_raise(ArgumentError) do
      CustomerV3.new(nil, 'last_name1', Date.parse('31-12-2010'), 'street_v3_cust_4', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_fname_empty2
    assert_raise(ArgumentError) do
      CustomerV3.new('   ', 'last_name1', Date.parse('31-12-2010'), 'street_v3_cust_5', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_fname_int
    assert_raise(ArgumentError) do
      CustomerV3.new(1, 'last_name1', Date.parse('31-12-2010'), 'street_v3_cust_6', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_lname_empty1
    assert_raise(ArgumentError) do
      CustomerV3.new('first_name3', nil, Date.parse('31-12-2010'), 'street_v3_cust_7', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_lname_empty2
    assert_raise(ArgumentError) do
      CustomerV3.new('first_name4', '   ', Date.parse('31-12-2010'), 'street_v3_cust_8', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_lname_int
    assert_raise(ArgumentError) do
      CustomerV3.new('first_name5', 1, Date.parse('31-12-2010'), 'street_v3_cust_9', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_date_empty
    assert_raise(ArgumentError) do
      CustomerV3.new('first_name6', 'last_name1', nil, 'street_v3_cust_10', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_err_date_int
    assert_raise(ArgumentError) do
      CustomerV3.new('first_name7', 'last_name1', 'asedf', 'street_v3_cust_11', 1, 'zip', 'city', 'country')
    end
  end

  def test_create_succ_eql_part
    customer = PartnerV3.new('first_name8', 'last_name2')
    assert_true(customer.is_a? PartnerV3)
    assert_nothing_raised(AmbiguousV3Error) do
      CustomerV3.new('first_name8', 'last_name2', Date.parse('31-12-2010'), 'street_v3_cust_12', 1, 'zip', 'city', 'country')
    end
  end
end