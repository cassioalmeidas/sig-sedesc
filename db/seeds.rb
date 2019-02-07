# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Papéis de usuários
puts "Criando papéis..."
Papel.find_or_create_by(name: 'sysadmin')
Papel.find_or_create_by(name: 'admin')
Papel.find_or_create_by(name: 'operador')
Papel.find_or_create_by(name: 'visitante')

# Usuario SysAdmin

sysadmin = Usuario.find_or_create_by(username: 'cassio') do |usuario|
  pass = Devise.friendly_token.first(6)
  usuario.password = pass
  puts "Usuário SysAdmin: " + usuario.username
  puts "Senha do SysAdmin: " + pass
  usuario.add_role :sysadmin
end