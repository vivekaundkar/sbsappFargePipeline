from flask import Flask, render_template, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/message')
def get_message():
    private_ip = request.remote_addr
    current_time = datetime.now().strftime('%Y/%m/%d %H:%M:%S')
    message = f"Date on Webserver IP Address {private_ip} is {current_time}"
    return jsonify({'message': message})

@app.route('/api/date')
def get_date():
    current_date = datetime.now().strftime('%Y/%m/%d %H:%M:%S')
    return jsonify({'date': current_date})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
