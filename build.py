import os
import shutil

os.chdir("./webapp")

os.system("npm run build")

def copy_and_overwrite(from_path, to_path):
    if os.path.exists(to_path):
        shutil.rmtree(to_path)
    shutil.copytree(from_path, to_path)

shutil.copy('./dist/index.html','../datascience/templates/index.html')
shutil.copy('./dist/favicon.ico','../datascience/static/favicon.ico')

for i in os.listdir('./dist/static'):
    copy_and_overwrite('./dist/static/'+i,'../datascience/static/'+i)