module ReservationsHelper
  
  def reserved_by_current_user(reservation)
    return true if signed_in? and reservation.email == current_user.email
    return false
  end
end
