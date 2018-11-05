require 'test/unit'
require './Task3/Error/ambiguous_v3_error'
require './Task3/address_v3'

class AddressV3Test < Test::Unit::TestCase

  def test_create_succ
    customer = CustomerV3.new('first_add_v3_name_1', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_1', 1, 'zip1', 'city1', 'country1')
    address = AddressV3.new(customer, 'street_add_v3_1', 2, 'zip1', 'city1', 'country1')
    assert_true(address.is_a? AddressV3)

    assert_raise(AmbiguousV3Error) do
      AddressV3.new(customer, 'street_add_v3_1', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_double
    customer = CustomerV3.new('first_add_v3_name_2', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_2', 1, 'zip1', 'city1', 'country1')
    address = AddressV3.new(customer, 'street_add_v3_2', 2, 'zip1', 'city1', 'country1')
    assert_true(address.is_a? AddressV3)
    assert_raise(AmbiguousV3Error) do
      AddressV3.new(customer, 'street_add_v3_2', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_empty1
    customer = CustomerV3.new('first_add_v3_name_3', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_3', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer, nil, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_empty2
    customer = CustomerV3.new('first_add_v3_name_4', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_4', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'    ', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_int
    customer = CustomerV3.new('first_add_v3_name_5', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_5', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer, 1, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty1
    customer = CustomerV3.new('first_add_v3_name_6', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_6', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street3', nil, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty2
    customer = CustomerV3.new('first_add_v3_name_7', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_7', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street4', -1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_str
    customer = CustomerV3.new('first_add_v3_name_8', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_8', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street5', '1', 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty1
    customer = CustomerV3.new('first_add_v3_name_9', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_9', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street6', 1, nil, 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty2
    customer = CustomerV3.new('first_add_v3_name_10', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_10', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street7', 1, '   ', 'city1', 'country1')
    end
  end

  def test_create_err_zip_int
    customer = CustomerV3.new('first_add_v3_name_11', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_11', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street8', 1, 1, 'city1', 'country1')
    end
  end

  def test_create_err_city_empty1
    customer = CustomerV3.new('first_add_v3_name_12', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_12', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street9', 1, 'zip1', nil, 'country1')
    end
  end

  def test_create_err_city_empty2
    customer = CustomerV3.new('first_add_v3_name_13', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_13', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street10', 1, 'zip1', '   ', 'country1')
    end
  end


  def test_create_err_city_int
    customer = CustomerV3.new('first_add_v3_name_14', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_14', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street11', 1, 'zip1', 1, 'country1')
    end
  end

  def test_create_err_country_empty1
    customer = CustomerV3.new('first_add_v3_name_15', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_15', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street12', 1, 'zip1', 'city1', nil)
    end
  end

  def test_create_err_country_empty2
    customer = CustomerV3.new('first_add_v3_name_16', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_16', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street13', 1, 'zip1', 'city1', '      ')
    end
  end

  def test_create_err_country_int
    customer = CustomerV3.new('first_add_v3_name_17', 'last_name', Date.parse('31-12-2010'), 'street_add_v3_17', 1, 'zip1', 'city1', 'country1')
    assert_raise(ArgumentError) do
      AddressV3.new(customer,'street14', 1, 'zip1', 'city1', 1)
    end
  end
end