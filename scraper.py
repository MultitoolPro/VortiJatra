import requests, json, os
from bs4 import BeautifulSoup
import firebase_admin
from firebase_admin import credentials, messaging

# Firebase
key_json = json.loads(os.environ['FIREBASE_KEY'])
cred = credentials.Certificate(key_json)
if not firebase_admin._apps:
    firebase_admin.initialize_app(cred)

def send_fcm(title, body):
    msg = messaging.Message(
        notification=messaging.Notification(title=title, body=body),
        topic="ALL",
    )
    messaging.send(msg)
    print(f"FCM Sent: {title}")

# পুরনো notices.json লোড
try:
    old_data = json.load(open('notices.json'))
except:
    old_data = []

old_titles = [n['title'] for n in old_data]
new_notices = []

# DU চেক
try:
    r = requests.get("https://admission.eis.du.ac.bd", timeout=15)
    soup = BeautifulSoup(r.text, 'html.parser')
    title = soup.title.string.strip() if soup.title else "DU Notice"
    if title not in old_titles:
        new_notices.append({"title": title, "source": "DU", "link": "https://admission.eis.du.ac.bd"})
except Exception as e:
    print("DU Error", e)

# নতুন পাইলে FCM + notices.json আপডেট
if new_notices:
    for n in new_notices:
        send_fcm(n['title'], "নতুন ভর্তি বিজ্ঞপ্তি প্রকাশিত! এখনই দেখুন।")
        old_data.append(n)
    json.dump(old_data, open('notices.json','w'), ensure_ascii=False, indent=2)
    print("New notices saved")
else:
    print("No new notice")
