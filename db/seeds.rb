# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating seed data..."



Category.create(name: "Tarih")
Category.create(name: "Sanat")
Category.create(name: "Mizah")


Book.create(name:'Kırmızı Saçlı Kadın', category_id: 2, description:"Orhan Pamuk, Yapı Kredi Yayınlarından çıkan yeni romanı.", ISBN: "9789750835605", publisher:"Yapı Kredi Yayınları" , summary:"Kırmızı Saçlı Kadın'da bizi otuz yıl önce İstanbul yakınlarındaki bir kasabada liseli bir gencin yaşadığı sarsıcı bir aşk hikâyesiyle, büyük bir insani suçun peşinden sürüklüyor.")
Book.create(name:'Senden Sonra Ben', category_id: 2, description: 'Hikâyelerin mutlu sonla bitmesi için yola devam etmek gerekir.', ISBN: "9789750836545605", publisher:"Pegasus" , summary:"Beni o kadar da sık düşünme.
Sadece iyi yaşa. Sadece yaşa... Sevgiyle, Will." )
Book.create(name:'Havvanın Üç Kızı', category_id: 1, description:"İki Farklı Kapak Seçeneğiyle Mevcuttur. Siparişinizde Stokta Mevcut Olan Kapak Seçeneği Gönderilecektir.
", ISBN:"123456787654", publisher: "Doğan Kitap",summary:"İnanca, inançsızlığa, arayışa, farklı kadınlara ve aşka dair baş döndürücü bir yolculuk... Ben ne annem gibi dindarım, ne babam gibi kâinatın, beş duyumla kavradığım şeylerden ibaret olduğuna kaniyim. ")
Book.create(name:'Kürt Mantolu Madonna', category_id: 3, description:"Her gün, daima öğleden sonra oraya gidiyor, koridorlardaki resimlere bakıyormuş gibi ağır ağır, fakat büyük bir sabırsızlıkla asıl hedefine varmak isteyen adımlarımı zorla zapt ederek geziniyor.",ISBN: "45679750835605", publisher:"Yapı Kredi Yayınları",summary:"Sabahattin Ali, bu kitabında güçlü bir tutkunun resmini çiziyor. ")
puts "Seed data created"

Author.create(name:"Adam Fawer", description:"1970 New York dogumlu yazar.")
Author.create(name:"Sabahattin Ali ", description:"25 Şubat 1907 dogumlu Türk yazar ve şair.")
Author.create(name:"Erdem Moralıoğlu ", description:" 1978 Türk-İngiliz moda tasarımcısıdır.")
