require 'test/unit'
require './Task1/partner'
require './Task1/Error/ambiguous_error'

class PartnerTest < Test::Unit::TestCase

  def test_create_succ
    partner = Partner.new('partner_name1', 'last_name1')
    assert_true(partner.is_a? Partner)
  end

  def test_create_err_double
    partner = Partner.new('partner_name2', 'last_name2')
    assert_true(partner.is_a? Partner)
    assert_raise(AmbiguousError) do
      Partner.new('partner_name2', 'last_name2')
    end
  end

  def test_create_err_fname_empty1
    assert_raise(ArgumentError) do
      Partner.new(nil, 'last_name1')
    end
  end

  def test_create_err_fname_empty2
    assert_raise(ArgumentError) do
      Partner.new('   ', 'last_name1')
    end
  end

  def test_create_err_fname_int
    assert_raise(ArgumentError) do
      Partner.new(1, 'last_name1')
    end
  end

  def test_create_err_lname_empty1
    assert_raise(ArgumentError) do
      Partner.new('partner_name3', nil)
    end
  end

  def test_create_err_lname_empty2
    assert_raise(ArgumentError) do
      Partner.new('partner_name4', '   ')
    end
  end

  def test_create_err_lname_int
    assert_raise(ArgumentError) do
      Partner.new('partner_name5', 1)
    end
  end
end