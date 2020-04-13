# -*- encoding: utf-8 -*-
"""
@File    :   main.py
@Time    :   2020/03/21 08:30:15
@Author  :   Abelit
@Version :   1.0
@Contact :   ychenid@live.com
@Copyright :   (C)Copyright 2020, dataforum.org
Licence :   BSD-3-Clause
@Desc    :   None
"""

from flask import Flask, request, jsonify
from flask_jwt_extended import JWTManager
from flask_cors import CORS
from flask_restful import Api, Resource


def create_app():
    # 自定义模块
    from db import db
    from config import config

    from app.auth.views import auth as auth_blueprint
    from app.home.views import home as home_blueprint
    from app.admin.views import admin as admin_blueprint
    from app.demo.views import demo as demo_blueprint
    from app.demo.views import TodoItem, HelloWorld, TodoSimple
    from app.demo.views import api as demoapi

    # 创建flask实例对象
    _app = Flask(__name__)

    # 从config.py中导入配置信息
    _app.config.from_object(config)

    # 导入日志配置信息
    config.init_app(_app)

    # 使用flask-sqlalchemy
    db.init_app(_app)

    # 跨域设置
    cors = CORS(_app, resources={r"/*": {"origins": "*"}})

    # 创建JWT实例对象
    jwt = JWTManager(_app)

    # 注册中间件
    # app.wsgi_app = Middleware(app.wsgi_app, request.path)

    # 中间件
    @_app.before_first_request
    def before_first():
        print("app.before_first: " + request.path)

    @_app.before_request
    def process_start_request():
        print("app.before_request: " + request.path)
        # print(request.remote_addr)

    @_app.after_request
    def process_end_request(response):
        print("app.after_request: " + request.path)
        return response

    @_app.teardown_request
    def teardown(e):
        print("app.teardown: " + request.path)

    @_app.errorhandler(404)
    def not_found(error):
        return jsonify({"err": 404, "msg": "page not found"}), 404

    # 添加资源
    demoapi.add_resource(TodoItem, "/todos")
    demoapi.add_resource(HelloWorld, "/hello")
    demoapi.add_resource(TodoSimple, "/<string:todo_id>")

    # 注册自定义blueprint模块
    _app.register_blueprint(home_blueprint)
    _app.register_blueprint(admin_blueprint, url_prefix="/api/admin")
    _app.register_blueprint(auth_blueprint, url_prefix="/api/auth")
    _app.register_blueprint(demo_blueprint, url_prefix="/api/demo")

    return _app


if __name__ == "__main__":
    app = create_app()
    app.run(host="0.0.0.0")
