new_users = [
    {
        first: "Matt",
        last: "Cheah",
        email: "matt.cheah@gmail.com",
        bio: "Matt Cheah is a developer in Orange County, CA, who has created Handshakes because he wants to help people. He likes binge-watching the Lord of the Rings series, eating entire pies in one sitting, and poking his cat in the tummy until she bites him.",
        password: "mattspassword",
        password_confirmation: "mattspassword"
    },
    {
        first: "Monica",
        last: "Geller",
        email: "monica@javus.com",
        bio: "Monica Geller is a chef at Javu's Restaurant in NYC. Monica volunteers her services to prepare gourmet meals for such celebrities as Jon Favreau, Tom Selleck, Jon Lovitz, and Matthew Perry. She uses handshakes to support her friends' non-profit, Relaxicab - a massage taxi service that helps transport underpriveliged people with an added bonus.",
        profilePicture: true,
        password: "monicaspassword",
        password_confirmation: "monicaspassword"
    },
    {
        first: "Mister",
        last: "Rogers",
        email: "mrrogers.@mrrogers.com",
        bio: "Mr. Rogers is basically the best person ever. He loves helping people and showing kids how to reach their full potential by being nice to every-freaking-one.",
        password: "rogerspassword",
        password_confirmation: "rogerspassword"
    }
]

new_users.each do |user_info|
    user = User.new(user_info)
    user.skip_confirmation!
    user.save!
end