# -*- encoding: utf-8 -*-
"""
@File    :   manage.py
@Time    :   2020/03/23 10:22:20
@Author  :   Abelit 
@Version :   1.0
@Contact :   ychenid@live.com
@Copyright :   (C)Copyright 2020, dataforum.org
@Licence :   BSD-3-Clause
@Desc    :   None
"""


from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand

from main import create_app
from db import db

app = create_app()

# Create Manager Object
manager = Manager(app)

# create Migrate Object
migrate = Migrate(app, db)

# Add database migrate command
manager.add_command("db", MigrateCommand)

# Add custom command and option
@manager.option("-n", "--name", dest="name", default="www.baidu.com")
def hello(name):
    print("hello world!")
    print(name)


@manager.option("-n", "--name", dest="name", default="www.baidu.com")
def world(name):
    print("haha")


if __name__ == "__main__":
    manager.run()
