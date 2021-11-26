module AcknowledgmentsHelper
  def acknowledgments(user)
    acknowledgments_coffees = user.coffees.map do |coffee|
      {
        type: :coffee,
        name: coffee.name,
        occupation: coffee.occupation,
        message: coffee.message,
        quantity: coffee.quantity,
        created_at: coffee.created_at
      }
    end

    acknowledgments_hugs = user.hugs.map do |hug|
      {
        type: :hug,
        duration: hug.duration,
        name: hug.name,
        occupation: hug.occupation,
        message: hug.message,
        created_at: hug.created_at
      }
    end

    acknowledgments = acknowledgments_coffees + acknowledgments_hugs
    acknowledgments.sort_by{ |obj| obj[:created_at] }.reverse
  end
end
