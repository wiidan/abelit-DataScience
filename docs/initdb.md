# Drop All database's tables
```
python3 manage.py shell

from models import *
from db import db
db.drop_all() 
```

# 创建表
```
python3 manage.py db init

python3 manage.py db migrate

python3 manage.py db upgrade
```

# 插入测试数据
```python
python3 manage.py shell

from models import *
from db import db
from werkzeug.security import generate_password_hash, check_password_hash

g1 = Group(name='超级管理员组',alias='Super Admin')  
g2 = Group(name='管理员组',alias='Admin') 
g3 = Group(name='匿名用户组',alias='Anonymous') 
db.session.add_all([g1,g2,g3])
db.session.commit()


g4 = Group(name='dev',alias='dev') 
g4.pid = g2.id
g5 = Group(name='ops',alias='ops') 
g5.pid = g2.id
db.session.add_all([g4,g5])
db.session.commit()

p1 = Position(name='超级管理员',alias='Super Admin')  
p2 = Position(name='管理员',alias='Admin') 
p3 = Position(name='匿名用户',alias='Anonymous') 
db.session.add_all([p1,p2,p3])
db.session.commit()

u1 = User(name='superadmin',alias='superadmin',surname='超级管理员',email='superadmin@live.com',passwd=generate_password_hash('superadmin'),gender=1,type=0)
u1.groups = g1
u1.positions = p1 
u2 = User(name='admin',alias='admin',surname='管理员',email='admin@live.com',passwd=generate_password_hash('admin'),gender=1,type=1)  
u2.groups = g2
u2.positions = p2 
u3 = User(name='anonymous',alias='anonymous',surname='匿名用户',email='anonymous@live.com',passwd=generate_password_hash('anonymous'),gender=1,type=3)  
u3.groups = g3
u3.positions = p3 
db.session.add_all([u1,u2,u3])
db.session.commit()


g10 = Group(name='信息部',alias='IT')  
g11 = Group(name='财务部',alias='Finance') 
db.session.add_all([g10,g11])
db.session.commit()

g21 = Group(name='会计',alias='account') 
g21.pid = g11.id
g22 = Group(name='出纳',alias='chuna') 
g22.pid = g11.id
db.session.add_all([g21,g22])
db.session.commit()

p10 = Position(name='经理',alias='Manager')  
p11 = Position(name='主管',alias='Supervisor') 
p12 = Position(name='助理',alias='Assistant') 
db.session.add_all([p10,p11,p12])
db.session.commit()

u10 = User(name='chenying',alias='chenying',surname='陈英',email='ychenid@live.com',passwd=generate_password_hash('123'),gender=1)
u10.groups = g10
u10.positions = p12  
u11 = User(name='xiaodawei',alias='xiaodawei',surname='肖大伟',email='xiaodawei@live.com',passwd=generate_password_hash('123'),gender=1)  
u11.groups = g10
u11.positions = p11 
u12 = User(name='shinidan',alias='shinidan',surname='史尼丹',email='shinidan@live.com',passwd=generate_password_hash('123'),gender=1)  
u12.groups = g10
u12.positions = p10  
db.session.add_all([u10,u11,u12])
db.session.commit()


# 添加菜单
m1 = Menu(name='首页', alias='Home',module='Home',url='/',icon='mdi-home',order=0)
m2 = Menu(name='系统管理', alias='System',module='System',url='/admin',icon='mdi-admin',order=1)
db.session.add_all([m1,m2])
db.session.commit()

m3 = Menu(name='权限', alias='Right',module='Right',url='/right',icon='mdi-rights',order=0)
m3.pid = m2.id
m4 = Menu(name='用户', alias='User',module='User',url='/user',icon='mdi-account',order=1)
m4.pid = m2.id
db.session.add_all([m3,m4])
db.session.commit()

# 添加权限
per1 = Permission(type=1)
per2 = Permission(type=1)
per3 = Permission(type=1)
db.session.add_all([per1,per2,per3])
db.session.commit()

#菜单权限
per1.menus = [m1]
per2.menus = [m2]
db.session.add_all([per1,per2]) 
db.session.commit()

#添加角色
r1 = Role(name='IT经理', alias='IT Manager')
r2 = Role(name='IT主管', alias='IT Supervisor')
r3 = Role(name='IT助理', alias='IT Assistant')
db.session.add_all([r1,r2,r3])
db.session.commit()

#给用户添加角色
u1 = User.query.filter_by(name='chenying').first()
u1.roles = [r1,r2]  
db.session.add(u1) 
db.session.commit()

#给用户添加权限
u100 = User.query.filter_by(name='chenying').first()
u100.permissions = [per1]
db.session.add(u100) 
db.session.commit()


#给角色添加权限
r100 = Role.query.filter_by(name='IT经理').first()
r100.permissions = [per2]
db.session.add(r100) 
db.session.commit()
```
