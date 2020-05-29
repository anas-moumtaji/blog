require 'test_helper'

class UtilisateurTest < ActiveSupport::TestCase

# on commencer par creer un utilisateur qui sera utiliser dans les test a l'aide de la fonction setup
# cette fonction sera appelee automatiquement lors des tests
  def setup()
    @utilisateur = Utilisateur.new(nom: "Anas MOUMTAJI", email:"anas@example.com", password: "123456", password_confirmation: "123456" )
  end

#ce bloc de code va lancer un echec si le nom de l'utilisateur est vide
  test "nom doit etre present" do
    @utilisateur.nom = ""
    assert_not @utilisateur.valid?
  end

  test "email doit etre present" do
    @utilisateur.email = ""
    assert_not @utilisateur.valid?
  end

  test "nom ne doit pas etre trop long" do
    @utilisateur.nom = "a" * 51
    assert_not @utilisateur.valid?
  end

  test "email ne doit pas etre trop long" do
    @utilisateur.email = "a" * 244 + "@example.com"
    assert_not @utilisateur.valid?
  end

  test "email validation doit accepter les emails valides" do
    valid_adresses = %w[a@example.com AAA@foo.COM A_MA-ER@foo.bar.org
                        aaa.bbb@foo.ma aa+bbb@baz.cn]
    valid_adresses.each do |valid_adress|
    @utilisateur.email  = valid_adress
    assert @utilisateur.valid? , "#{valid_adress.inspect} doit etre valide"
  end

  test "email doit ete unique" do
    duplicate_utilisateur = @utilisateur.dup
    @utilisateur.save
    assert_not duplicate_utilisateur.valid?
  end


  test "mot de passe non vide" do
    @utilisateur.password = @utilisateur.password_confirmation = " " * 6
    assert_not @utilisateur.valid?
  end


  test "mot de passe de 6 car min" do
    @utilisateur.password = @utilisateur.password_confirmation = "a" * 6
    assert_not @utilisateur.valid?
  end

end
