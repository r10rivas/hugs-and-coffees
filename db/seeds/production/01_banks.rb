banks = [
  'Banesco Banco Universal',
  'Banco Mercantil C.A.',
  'Banco Del Tesoro',
  'Banco De venezuela',
]

banks.each do |bank|
  Bank.find_or_create_by!(name: bank)
end
