require 'test/unit'
require './Task1/Error/ambiguous_error'
require_relative '../../Task1/address'

class AddressTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_create_succ
    address = Address.new('street1', 1, 'zip1', 'city1', 'country1')
    assert_true(address.is_a? Address)
  end

  def test_create_err_double
    address = Address.new('street2', 2, 'zip2', 'city2', 'country2')
    assert_true(address.is_a? Address)
    assert_raise(AmbiguousError) do
      Address.new('street2', 2, 'zip2', 'city2', 'country2')
    end
  end

  def test_create_err_street_empty1
    assert_raise(ArgumentError) do
      Address.new(nil, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_empty2
    assert_raise(ArgumentError) do
      Address.new('    ', 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_street_int
    assert_raise(ArgumentError) do
      Address.new(1, 1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty1
    assert_raise(ArgumentError) do
      Address.new('street3', nil, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_empty2
    assert_raise(ArgumentError) do
      Address.new('street4', -1, 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_house_str
    assert_raise(ArgumentError) do
      Address.new('street5', '1', 'zip1', 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty1
    assert_raise(ArgumentError) do
      Address.new('street6', 1, nil, 'city1', 'country1')
    end
  end

  def test_create_err_zip_empty2
    assert_raise(ArgumentError) do
      Address.new('street7', 1, '   ', 'city1', 'country1')
    end
  end

  def test_create_err_zip_int
    assert_raise(ArgumentError) do
      Address.new('street8', 1, 1, 'city1', 'country1')
    end
  end

  def test_create_err_city_empty1
    assert_raise(ArgumentError) do
      Address.new('street9', 1, 'zip1', nil, 'country1')
    end
  end

  def test_create_err_city_empty2
    assert_raise(ArgumentError) do
      Address.new('street10', 1, 'zip1', '   ', 'country1')
    end
  end


  def test_create_err_city_int
    assert_raise(ArgumentError) do
      Address.new('street11', 1, 'zip1', 1, 'country1')
    end
  end

  def test_create_err_country_empty1
    assert_raise(ArgumentError) do
      Address.new('street12', 1, 'zip1', 'city1', nil)
    end
  end

  def test_create_err_country_empty2
    assert_raise(ArgumentError) do
      Address.new('street13', 1, 'zip1', 'city1', '      ')
    end
  end

  def test_create_err_country_int
    assert_raise(ArgumentError) do
      Address.new('street14', 1, 'zip1', 'city1', 1)
    end
  end
end