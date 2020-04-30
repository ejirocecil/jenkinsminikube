from flask import Flask
from flask import make_response

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1 style='color:purple'>VGG to the world!</h1>"

@app.route('/<page_name>')
def other_page(page_name):
    response = make_response('The page named %s does not exist.' %page_name, 404)
    return response

if __name__ == '__main__':
    app.run(port=8080)
