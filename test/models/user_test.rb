require 'test_helper'

class UserTest < ActiveSupport::TestCase
#crée un user fictif pour exercer les tests sur lui
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
#verifie si le champs email est non-nil
  test "should be valid" do
    if assert @user.valid?
      puts "champ 'email' non-nil: CHECK!"
    else 
      puts "champ 'email' non-nil: FAILED! "
    end
  end

#verifie la validité si le champs name est remplis d'espace 
#controller ->validates :name, presence: true
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid? 
    puts "champ 'name' cant be empty: CHECK!"
  end

#verifie la validité si le champs email est remplis d'espace
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid? 
    puts "champ 'email' cant be empty: CHECK!"
  end
#verifie si name a un nbr de caractere reglementaire
#controller ->length: { maximum: 50 }
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
    puts "name has reglementary length: CHECK!"
  end
#verifie si email a un nbr de caractere reglementaire / controller ->length: { maximum: 255 }
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
    puts "email has reglementary length: CHECK!"
  end
#test la validité du format sur un array d'email valide [regex dans controller]
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
    puts "email has right format: CHECK!"
  end
#test la validité du format sur un array d'email invalide
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
    puts "email has wrong format: CHECK!"
  end
#verifie que l'adresse saisie est unique
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
    puts "email is unique: CHECK!"
  end

end