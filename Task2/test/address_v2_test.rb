require 'test/unit'
require './Task2/Error/ambiguous_v2_error'
require './Task2/address_v2'

class AddressV2Test < Test::Unit::TestCase

  def test_create_succ
    address = AddressV2.new('street1', 1, 'zip1', 'city1', 'country1')
    assert_true(address.is_a? AddressV2)
  end

  def test_create_err_double
    address = AddressV2.new('street2', 2, 'zip2', 'city2', 'country2')
    assert_true(address.is_a? AddressV2)
    assert_raise(AmbiguousError) do
      AddressV2.new('street2', 2, 'zip2', 'city2', 'country2')
    end
  end

  def test_create_err_street_empty1
    assert_raise(ArgumentError) do
      AddressV2.new(nil, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('    ', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_int
    assert_raise(ArgumentError) do
      AddressV2.new(1, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street3', nil, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street4', -1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_str
    assert_raise(ArgumentError) do
      AddressV2.new('street5', '1', 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street6', 1, nil, 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street7', 1, '   ', 'city1', 'country1')
    end
  end

  def test_create_err_zip_int
    assert_raise(ArgumentError) do
      AddressV2.new('street8', 1, 1, 'city1', 'country1')
    end
  end

  def test_create_err_city_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street9', 1, 'zip1', nil, 'country1')
    end
  end

  def test_create_err_city_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street10', 1, 'zip1', '   ', 'country1')
    end
  end


  def test_create_err_city_int
    assert_raise(ArgumentError) do
      AddressV2.new('street11', 1, 'zip1', 1, 'country1')
    end
  end

  def test_create_err_country_empty1
    assert_raise(ArgumentError) do
      AddressV2.new('street12', 1, 'zip1', 'city1', nil)
    end
  end

  def test_create_err_country_empty2
    assert_raise(ArgumentError) do
      AddressV2.new('street13', 1, 'zip1', 'city1', '      ')
    end
  end

  def test_create_err_country_int
    assert_raise(ArgumentError) do
      AddressV2.new('street14', 1, 'zip1', 'city1', 1)
    end
  end
end