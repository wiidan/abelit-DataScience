from flask import Flask, Blueprint, jsonify, request
from flask_restful import Api, Resource


demo = Blueprint('demo', __name__)

api = Api(demo)


@demo.route('/ping')
def ping():
    return jsonify({
        "ping": "Pong!",
        "ip": request.remote_addr,
        "router": request.path,
        "module": __name__
    })


class TodoItem(Resource):
    def get(self):
        return jsonify({'task': 'Say "Hello, World!"'})


class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}


todos = {}

# curl http://localhost:5000/todo1 -d "data=Remember the milk" -X PUT
# curl http://localhost:5000/todo1


class TodoSimple(Resource):
    def get(self, todo_id):
        return {todo_id: todos[todo_id]}

    def put(self, todo_id):
        todos[todo_id] = request.form['data']
        return {todo_id: todos[todo_id]}
