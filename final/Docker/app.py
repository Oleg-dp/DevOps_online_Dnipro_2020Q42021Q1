from flask import Flask, render_template
import random

app = Flask(__name__)

# list of dachshund images
images = [
	"https://st2.depositphotos.com/1004199/5923/i/950/depositphotos_59234923-stock-photo-miniature-dachshund.jpg",
	"https://st.depositphotos.com/1057741/1811/i/950/depositphotos_18115829-stock-photo-three-dachshund-dogs.jpg",
	"https://st.depositphotos.com/1625039/4018/i/950/depositphotos_40185471-stock-photo-valentine-puppy.jpg",
	"https://static8.depositphotos.com/1057741/905/i/950/depositphotos_9057148-stock-photo-red-and-black-dachshund-dogs.jpg",
	"https://static8.depositphotos.com/1581865/1054/i/950/depositphotos_10542416-stock-photo-dachshund.jpg",
	"https://st2.depositphotos.com/2278569/6358/i/950/depositphotos_63589059-stock-photo-dachshund-with-tulips.jpg",
	"https://static9.depositphotos.com/1683337/1163/i/950/depositphotos_11635383-stock-photo-pair-of-smooth-haired-dachshunds.jpg",
	"https://static3.depositphotos.com/1000951/138/i/950/depositphotos_1381811-stock-photo-dachshund-puppy.jpg",
	"https://st.depositphotos.com/1003366/1899/i/950/depositphotos_18998553-stock-photo-dog-dachshund.jpg",
	"https://static3.depositphotos.com/1000647/131/i/950/depositphotos_1314958-stock-photo-puppy-dachshund.jpg",
	"https://st.depositphotos.com/1625039/4775/i/950/depositphotos_47758819-stock-photo-dachshund-puppies.jpg",
	"https://static9.depositphotos.com/1625039/1110/i/950/depositphotos_11106264-stock-photo-dachshund.jpg",
	"https://static9.depositphotos.com/1043073/1073/i/950/depositphotos_10738727-stock-photo-dachshund.jpg",
	"https://st2.depositphotos.com/4472485/6604/i/950/depositphotos_66046953-stock-photo-dachshund-dog-running.jpg",
	"https://st2.depositphotos.com/2547911/5366/i/950/depositphotos_53660077-stock-photo-brown-dachshund-on-white-background.jpg",
	"https://static3.depositphotos.com/1001686/138/i/950/depositphotos_1387356-stock-photo-happy-dachshund-dog-in-park.jpg",
	"https://st2.depositphotos.com/4963073/7513/i/950/depositphotos_75133023-stock-photo-black-dog-on-a-black.jpg",
	"https://st2.depositphotos.com/1005721/7666/i/950/depositphotos_76666003-stock-photo-dog-read-book-animal-education.jpg",
	"https://static9.depositphotos.com/1625039/1110/i/950/depositphotos_11106462-stock-photo-dachshund-puppy.jpg",
	"https://static9.depositphotos.com/1625039/1128/i/950/depositphotos_11285928-stock-photo-dachshund.jpg"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
