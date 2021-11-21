module ApplicationHelper
  def active_navigation?(path)
    current_path = request.fullpath

    current_path.include?(path) || current_path == '/'
  end

  def data_images(user)
    user.images.map do |image|
      {
        image: url_for(image.file),
        subtitule: image.caption,
      }
    end
  end

  def banks_used(user)
    user.accounts.map do |account|
      {
        bank_name: account.bank.name,
        account_id: account.id,
      }
    end
  end


  def acknowledgments(user)
    acknowledgments_coffees = user.coffees.map do |coffee|
      {
        type: :coffee,
        name: coffee.name,
        occupation: coffee.occupation,
        message: coffee.message,
        quantity: coffee.quantity,
      }
    end

    acknowledgments_coffees
  end
end
