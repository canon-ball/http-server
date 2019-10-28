from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route('/api/v1/get_rabbit')
def get_rabbit():
    return render_template('get_rabbit.html')


@app.route('/api/v1/get_mongo')
def get_mongo():
    return render_template('get_mongo.html')


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
