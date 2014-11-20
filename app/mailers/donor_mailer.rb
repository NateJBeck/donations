class DonorMailer < ActionMailer::Base
  def test_email(donor)
    @donor = donor
    pickup = Pickup.find(donor.pickup_id)
    availability_id = pickup.availability_id
    @url = "http://localhost:3000/availabilities/
      #{ availability_id }/pickups/
      #{ pickup.id }"
    mail(to: @donor.email, subject: "Testing")
  end
end
