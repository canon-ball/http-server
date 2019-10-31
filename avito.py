from flask import Flask
from flask import render_template

app = Flask(__name__)


@app.route('/api/v1/get_mongo')
def get_mongo():
    with open('get_mongo.sh', 'r') as f:
        content = f.read()
    return render_template('content.html', text=content)


@app.route('/api/v1/get_rabbit')
def get_rabbit():
    with open('get_rabbit.sh', 'r') as f:
        content = f.read()
    return render_template('content.html', text=content)


if __name__ == "__main__":
    app.run(host='0.0.0.0')
