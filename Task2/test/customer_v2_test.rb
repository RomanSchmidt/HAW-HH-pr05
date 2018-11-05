require 'test/unit'
require './Task2/customer_v2'
require './Task2/partner_v2'
require './Task2/address_v2'
require 'date'
require './Task2/Error/ambiguous_v2_error'

class CustomerV2Test < Test::Unit::TestCase
  def test_create_succ
    address = AddressV2.new('street_customer_test_1', 1, 'zip1', 'city1', 'country1')
    customer = CustomerV2.new('first_name1', 'last_name1', Date.parse('31-12-2010'), address)
    assert_true(customer.is_a? CustomerV2)
  end

  def test_create_err_double
    address = AddressV2.new('street_customer_test_2', 2, 'zip2', 'city2', 'country2')
    customer = CustomerV2.new('first_name2', 'last_name2', Date.parse('31-12-2010'), address)
    assert_true(customer.is_a? CustomerV2)
    assert_raise(AmbiguousV2Error) do
      CustomerV2.new('first_name2', 'last_name2', Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_fname_empty1
    address = AddressV2.new('street_customer_test_3', 3, 'zip3', 'city3', 'country3')
    assert_raise(ArgumentError) do
      CustomerV2.new(nil, 'last_name1', Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_fname_empty2
    address = AddressV2.new('street_customer_test_4', 4, 'zip4', 'city4', 'country4')
    assert_raise(ArgumentError) do
      CustomerV2.new('   ', 'last_name1', Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_fname_int
    address = AddressV2.new('street_customer_test_5', 5, 'zip5', 'city5', 'country5')
    assert_raise(ArgumentError) do
      CustomerV2.new(1, 'last_name1', Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_lname_empty1
    address = AddressV2.new('street_customer_test_6', 6, 'zip6', 'city6', 'country6')
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name3', nil, Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_lname_empty2
    address = AddressV2.new('street_customer_test_7', 7, 'zip7', 'city7', 'country7')
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name4', '   ', Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_lname_int
    address = AddressV2.new('street_customer_test_8', 8, 'zip8', 'city8', 'country8')
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name5', 1, Date.parse('31-12-2010'), address)
    end
  end

  def test_create_err_date_empty
    address = AddressV2.new('street_customer_test_9', 9, 'zip9', 'city9', 'country9')
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name6', 'last_name1', nil, address)
    end
  end

  def test_create_err_date_int
    address = AddressV2.new('street_customer_test_10', 10, 'zip10', 'city10', 'country10')
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name7', 'last_name1', 'asedf', address)
    end
  end

  def test_create_err_address_empty
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name6', 'last_name1', Date.parse('31-12-2010'), nil)
    end
  end

  def test_create_err_address_int
    assert_raise(ArgumentError) do
      CustomerV2.new('first_name8', 'last_name1', Date.parse('31-12-2010'), 'aa')
    end
  end

  def test_create_succ_address_ambi
    address = AddressV2.new('street_customer_test_11', 11, 'zip11', 'city11', 'country11')
    CustomerV2.new('first_name9', 'last_name1', Date.parse('31-12-2010'), address)
    CustomerV2.new('first_name10', 'last_name1', Date.parse('31-12-2010'), address)
  end

  def test_create_succ_eql_part
    address = AddressV2.new('street_customer_test_12', 12, 'zip12', 'city12', 'country12')
    customer = PartnerV2.new('first_name11', 'last_name2', address)
    assert_true(customer.is_a? PartnerV2)
    assert_nothing_raised(AmbiguousError) do
      CustomerV2.new('first_name11', 'last_name2', Date.parse('31-12-2010'), address)
    end
  end
end