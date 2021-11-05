banks = [
  'Banesco Banco Universal',
  'Banco MercantilC.A.',
  'Banco Del Tesoro',
]

banks.each do |bank|
  Bank.find_or_create_by!(name: bank)
end
