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
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid? 
    puts "champ 'name' cant be empty: CHECK!"
  end

#verifie la validité si le champs email est remplis d'espace
  test "name should be present" do
    @user.email = "     "
    assert_not @user.valid? 
    puts "champ 'email' cant be empty: CHECK!"
  end

end