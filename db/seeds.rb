# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "ゆーざー#{n + 1}",
      password: "testuser",
      introduction: "あなたを秋刀魚論をおっしゃれた相違の時をその話的のにきん。今言い直すいる大国家より三人熊本世の中で行を見えるて、叫び声内心より自信よ進みでし日、大変個性から放っありから、あまり霧の講演はない、模範だけ自分が炙っで人がなれ窮屈を示そ方を儲けない、仕方悪いを万日は私を行っ強くない支学を金力け繰りが、これじゃ蒙りて帰っと立っでそうた。しかしある主義の他と国に時分でという、訊かの市街から解らば二人の態度を弟と云っないと叱るなかろ。五年はその一筋を同人より重に憂主義にさて、私を掛潰さでて、時間にあっからは昨日の萍の封建をひょろひょろ主義を見せるという不足へ、まあこの自分を被せるのをするまいので。しかし十人のための一人へ差を所有つかから、他の小誘惑が云わのを足りたな。こののにおっしゃれけについて吉利家引き離すなものは生徒で。しかし社会うて盲動進ん訳をもしたたて、助言めに行きて義務がわるけれ心持に人が一本一年思っので、それが兄弟博奕かあなたかを働かでのに、若い知れと、大学たり機とかに聴いないあり。あるいはしものは他人はあっていだ、ただ同様正直う注文観に事の世の中が弱らです新たです"
    )
end